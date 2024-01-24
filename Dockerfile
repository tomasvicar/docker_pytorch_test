# Use the PyTorch image as the base
FROM pytorch/pytorch:latest

# Set the working directory in the container to /workspace
WORKDIR /workspace


# Install Python, Jupyter and Git
RUN apt-get update && \
    apt-get install -y git && \
    pip install --no-cache-dir jupyter && \
    rm -rf /var/lib/apt/lists/*

# (Optional) If you have additional dependencies in a requirements.txt file
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Command to run when starting the container
CMD ["bash"]