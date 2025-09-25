from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from PIL import Image
import numpy as np
import io
from tensorflow.keras.models import load_model
from tensorflow.keras.applications.resnet50 import preprocess_input
import uvicorn

# ثبّت ترتيب الكلاسات بالضبط زي ما تم التدريب عليه
class_names = ['Cataract', 'Diabetic Retinopathy', 'Glaucoma', 'Normal']

# حمل الموديل
model = load_model("model_ResNet50.h5")

# إعداد التطبيق
app = FastAPI(
    title="Eye Disease Classification API",
    description="API for classifying eye diseases from retinal images with confidence filtering"
)

# السماح بالوصول من أي دومين (CORS)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

def preprocess_and_predict(image_data):
    """تحضير الصورة للتنبؤ"""
    image = Image.open(io.BytesIO(image_data)).convert('RGB')
    image = image.resize((224, 224))
    img_np = np.array(image, dtype='float32')
    img_np = preprocess_input(img_np)          # preprocess الصحيح لـ ResNet50
    img_batch = np.expand_dims(img_np, axis=0)
    return img_batch

@app.post("/predict/")
async def predict_single_eye(image: UploadFile = File(...)):
    # تأكيد أن الملف صورة
    if not image.content_type.startswith('image/'):
        raise HTTPException(status_code=400, detail="Uploaded file must be an image")

    contents = await image.read()
    img_batch = preprocess_and_predict(contents)
    probs = model.predict(img_batch, verbose=0)[0]

    predicted_index = int(np.argmax(probs))
    confidence = float(probs[predicted_index])

    # 🔹 فلترة بالثقة: لو أقل من 0.6 رجّع Unknown
    threshold = 0.6
    if confidence < threshold:
        return {
            "predicted_class": "Unknown",
            "confidence": confidence,
            "all_predictions": {class_names[i]: float(p) for i, p in enumerate(probs)}
        }

    return {
        "predicted_class": class_names[predicted_index],
        "confidence": confidence,
        "all_predictions": {class_names[i]: float(p) for i, p in enumerate(probs)}
    }

@app.get("/")
async def root():
    return {
        "message": "Enhanced Eye Disease Classification API",
        "status": "active",
        "features": [
            "Disease classification",
            "Confidence analysis",
            "Low-confidence filter"
        ]
    }

@app.get("/classes")
async def get_classes():
    return {"classes": class_names}

if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8000)
