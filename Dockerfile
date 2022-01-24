FROM python:3.7.3-slim-stretch

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir /app

RUN apt update && apt upgrade -y && \
    apt install gcc default-libmysqlclient-dev -y && \
    pip install --upgrade pip
WORKDIR /app

COPY . /app/
RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]