FROM python:3.9
COPY ./app/requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./app /app
CMD ["uvicorn", "app.findus_server:app", "--host", "0.0.0.0", "--port", "8004"]

