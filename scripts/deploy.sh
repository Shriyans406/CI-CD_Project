#!/bin/bash

echo "Starting deployment process..."

echo "Navigating to project root directory..."
cd ..

echo "Activating virtual environment..."
source venv/bin/activate

echo "Navigating to app directory..."
cd app

echo "Starting application..."
python app.py &
