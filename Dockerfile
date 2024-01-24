# Use the PyTorch image as the base
FROM pytorch/pytorch:latest

# Copy requirements.txt file into the container
COPY requirements.txt /tmp/

# Install packages from requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Set a default command to be executed
# when a container is run from this image
CMD ["bash"]