from flask import Flask, render_template, request, redirect, url_for
import os
import tensorflow as tf
from tensorflow.keras.preprocessing import image
import numpy as np
import mysql.connector

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'static/uploads/'

model = tf.keras.models.load_model('models/crop_disease_classification_model.h5')

db_config = {
    'host': 'localhost',
    'user': 'root',  
    'password': 'gugu@333banku@333',  
    'database': 'crop_diseases'  
}

def get_db_connection():
    conn = mysql.connector.connect(**db_config)
    return conn

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/aboutus')
def about_us():
    return render_template('aboutus.html')

@app.route('/features')
def features():
    return render_template('features.html')

@app.route('/contact')
def contact():
    return render_template('contact.html')

@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        file = request.files['file']
        if file:
            filename = file.filename
            filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            file.save(filepath)
            
            img = image.load_img(filepath, target_size=(150, 150))
            img_array = image.img_to_array(img)
            img_array = np.expand_dims(img_array, axis=0)
            img_array /= 255.0 
            
            prediction = model.predict(img_array)
            predicted_class = np.argmax(prediction, axis=1)
            
            class_labels = [
                'Apple___Apple_scab',
                'Apple___Black_rot',
                'Apple___Cedar_apple_rust',
                'Apple___healthy', 
                'Blueberry___healthy', 
                'Cherry_(including_sour)___Powdery_mildew', 
                'Cherry_(including_sour)___healthy', 
                'Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot', 
                'Corn_(maize)___Common_rust_', 
                'Corn_(maize)___Northern_Leaf_Blight', 
                'Corn_(maize)___healthy', 
                'Grape___Black_rot', 
                'Grape___Esca_(Black_Measles)', 
                'Grape___Leaf_blight_(Isariopsis_Leaf_Spot)', 
                'Grape___healthy', 
                'Orange___Haunglongbing_(Citrus_greening)', 
                'Peach___Bacterial_spot', 
                'Peach___healthy', 
                'Pepper,_bell___Bacterial_spot', 
                'Pepper,_bell___healthy', 
                'Potato___Early_blight', 
                'Potato___Late_blight', 
                'Potato___healthy', 
                'Raspberry___healthy', 
                'Soybean___healthy', 
                'Squash___Powdery_mildew', 
                'Strawberry___Leaf_scorch', 
                'Strawberry___healthy', 
                'Tomato___Bacterial_spot', 
                'Tomato___Early_blight', 
                'Tomato___Late_blight', 
                'Tomato___Leaf_Mold', 
                'Tomato___Septoria_leaf_spot', 
                'Tomato___Spider_mites Two-spotted_spider_mite', 
                'Tomato___Target_Spot', 
                'Tomato___Tomato_Yellow_Leaf_Curl_Virus', 
                'Tomato___Tomato_mosaic_virus', 
                'Tomato___healthy'
            ]
            
            predicted_label = class_labels[predicted_class[0]]
            
            conn = get_db_connection()
            cursor = conn.cursor(dictionary=True)
            cursor.execute('SELECT * FROM diseases WHERE name = %s', (predicted_label,))
            disease = cursor.fetchone()
            cursor.close()
            conn.close()
            
            if disease:
                return render_template('result.html', 
                                     disease_name=disease['name'], 
                                     disease_info=disease['info'], 
                                     disease_solution=disease['solution'], 
                                     image_url=filepath)
            else:
                return render_template('result.html', 
                                     error="No information found for this disease.", 
                                     image_url=filepath)
    
    return render_template('upload.html')

if __name__ == '__main__':
    app.run(debug=True)