FROM osrf/ros:humble-desktop-full

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Istanbul
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV ROS_DISTRO=humble

RUN mkdir /app
WORKDIR /app

SHELL [ "/bin/bash" , "-c" ]

RUN apt-get update
RUN apt-get install -y git && apt-get install -y python3-pip

COPY requirements/requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /tmp/requirements.txt

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
