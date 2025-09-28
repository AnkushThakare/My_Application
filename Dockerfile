# Use Python 3.11 base image
FROM python:3.11

# Set working directory
WORKDIR /app

# Copy app code
COPY app.py .

# Install Flask
RUN pip install flask

# Expose port 5000
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
