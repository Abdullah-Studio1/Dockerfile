# Use an official Python image
FROM python:3.9

# Set working directory
WORKDIR /app

# Install system dependencies (for scientific computing and general use)
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    curl \
    git \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Install JupyterLab
RUN pip install --no-cache-dir jupyterlab

# Install additional Python libraries (data science, AI, web scraping)
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    matplotlib \
    seaborn \
    scikit-learn \
    scipy \
    tensorflow \
    keras \
    torch torchvision torchaudio \
    flask \
    requests \
    beautifulsoup4 \
    lxml \
    tqdm \
    ipywidgets \
    openpyxl \
    xlrd

# Expose JupyterLab default port
EXPOSE 8888

# Run JupyterLab with root access and disable authentication (for public access)
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
