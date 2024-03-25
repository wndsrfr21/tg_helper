# Use the official Python image from the Docker Hub
FROM python:latest

# Install SQLite
RUN apt-get update && apt-get install -y sqlite3

# Verify the SQLite installation
RUN sqlite3 --version

# Set the working directory in the container
WORKDIR /app

# Clone an example open GitHub repository
# Replace the URL with the specific repository you want to clone
RUN git clone https://github.com/wndsrfr21/tg_helper.git

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

#COPY . .


# The command to run your application
# CMD ["python3", "./your-app.py"]
# CMD [ "python", "./your-daemon-or-script.py" ]


# Build the image locally
# docker build -t my-python-app .

# This will keep the container running, allowing you to exec into it and use SQLite
CMD ["tail", "-f", "/dev/null"]
