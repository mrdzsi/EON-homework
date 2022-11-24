# base image  
FROM python:3.8

# Keeps Python from generating .pyc files in the container 
ENV PYTHONDONTWRITEBYTECODE 1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1  

WORKDIR /app
COPY . .  

# Upgrade pip 
RUN pip install --upgrade pip  

# install all dependencies  
RUN pip install -r requirements.txt

# # port where the Django app runs  
EXPOSE 8000  

# start server  
CMD python manage.py runserver 0.0.0.0:80