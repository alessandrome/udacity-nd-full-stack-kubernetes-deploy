FROM python:stretch

COPY . /
COPY ./config.example.py /config.py
COPY ./env_file.example /env_file
WORKDIR /

RUN pip install --upgrade pip
RUN pip install -r ./requirements.txt

EXPOSE 8080

ENTRYPOINT ["gunicorn", "-b :8080", "main:APP"]