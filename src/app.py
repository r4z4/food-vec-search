import os
from flask import Flask, render_template
from flask import request
import joblib
import pandas as pd
import numpy as np
import json
from neural_searcher import NeuralSearcher

app = Flask(__name__)

# Create an instance of the neural searcher
neural_searcher = NeuralSearcher(collection_name='ne_reviews')

def search_food(q: str):
    return {
        "result": neural_searcher.search(text=q)
    }

@app.route('/')
def index():
    return render_template('search.html')

@app.route('/search')
def search():
    return render_template('search.html')

@app.route('/result', methods=['POST'])
def result():

    if request.method == 'POST':
        search_term = request.form['search']
        result = search_food(search_term)
        return render_template('result.html', result=result)

    return render_template('index.html')

app.run(host="0.0.0.0", port=3001)

    

