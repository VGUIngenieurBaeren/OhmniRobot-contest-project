FROM ros:noetic-ros-core-focal
RUN apt-get update && apt-get install -y build-essential 
    
# install ros packages
RUN apt-get update && apt-get install -y ros-noetic-ros-base=1.5.0-1* \
    && rm -rf /var/lib/apt/lists/*



# install essential tools

RUN apt-get update && apt-get -y install \
    vim \
    net-tools \
    tmux \
    wget \
    python3-pip \
    htop && \

    # clear cache
    apt-get clean



RUN apt-get update && apt-get install -y curl
# install nodejs
RUN curl --silent --location https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y \
  nodejs
RUN echo "Node: " && node -v
RUN echo "NPM: " && npm -v





# OpenCV built wth Ros noetic
RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-cv-bridge \
    ros-${ROS_DISTRO}-image-transport \
    ros-${ROS_DISTRO}-image-transport-plugins && \
    # clear cache
    apt-get clean



#for http://wiki.ros.org/usb_cam
RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-usb-cam && \
    # clear cache
    apt-get clean



RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-rosbridge-server \
    ros-${ROS_DISTRO}-rosserial \
    ros-${ROS_DISTRO}-web-video-server &&\
    apt-get clean

# Upgrade installed packages
RUN apt update && apt upgrade -y && apt clean


# Upgrade pip to latest version
RUN curl -s https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py --force-reinstall && \
    rm get-pip.py




RUN apt-get update && pip3 install numpy \
	scipy \
	mediapipe && \
	apt-get clean
	




