FROM python:3.11

WORKDIR /data

# Install dependencies from requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Expose the Django port
EXPOSE 8000
# Run the development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


