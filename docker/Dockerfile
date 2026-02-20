FROM debian:12

WORKDIR /app

RUN apt update && apt install -y python3 python3-pip python3-venv

# Create virtual environment
RUN python3 -m venv /venv

# Activate venv and install Flask
RUN /venv/bin/pip install flask

# Copy application
COPY ../app /app

# Use venv python to run app
CMD ["/venv/bin/python", "app.py"]
