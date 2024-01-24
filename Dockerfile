# Use the PyTorch image as the base
FROM pytorch/pytorch:latest

# Set the working directory in the container to /workspace
WORKDIR /workspace

# Install Python, Jupyter, and Git
RUN apt-get update && \
    apt-get install -y git && \
    pip install --no-cache-dir jupyter && \
    rm -rf /var/lib/apt/lists/*

# (Optional) If you have additional dependencies in a requirements.txt file
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Jupyter will run on
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
