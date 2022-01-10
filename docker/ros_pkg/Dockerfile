FROM ohmnihealth:base
RUN mkdir -p root/launchmsg
COPY launch root/launchmsg
COPY ros_launch.sh  root/launchmsg
COPY ros_entrypoint.sh root/launchmsg

#Build an example
RUN mkdir -p root/catkin_ws/src
COPY example_draw_image root/catkin_ws/src/example_draw_image

COPY thermalcam_ros root/catkin_ws/src/thermalcam_ros

COPY heartbeat_ros root/catkin_ws/src/heartbeat_ros

RUN /bin/bash -c ' source /opt/ros/melodic/setup.bash; cd root/catkin_ws\
    ;catkin_make -DCATKIN_WHITELIST_PACKAGES="example_draw_image;heartbeat_ros;thermalcam_ros" -DCMAKE_BUILD_TYPE=Release'

RUN mkdir -p root/catkin_ws/web
COPY web_server root/catkin_ws/web
WORKDIR "root/catkin_ws/web"
RUN npm install
WORKDIR "root/launchmsg"
EXPOSE 8080
EXPOSE 8181
EXPOSE 9090


#start core nodes
ENTRYPOINT ["./ros_entrypoint.sh"]
CMD ["bash"]

