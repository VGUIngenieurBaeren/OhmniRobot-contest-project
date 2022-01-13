/********************************************************

  Project: HeartBeat_ros
  Filename: main.cpp
  Description: This module contains the Main application for the HeartBeat Sensor_Max30102


  --------------------------------------------------------------------

  This code follows the following naming conventions:

  char              ch_pmod_value
  char (array)      s_pmod_s_string[16]
  float             f_pmod_value
  int32_t           n_pmod_value
  int32_t (array)   an_pmod_value[16]
  int16_t           w_pmod_value
  int16_t (array)   aw_pmod_value[16]
  uint16_t          uw_pmod_value
  uint16_t (array)  auw_pmod_value[16]
  uint8_t           uch_pmod_value
  uint8_t (array)   auch_pmod_buffer[16]
  uint32_t          un_pmod_value
  int32_t *         pn_pmod_value

  ------------------------------------------------------------------------- */


#include <ros.h>
#include <ohmni_ros_msgs/HeartBeat.h>
ros::NodeHandle nh;
ohmni_ros_msgs::HeartBeat heartbeat_msg;
ros::Publisher pub_heart("HeartBeat", &heartbeat_msg);

#include <Arduino.h>
#include <Wire.h>
#include <SPI.h>
#include "algorithm_by_RF.h"
#include "max30102.h"


//U8G2 OLED SCREEN CONFIG
#include <U8g2lib.h>

#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif
#ifdef U8X8_HAVE_HW_I2C
#include <Wire.h>
#endif


// 24x21
static const unsigned char PROGMEM heart1[] =
{
  0xC0, 0x03, 0x0F, 0x60, 0x8E, 0x31, 0x30, 0xD8, 0x60, 0x18, 0x70, 0x40, 
  0x08, 0x30, 0xC0, 0x08, 0x20, 0x80, 0x08, 0x20, 0x80, 0x08, 0x02, 0x80, 
  0x08, 0x02, 0x80, 0x08, 0x03, 0xC0, 0x10, 0x11, 0x40, 0x10, 0x1D, 0x20, 
  0xFF, 0xEC, 0x10, 0x80, 0x0C, 0x18, 0x80, 0x09, 0x0C, 0x00, 0x03, 0x06, 
  0x00, 0x06, 0x03, 0x00, 0x8C, 0x01, 0x00, 0xD8, 0x00, 0x00, 0x70, 0x00, 
  0x00, 0x20, 0x00, };

// 32x32
static const unsigned char PROGMEM heart2[] =
{
  0x80, 0x0F, 0xF0, 0x01, 0x60, 0x38, 0x1C, 0x06, 0x18, 0x60, 0x06, 0x18, 
  0x08, 0x80, 0x01, 0x10, 0x04, 0x80, 0x01, 0x20, 0x02, 0x00, 0x00, 0x40, 
  0x02, 0x00, 0x00, 0x40, 0x03, 0x00, 0x10, 0xC0, 0x01, 0x00, 0x10, 0x80, 
  0x01, 0x00, 0x18, 0x80, 0x01, 0x00, 0x38, 0x80, 0x01, 0x00, 0x28, 0x00, 
  0x01, 0x00, 0x28, 0x00, 0x01, 0x00, 0x28, 0x00, 0x02, 0x08, 0x48, 0x00, 
  0x02, 0x08, 0x48, 0x00, 0x7E, 0xF8, 0xC4, 0x7F, 0xC0, 0x8C, 0x05, 0x20, 
  0x80, 0x05, 0x05, 0x30, 0x00, 0x05, 0x05, 0x10, 0x00, 0x06, 0x07, 0x08, 
  0x00, 0x04, 0x06, 0x04, 0x60, 0x00, 0x02, 0x06, 0xC0, 0x00, 0x02, 0x03, 
  0x80, 0x01, 0x80, 0x01, 0x00, 0x03, 0xC0, 0x00, 0x00, 0x06, 0x60, 0x00, 
  0x00, 0x0C, 0x30, 0x00, 0x00, 0x10, 0x08, 0x00, 0x00, 0x60, 0x06, 0x00, 
  0x00, 0xC0, 0x03, 0x00, 0x00, 0x80, 0x01, 0x00,};


