FROM python:3.10-alpine

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt --no-cache-dir

EXPOSE 5000

CMD ["flask", "run"]
