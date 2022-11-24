# base image  
FROM python:3.9-slim as builder

# Keeps Python from generating .pyc files in the container 
ENV PYTHONDONTWRITEBYTECODE 1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1  

# Install OS-level dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc

# Create the virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Python dependencies
WORKDIR /eon
COPY requirements ./requirements
COPY requirements.txt .
RUN pip3 install -r requirements.txt

## Final stage ## 
FROM python:3.9-slim

# Copy the virtual environment
COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Copy in the application
WORKDIR /eon
COPY . .

# start server  
CMD python manage.py runserver 0.0.0.0:80