from django.shortcuts import render
from django.http import JsonResponse
from .predictor import predict_plant

class_names = ['Aloevera', 'Bamboo', 'Betel', 'Guava', 'Mint', 'Neem', 'Papaya', 'Pomogranate', 'Rose', 'Tulsi']
def predict(request):
    if request.method == 'POST':
        try:
            uploaded_file = request.FILES['image']

            if uploaded_file:
                prediction_result = predict_plant(uploaded_file)
                
                # if isinstance(prediction_result, tuple):
                if (prediction_result != None):
                    predicted_class, confidence_score = prediction_result
                    confidence_score = float(confidence_score)
                    return JsonResponse({'prediction': predicted_class, 'confidence': confidence_score},status=200)
                else:
                    return JsonResponse({'error': "unable to predict",},status=404)
            else:
                return JsonResponse({'error': 'No image file uploaded'}, status=400)
        except  Exception:
                return JsonResponse({'error': 'No image file uploaded'}, status=400)

def home(request):
    return render(request, 'index.html')