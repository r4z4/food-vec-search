# pull official base image
FROM qdrant/qdrant:latest

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install Python in Container
RUN apt-get update
RUN apt-get install -y build-essential wget zlib1g-dev \
libncurses5-dev libgdbm-dev libnss3-dev \
libssl-dev libreadline-dev libffi-dev curl software-properties-common

RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get install python3.9

RUN apt-get install -y python3-pip

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt

EXPOSE 6333
EXPOSE 3001

# copy project
COPY . /usr/src/app/

CMD ["python3", "/usr/src/app/src/app.py"]
# CMD ["/bin/sh"]

