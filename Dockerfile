# Use the official Python image from the Docker Hub
FROM python:3.10

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Set the environment variables
ENV PYTHONUNBUFFERED=1

# Run the application
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
