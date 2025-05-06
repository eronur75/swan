FROM osrf/ros:humble-desktop-full

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Istanbul
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV ROS_DISTRO=humble



RUN mkdir /ws
WORKDIR /ws

SHELL [ "/bin/bash" , "-c" ]

RUN apt -y update && apt -y upgrade && apt -y install -y git lsb-release wget gnupg && apt -y install -y python3-pip libboost-program-options-dev libusb-1.0-0-dev python3-colcon-common-extensions  ros-humble-motion-capture-tracking ros-humble-tf-transformations
RUN sudo wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null  && \
    apt -y update && apt -y install ros-humble-ros-gzharmonic ros-humble-teleop-twist-keyboard


COPY requirements/requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /tmp/requirements.txt


RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

## Added crazyflie simulation as a git submodule under sim_ws
RUN echo "export GZ_SIM_RESOURCE_PATH=/ws/sim_ws/crazyflie-simulation/simulator_files/gazebo" >> ~/.bashrc


