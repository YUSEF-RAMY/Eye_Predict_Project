from fastapi import FastAPI, UploadFile, File
from fastapi.responses import JSONResponse
from tensorflow.keras.models import load_model, Model
from scipy.spatial.distance import mahalanobis
from PIL import Image
import numpy as np
import os
import io

# ===== 1) تحميل الموديل =====
MODEL_PATH = 'model_ResNet50.h5'
class_names = ['cataract', 'diabetic_retinopathy', 'glaucoma', 'normal']

base_model = load_model(MODEL_PATH)
feature_model = Model(inputs=base_model.input, outputs=base_model.layers[-2].output)

# ===== 2) class stats & thresholds =====
STATS_DIR = r"C:\Users\hi883\OneDrive\Desktop\Test_Final_Project\AI\class_stats"
class_stats = {
    cls: {
        'mean': np.load(os.path.join(STATS_DIR, f'{cls}_mean.npy')),
        'inv_cov': np.load(os.path.join(STATS_DIR, f'{cls}_inv_cov.npy'))
    } for cls in class_names
}

thresholds_95 = {
    'cataract': 20.7965,
    'diabetic_retinopathy': 16.2871,
    'glaucoma': 18.2453,
    'normal': 17.0693
}


# ===== 3) دالة التنبؤ =====
def predict_image_array(img_array):
    x = img_array / 255.0
    x = np.expand_dims(x, axis=0)

    feat = feature_model.predict(x, verbose=0)[0]

    distances = {}
    for cls in class_stats.keys():
        mean = class_stats[cls]['mean']
        inv_cov = class_stats[cls]['inv_cov']
        distances[cls] = mahalanobis(feat, mean, inv_cov)

    belonging_classes = [cls for cls, d in distances.items() if d <= thresholds_95[cls]]

    if len(belonging_classes) == 0:
        return "This is not an eye X-ray image", distances
    elif len(belonging_classes) == 1:
        return belonging_classes[0], distances
    else:
        best_cls = min(belonging_classes, key=lambda c: distances[c])
        return best_cls, distances


# ===== 4) إنشاء FastAPI =====
app = FastAPI(title="Eye Disease Classifier API")


@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    try:
        # التحقق إن الملف صورة
        if not file.content_type.startswith("image/"):
            return JSONResponse({"error": "Uploaded file is not an image. Please upload a valid image file."})

        # قراءة الصورة من الـ bytes
        contents = await file.read()
        try:
            img = Image.open(io.BytesIO(contents)).convert("RGB")
        except Exception:
            return JSONResponse({"error": "Cannot open image. Make sure it is a valid image file (JPG/PNG)."})

        img = img.resize((224, 224))
        img_array = np.array(img)

        pred_class, distances = predict_image_array(img_array)
        distances = {k: float(f"{v:.4f}") for k, v in distances.items()}

        return JSONResponse({
            "filename": file.filename,
            "predicted_class": pred_class,
            "distances": distances
        })

    except Exception as e:
        return JSONResponse({"error": str(e)})