//64x64
static const unsigned char PROGMEM fingerprint[] = {
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0xF8, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 
  0x98, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x01, 0x80, 0x03, 0x00, 0x00, 
  0x00, 0x00, 0x70, 0xC8, 0x1F, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x10, 0x0F, 
  0xF0, 0x18, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x41, 0x82, 0x30, 0x00, 0x00, 
  0x00, 0x00, 0xE6, 0xF8, 0x1F, 0x66, 0x00, 0x00, 0x00, 0x00, 0x33, 0x1E, 
  0x78, 0xCC, 0x00, 0x00, 0x00, 0x80, 0x99, 0x83, 0xC0, 0x99, 0x01, 0x00, 
  0x00, 0x80, 0xCC, 0xF8, 0x19, 0x33, 0x01, 0x00, 0x00, 0xC0, 0x66, 0x1C, 
  0x38, 0x26, 0x03, 0x00, 0x00, 0x40, 0x32, 0x87, 0xE1, 0x6C, 0x02, 0x00, 
  0x00, 0x60, 0x93, 0xF1, 0x8F, 0xC9, 0x06, 0x00, 0x00, 0x20, 0x99, 0x00, 
  0x18, 0xDB, 0x04, 0x00, 0x00, 0x20, 0x41, 0x86, 0x01, 0x92, 0x04, 0x00, 
  0x00, 0xB0, 0x61, 0xF6, 0xCF, 0x36, 0x0C, 0x00, 0x00, 0x90, 0x6C, 0x33, 
  0xCC, 0x36, 0x08, 0x00, 0x00, 0xB0, 0x24, 0x89, 0x91, 0x24, 0x0D, 0x00, 
  0x00, 0x90, 0x24, 0xC9, 0xB3, 0x2C, 0x09, 0x00, 0x00, 0x90, 0xB6, 0x6D, 
  0xB6, 0x65, 0x09, 0x00, 0x00, 0x90, 0xB6, 0x29, 0xB4, 0x05, 0x09, 0x00, 
  0x00, 0xB0, 0x24, 0x6D, 0x20, 0x0C, 0x09, 0x00, 0x00, 0x90, 0xA4, 0x69, 
  0x20, 0x6C, 0x09, 0x00, 0x00, 0xB0, 0x84, 0x21, 0xB6, 0x24, 0x01, 0x00, 
  0x00, 0x80, 0x84, 0x61, 0xB6, 0x6D, 0x01, 0x00, 0x00, 0xC0, 0xA6, 0x24, 
  0x92, 0x25, 0x03, 0x00, 0x00, 0xC0, 0xB4, 0x24, 0x92, 0x24, 0x01, 0x00, 
  0x00, 0x40, 0xB6, 0x26, 0x93, 0x2D, 0x01, 0x00, 0x00, 0x00, 0xD3, 0x36, 
  0x92, 0x24, 0x01, 0x00, 0x00, 0x80, 0x59, 0x12, 0x93, 0xB0, 0x01, 0x00, 
  0x00, 0x80, 0x48, 0x13, 0x81, 0x94, 0x00, 0x00, 0x00, 0x00, 0x6E, 0x81, 
  0xC1, 0xB6, 0x00, 0x00, 0x00, 0x00, 0xB2, 0x81, 0xC9, 0x96, 0x00, 0x00, 
  0x00, 0x00, 0x98, 0x8C, 0x4C, 0x12, 0x00, 0x00, 0x00, 0x00, 0xCC, 0xCC, 
  0x6C, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x40, 0x44, 0x24, 0x09, 0x00, 0x00, 
  0x00, 0x00, 0x60, 0x62, 0x26, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x23, 
  0xB2, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x31, 0x13, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x10, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, };

U8G2_SH1106_128X64_NONAME_F_HW_I2C u8g2(U8G2_R0, /* reset=*/ U8X8_PIN_NONE);









// Uncomment for debug output to the Serial stream 115200 baud
 #define DEBUG

// Uncomment for serial print at 115200 baud
 #define USE_SERIAL

