/*
  Code to publish sensor data from ESP32 to Ohmni Robot via Ros

*/
#include <stdlib.h>

// ros and message types
#include <ros.h>
#include "MLX90640_I2C_Driver.h"


#include <std_msgs/UInt8MultiArray.h>
#include "MLX90640_API.h"
#define THERMAL_SIZE 384





ros::NodeHandle nh;
std_msgs::UInt8MultiArray thermal_msg;
std_msgs::MultiArrayLayout thermal_msg_layout;
std_msgs::MultiArrayDimension thermal_msg_dim[1];
std_msgs::MultiArrayDimension thermal_msg_row;
uint8_t thermal_data[THERMAL_SIZE];
ros::Publisher thermal_pub0("thermal", &thermal_msg);




// I2C lib
#include <Wire.h>

// sensor libraries and class initializations

// https://github.com/sparkfun/SparkFun_MLX90640_Arduino_Example/issues/2
const byte MLX90640_address = 0x33; //Default 7-bit unshifted address of the MLX90640
#define TA_SHIFT 8                  //Default shift for MLX90640 in open air
static float mlx90640To[768];
paramsMLX90640 mlx90640;




//#define DEBUG

boolean isConnected()
{
  Wire.beginTransmission((uint8_t)MLX90640_address);
  if (Wire.endTransmission() != 0)
    return (false); //Sensor did not ACK
  return (true);
}

void MLX_read() {
  for (byte x = 0 ; x < 2 ; x++) //Read both subpages
  {
    uint16_t mlx90640Frame[834];
    
    int status = MLX90640_GetFrameData(MLX90640_address, mlx90640Frame);


    float vdd = MLX90640_GetVdd(mlx90640Frame, &mlx90640);
    float Ta = MLX90640_GetTa(mlx90640Frame, &mlx90640);

    float tr = Ta - TA_SHIFT; //Reflected temperature based on the sensor ambient temperature
    float emissivity = 0.95;

    MLX90640_CalculateTo(mlx90640Frame, &mlx90640, emissivity, tr, mlx90640To);


  }
}




void setup() {
  // ros initializations
  nh.initNode();
  nh.getHardware()->setBaud(57600);
  nh.advertise(thermal_pub0);
  Wire.begin();
  Wire.setClock(100000); //Increase I2C clock speed to 400kHz
  // I2C init
  Wire.begin();
#if defined (DEBUG)
    Serial.begin(57600);
    Serial.println("Starting DEBUG");
    while (!Serial); //Wait for user to open terminal
        Serial.println("MLX90640 IR Array Example");
#endif
  // thermal inits
  if (isConnected() == false)
  {
    nh.logerror("MLX90640 not detected at default I2C address. Please check wiring. Freezing.");
    #if defined (DEBUG)
      Serial.println("MLX90640 not detected at default I2C address. Please check wiring. Freezing.");
    #endif
    while (1);
  }
  //nh.logerror("MLX90640 online!");
  #if defined (DEBUG)
    Serial.println("MLX90640 online!");
  #endif


  //Get device parameters - We only have to do this once
  int status;
  uint16_t eeMLX90640[832];
  status = MLX90640_DumpEE(MLX90640_address, eeMLX90640);
  if (status != 0){
    nh.logerror("Failed to load system parameters");
    #if defined (DEBUG)
      Serial.println("Failed to load system parameters");
    #endif
  }


  status = MLX90640_ExtractParameters(eeMLX90640, &mlx90640);

  if (status != 0)
  {
    nh.logerror("Parameter extraction failed");
    #if defined (DEBUG)
      Serial.println("Parameter extraction failed");
    #endif
  }


  thermal_msg_row.label = "Thermal_data";
  thermal_msg_row.size = THERMAL_SIZE;
  thermal_msg_row.stride = THERMAL_SIZE;
  thermal_msg_dim[0] = thermal_msg_row;
  thermal_msg_layout.dim = thermal_msg_dim;
  thermal_msg_layout.dim_length = 1;
  thermal_msg.layout = thermal_msg_layout;
  thermal_msg.data_length = THERMAL_SIZE;
  //nh.logerror("all sensors connected");
}

// repeatedly read from each sensor and publish to ROS
void loop() {

  // IR Array readings
  MLX_read();
  for(int j = 0; j < 768; j += THERMAL_SIZE) {
    thermal_msg_layout.data_offset = j;
    thermal_msg.layout = thermal_msg_layout;
    for(int i = j; i < THERMAL_SIZE+j; i++) {
      float temp = mlx90640To[i];
      //float temp = random(20,30);
      if (temp <= 25.0) {
        temp = 25;
      }
      
      else if (temp >= 280.0) {
        temp = 280;
      }
      
      //temp -= 25;
      //Serial.println(temp);
      uint8_t temp2 = static_cast<uint8_t>(temp);
      //Serial.println(b);
      thermal_data[i%THERMAL_SIZE] = temp2;


    }
    thermal_msg.data = thermal_data;
    thermal_pub0.publish(&thermal_msg);
  }


  nh.spinOnce();
}
