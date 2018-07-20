FROM python:3.6
# Set up code directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#COPY apt /etc/
# Install Linux dependencies
#RUN apt-get update && apt-get install -y python3.6
RUN apt-get update && apt-get install -y libssl-dev
#RUN apt-get update && apt-get install -y libpython3.6-dev
RUN apt-get update && apt-get install -y python3-pip
RUN apt-get update && apt-get install -y pandoc

#Copy the application py-evm to the /usr/src/app folder
COPY . /usr/src/app

# Install python dependencies
RUN pip install virtualenv
RUN cd /usr/src/app
RUN virtualenv -p python3 venv
RUN  . venv/bin/activate
RUN pip3 install -e .[dev]
RUN pip3 install -U trinity


RUN trinity


