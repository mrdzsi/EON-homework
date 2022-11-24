#  Real World App in Azure with Terraform

How to run the app locally can be found on main branch README. 

Manual steps taken to deploy the app to Azure Container Instance: 

- Creating Dockerfile & main.tf

- Build & push image to Docker Hub:
  ```bash
  docker build -t mrdzsi/eon-homework .
  docker push mrdzsi/eon-homework
  ```
- Changed DJANGO_SETTINGS_MODULE from *production* to *local* in [manage.py](./manage.py), [asgi.py](./realworld/config/asgi.py) and [wsgi.py](./realworld/config/wsgi.py) files.
  ```python
  os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'realworld.config.settings.local')
  ```

- IaC:
  ```bash
  terraform fmt
  terraform init
  terraform apply
  ```
