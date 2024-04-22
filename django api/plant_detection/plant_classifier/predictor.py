from tensorflow.keras.models import load_model
from PIL import Image
import numpy as np
from django.http import HttpResponse

saved_model = load_model('final_model.h5')
class_names = ['Aloevera', 'Bamboo', 'Betel', 'Guava', 'Mint', 'Neem', 'Papaya', 'Pomogranate', 'Rose', 'Tulsi']

def predict_plant(image_path):
    test_image = Image.open(image_path)
    test_image = test_image.resize((224, 224))
    test_image = np.array(test_image)
    test_image = np.expand_dims(test_image, axis=0)

    result = saved_model.predict(test_image)
    predicted_class_index = np.argmax(result)
    predicted_class = class_names[predicted_class_index]
    confidence_score = result[0][predicted_class_index]

    if confidence_score >= 0.7:
        return predicted_class, confidence_score
    else:
        return None