// Uncomment if you want to include results returned
// by the original MAXIM algorithm.
// DEBUG MUST BE DEFINED AS WELL
// #define TEST_MAXIM_ALGORITHM

#ifdef TEST_MAXIM_ALGORITHM
#include "algorithm.h"
#endif

// Interrupt pin
const byte oxiInt = 13; // pin connected to MAX30102 INT

uint32_t elapsedTime, timeStart;

uint32_t aun_ir_buffer[BUFFER_SIZE]; //infrared LED sensor data
uint32_t aun_red_buffer[BUFFER_SIZE];  //red LED sensor data
float old_n_spo2;  // Previous SPO2 value
uint8_t uch_dummy, k;

void setup() {






#ifndef USE_SERIAL
  nh.initNode();
  nh.advertise(pub_heart);
#endif // not USE_SERIAL

  pinMode(oxiInt, INPUT);  //pin D13 connects to the interrupt output pin of the MAX30102

  Wire.begin();
    u8g2.begin();
    u8g2.clearBuffer();
    u8g2.setFont(u8g2_font_ncenB08_tr);	// choose a suitable font
    u8g2.drawStr(3,10,"Place your finger here");	// write something to the internal memory
    u8g2.setBitmapMode(false /* solid */);
    u8g2.setDrawColor(1);
    u8g2.drawXBM( 32, 12, 64, 64, fingerprint);
    u8g2.sendBuffer();







    
#if defined (USE_SERIAL) || defined (DEBUG)
  // initialize serial communication at 115200 bits per second:
  Serial.begin(115200);
#endif // USE_SERIAL || Debug

  maxim_max30102_reset(); //resets the MAX30102
  delay(1000);

  //Reads/clears the interrupt status register
  maxim_max30102_read_reg(REG_INTR_STATUS_1, &uch_dummy);
  //initialize the MAX30102
  maxim_max30102_init();

  old_n_spo2 = 0.0;

#if defined (USE_SERIAL) || defined (DEBUG)
  while (Serial.available() == 0) //wait until user presses a key
  {
    Serial.println(F("Press any key to start conversion"));
    delay(1000);
  }
#endif // USE_SERIAL || Debug

  uch_dummy = Serial.read();


#ifdef USE_SERIAL
#ifdef TEST_MAXIM_ALGORITHM
  Serial.print(F("Time[s]\tSpO2\tHR\tSpO2_MX\tHR_MX\tClock\tRatio\tCorr"));
#else // TEST_MAXIM_ALGORITHM
  Serial.print(F("Time[s]\tSpO2\tHR\tClock\tRatio\tCorr\n"));
#endif // TEST_MAXIM_ALGORITHM
#endif // USE_SERIAL

  timeStart = millis();


// U8G2 OLED




} // End of SETUP






void millis_to_hours(uint32_t ms, char* hr_str)
{
  char istr[6];
  uint32_t secs, mins, hrs;
  secs = ms / 1000; // time in seconds
  mins = secs / 60; // time in minutes
  secs -= 60 * mins; // leftover seconds
  hrs = mins / 60; // time in hours
  mins -= 60 * hrs; // leftover minutes
  itoa(hrs, hr_str, 10);
  strcat(hr_str, ":");
  itoa(mins, istr, 10);
  strcat(hr_str, istr);
  strcat(hr_str, ":");
  itoa(secs, istr, 10);
  strcat(hr_str, istr);
}

