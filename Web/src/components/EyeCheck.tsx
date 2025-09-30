import React, { useState } from "react";
import "./EyeCheck.css";

const EyeCheck: React.FC = () => {
  const [uploadedImage, setUploadedImage] = useState<string | null>(null);
  const [result, setResult] = useState<"healthy" | "sick" | null>(null);

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files[0]) {
      const file = e.target.files[0];

      if (!file.type.match("image.*")) {
        alert("Please select an image file only");
        return;
      }

      const reader = new FileReader();
      reader.onload = (ev) => {
        setUploadedImage(ev.target?.result as string);
        setResult(null);
      };
      reader.readAsDataURL(file);
    }
  };

  const handleCheck = () => {
    if (!uploadedImage) {
      alert("Please upload an image first");
      return;
    }

    // 👀 Later you can connect this with an API
    const isHealthy = Math.random() > 0.5;
    setResult(isHealthy ? "healthy" : "sick");
  };

  return (
    <div className="eyecheck-container">
      <div className="eyecheck-header">
        <h1>Medical Eye Check</h1>
        <h2>Upload your eye image for analysis</h2>
      </div>

      <div className="eyecheck-content">
        <div className="eyecheck-section">
          <h2 className="eyecheck-section-title">Upload Image</h2>
          <p className="eyecheck-instruction">
            Please upload a clear image of your eye for the check
          </p>

          <div
            className="eyecheck-upload-area"
            onClick={() => document.getElementById("file-input")?.click()}
          >
            <i>📁</i>
            <p>Drag & drop an image here or click to select</p>
            <div className="eyecheck-upload-btn">Choose Image</div>
            <input
              type="file"
              id="file-input"
              accept="image/*"
              style={{ display: "none" }}
              onChange={handleFileChange}
            />
          </div>

          {uploadedImage && (
            <div className="eyecheck-preview-container">
              <p className="eyecheck-preview-title">Uploaded Image:</p>
              <img
                id="image-preview"
                src={uploadedImage}
                alt="Image Preview"
              />
            </div>
          )}
        </div>

        <div className="eyecheck-section">
          <h2 className="eyecheck-section-title">Result</h2>
          <div className="eyecheck-result-container">
            <h3 className="eyecheck-result-title">Check Result:</h3>

            {result && (
              <>
                <div
                  className={`eyecheck-accuracy ${
                    result === "healthy"
                      ? "eyecheck-healthy"
                      : "eyecheck-sick"
                  }`}
                >
                  Accuracy: 94%
                </div>

                {result === "sick" && (
                  <div className="eyecheck-message eyecheck-sick-message">
                    <strong>Sick!</strong>
                    <br />
                    Please visit a doctor
                  </div>
                )}

                {result === "healthy" && (
                  <div className="eyecheck-message eyecheck-healthy-message">
                    <strong>Healthy</strong>
                    <br />
                    Thank you, we wish you good health
                  </div>
                )}
              </>
            )}
          </div>
        </div>

        <button
          className="eyecheck-button"
          onClick={handleCheck}
          disabled={!uploadedImage}
        >
          Check Result
        </button>
      </div>
    </div>
  );
};

export default EyeCheck;
