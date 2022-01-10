import rospy
from std_msgs.msg import Float64MultiArray
import time,board,busio
import numpy as np
import adafruit_mlx90640



def talker():
    pub = rospy.Publisher('thermal_array', Float64MultiArray, queue_size=10)
    i2c = busio.I2C(board.SCL, board.SDA, frequency=400000) # setup I2C
    mlx = adafruit_mlx90640.MLX90640(i2c) # begin MLX90640 with I2C comm


    mlx.refresh_rate = adafruit_mlx90640.RefreshRate.REFRESH_2_HZ # set refresh rate
    frame = np.zeros((24*32,)) # setup array for storing all 768 temperatures
    rospy.init_node('MLX90640', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        mlx.getFrame(frame) # read MLX temperatures into frame var
        #rospy.loginfo(hello_str)
        pub.publish(frame)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass