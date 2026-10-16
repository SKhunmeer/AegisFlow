FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY aegisflow ./aegisflow
COPY migrations ./migrations
COPY alembic.ini pyproject.toml ./

CMD ["uvicorn", "aegisflow.app.main:app", "--host", "0.0.0.0", "--port", "8000"]
