FROM python
WORKDIR /app
COPY . .
RUN apt update && apt install -y python3-virtualenv sqlitebrowser
RUN pip install -r requirements.txt
RUN python3 manage.py migrate
EXPOSE 8000:8000
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
