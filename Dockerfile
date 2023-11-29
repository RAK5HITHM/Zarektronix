FROM python:3.6.4-alpine3.7

WORKDIR /app

COPY ./src/ /app/

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]