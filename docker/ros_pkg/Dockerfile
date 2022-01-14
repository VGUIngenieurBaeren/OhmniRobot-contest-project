FROM ohmnihealth:base
COPY ros_launch.sh /
COPY ros_entrypoint.sh / 
COPY launch/* /

#Build an example
RUN mkdir -p root/catkin_ws/src
COPY example_draw_image root/catkin_ws/src/example_draw_image

COPY thermalcam_ros root/catkin_ws/src/thermalcam_ros

COPY heartbeat_ros root/catkin_ws/src/heartbeat_ros



RUN /bin/bash -c ' source /opt/ros/noetic/setup.bash; cd root/catkin_ws\
    ;catkin_make -DCATKIN_WHITELIST_PACKAGES="example_draw_image;heartbeat_ros;thermalcam_ros" -DCMAKE_BUILD_TYPE=Release'
RUN mkdir -p root/catkin_ws/web
COPY web_server root/catkin_ws/web
RUN cd root/catkin_ws/web && npm install
#WORKDIR "root/catkin_ws/web"
#RUN npm install
#vue 
EXPOSE 8080 
#web video
EXPOSE 8181 
#rosbridge
EXPOSE 9090 


#start core nodes
ENTRYPOINT ["./ros_entrypoint.sh"]
CMD ["bash"]

