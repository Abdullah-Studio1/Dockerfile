# Use an official Python image
FROM python:3.9

# Set working directory
WORKDIR /app

# Install system dependencies (if needed)
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements.txt into the container
COPY requirements.txt /app/

# Install Python packages from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install JupyterLab
RUN pip install --no-cache-dir jupyterlab

# Expose the JupyterLab port
EXPOSE 8888

# Run JupyterLab with root access
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
