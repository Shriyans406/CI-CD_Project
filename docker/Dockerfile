FROM debian:12

WORKDIR /app

# Install Python
RUN apt update && apt install -y python3 python3-pip python3-venv \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Create virtual environment
RUN python3 -m venv /venv

# Install Flask inside venv
RUN /venv/bin/pip install --no-cache-dir flask

# Copy application correctly from root context
COPY app/ /app/

EXPOSE 5000

# Run app using venv Python
CMD ["/venv/bin/python", "app.py"]
