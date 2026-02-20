FROM debian:12

WORKDIR /app

RUN apt update && apt install -y python3 python3-pip

RUN pip3 install flask

COPY ../app /app

CMD ["python3", "app.py"]
