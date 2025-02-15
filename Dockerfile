# Use Python 3.12 slim Bookworm base image
FROM python:3.12-slim-bookworm

# Set the working directory
WORKDIR /app

# Install system dependencies (Node.js and npm)
RUN apt-get update && apt-get install -y nodejs npm && apt-get clean

# Copy the application code to the container
COPY . .

# Install Python dependencies directly, including requests
RUN pip install --no-cache-dir uvicorn fastapi pandas numpy faker matplotlib seaborn scikit-learn requests

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
