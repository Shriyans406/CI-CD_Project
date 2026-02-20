#!/bin/bash

echo "Starting build process..."

echo "Navigating to project root directory..."
cd ..

echo "Activating virtual environment..."
source venv/bin/activate

echo "Checking Python version..."
python --version

echo "Checking Flask installation..."
pip show flask

echo "Build process completed successfully."
