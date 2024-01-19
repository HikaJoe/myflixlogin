# Use an official Python runtime as a parent image
FROM python:3.11.7

# Set the working directory to /app
WORKDIR /Login

# Copy the current directory contents into the container at /app
COPY . /Login

#latest version of pip
RUN pip install --upgrade pip

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


# Make port 80 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=Login.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run app.py when the container launches
CMD ["flask", "run"]