//Continuously taking samples from MAX30102.  Heart rate and SpO2 are calculated every ST seconds
void loop() {
  float n_spo2, ratio, correl; //SPO2 value
  int8_t ch_spo2_valid;  //indicator to show if the SPO2 calculation is valid
  int32_t n_heart_rate; //heart rate value
  int8_t  ch_hr_valid;  //indicator to show if the heart rate calculation is valid
  int32_t i;
  char hr_str[10];

  //buffer length of BUFFER_SIZE stores ST seconds of samples running at FS sps
  //read BUFFER_SIZE samples, and determine the signal range
  for (i = 0; i < BUFFER_SIZE; i++)
  {
    while (digitalRead(oxiInt) == 1); //wait until the interrupt pin asserts

    maxim_max30102_read_fifo((aun_red_buffer + i), (aun_ir_buffer + i)); //read from MAX30102 FIFO

#if defined (DEBUG)
    Serial.print(i, DEC);
    Serial.print(F("\t"));
    Serial.print(aun_red_buffer[i], DEC);
    Serial.print(F("\t"));
    Serial.print(aun_ir_buffer[i], DEC);
    Serial.println("");
#endif // DEBUG
  }

  //calculate heart rate and SpO2 after BUFFER_SIZE samples (ST seconds of samples) using Robert's method
  rf_heart_rate_and_oxygen_saturation(aun_ir_buffer, BUFFER_SIZE, aun_red_buffer, &n_spo2, &ch_spo2_valid, &n_heart_rate, &ch_hr_valid, &ratio, &correl);
  elapsedTime = millis() - timeStart;
  millis_to_hours(elapsedTime, hr_str); // Time in hh:mm:ss format
  elapsedTime /= 1000; // Time in seconds

#if defined (DEBUG)
  Serial.println("--RF--");
  Serial.print(elapsedTime);
  Serial.print("\t");
  Serial.print(n_spo2);
  Serial.print("\t");
  Serial.print(n_heart_rate, DEC);
  Serial.print("\t");
  Serial.println(hr_str);
  Serial.println("------");
#endif // DEBUG

#ifdef TEST_MAXIM_ALGORITHM
  //calculate heart rate and SpO2 after BUFFER_SIZE samples (ST seconds of samples) using MAXIM's method
  float n_spo2_maxim;  //SPO2 value
  int8_t ch_spo2_valid_maxim;  //indicator to show if the SPO2 calculation is valid
  int32_t n_heart_rate_maxim; //heart rate value
  int8_t  ch_hr_valid_maxim;  //indicator to show if the heart rate calculation is valid
  maxim_heart_rate_and_oxygen_saturation(aun_ir_buffer, BUFFER_SIZE, aun_red_buffer, &n_spo2_maxim, &ch_spo2_valid_maxim, &n_heart_rate_maxim, &ch_hr_valid_maxim);
#if defined (DEBUG)
  Serial.println("--MX--");
  Serial.print(elapsedTime);
  Serial.print("\t");
  Serial.print(n_spo2_maxim);
  Serial.print("\t");
  Serial.print(n_heart_rate_maxim, DEC);
  Serial.print("\t");
  Serial.println(hr_str);
  Serial.println("------");
#endif // DEBUG
#endif // TEST_MAXIM_ALGORITHM

#ifdef TEST_MAXIM_ALGORITHM
  if (ch_hr_valid && ch_spo2_valid || ch_hr_valid_maxim && ch_spo2_valid_maxim) {
#else   // TEST_MAXIM_ALGORITHM
  if (ch_hr_valid && ch_spo2_valid) {
#endif // TEST_MAXIM_ALGORITHM

#ifdef USE_SERIAL
    Serial.print(elapsedTime);
    Serial.print("\t");
    Serial.print(n_spo2);
    Serial.print("\t");
    Serial.print(n_heart_rate, DEC);
    Serial.print("\t");

#ifdef TEST_MAXIM_ALGORITHM
    Serial.print(n_spo2_maxim);
    Serial.print("\t");
    Serial.print(n_heart_rate_maxim, DEC);
    Serial.print("\t");
#endif //TEST_MAXIM_ALGORITHM

    Serial.print(hr_str);
    Serial.print("\t");
    Serial.print(ratio);
    Serial.print("\t");
    Serial.print(correl);
    Serial.println();
    //Serial.println(" -- MADE IT TO USE_SERIAL Print-- ");
#endif // USE_SERIAL

    old_n_spo2 = n_spo2;

#ifndef USE_SERIAL

    heartbeat_msg.bpm= n_heart_rate;
    heartbeat_msg.oxygen=n_spo2;
    pub_heart.publish(&heartbeat_msg);

#endif // not USE_SERIAL

  } // End of (ch_hr_valid && ch_spo2_valid)
  nh.spinOnce();
}




