# Use the official Python image from the Docker Hub
FROM python:latest

# Set the working directory in the container
WORKDIR /app

# Clone an example open GitHub repository
# Replace the URL with the specific repository you want to clone
RUN git clone https://github.com/example/example.git

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Your application's setup could go here
# e.g., RUN pip3 install -r requirements.txt

# The command to run your application
# CMD ["python3", "./your-app.py"]
# CMD [ "python", "./your-daemon-or-script.py" ]


#Build the image locally
  # docker build -t my-python-app .
