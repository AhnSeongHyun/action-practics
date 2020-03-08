FROM python:3.8.1-slim-buster

RUN pip install -U pip

RUN apt-get update && apt-get install -y build-essential gcc


WORKDIR /wheels
COPY requirements.txt .

RUN pip install -r requirements.txt
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY src src
ENTRYPOINT ["python"]
CMD ["src/main.py"]


