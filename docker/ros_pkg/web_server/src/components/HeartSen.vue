<template>
  <div class="sensor">
    <!-- Begin of Root Component -->
    <div class="name">{{ title }}</div>
      <div class="content">
      <!-- EKG SVG -->
        <div class="intro-block">
          <div class="monitor">
            <!-- Generator: Adobe Illustrator 21.0.2, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
            <svg id="Layer_1" xmlns="http://www.w3.org/2000/svg"  x="0px" y="0px"
                 viewBox="0 0 500 200" style="enable-background:new 0 0 500 200;" xml:space="preserve">
              <g>
                <polyline class="ekg" points="486.6,113.8 328.2,113.8 310.3,132.3 296,70.7 246.8,127.4 241.6,120.2 233.9,166.4 227,27.6
                  213.2,118.3 211.8,112.3 205.1,126.1 198.2,108.5 194.1,124.4 184.5,92.9 174.1,113 4.3,113 	"/>
              </g>
              </svg>
          </div>
        </div>
      <!-- EKG SVG -->
        <div class="bpm">
          <i class='bx bxs-heart'></i>
          <div class="bpm-number">
              <div class="info"><b class="number"> {{bpm}} </b> <b class="label">BPM</b></div>
              <div class="info"><b class="number"> {{SP02}}%</b> <b class="label">SPO2</b></div>
          </div>
        </div>
    <!--    <button v-on:click = sendCmd()>Click Me</button>-->
    </div>
    <!-- End of Root Component -->
  </div>
</template>

<script>

import ROSLIB from "roslib";

export default {
  name: "HeartSen",
  props: {
    title: String,
  },
  data: () => {
    return {
      //For ROS Bridge connection
      ros: null,
      connected: false,
      //Ros topic
      heart: String,
      SP02: String,
      bpm: String,
    }
  },
  methods: {
    // sendCmd() {
    //   this.createCmdVel = new ROSLIB.Topic({
    //     ros: this.ros,
    //     name: "/cmd_vel",
    //     messageType: "std_msgs/String"
    //   });
    //
    //   this.twist = new ROSLIB.Message({
    //     data: "Button Click Registered"
    //   });
    //
    //   this.createCmdVel.publish(this.twist);
    //   console.log("Published Success")
    // },
    listenHeart() {
      this.heart = new ROSLIB.Topic({
        ros : this.ros,
        name : '/HeartBeat',
        messageType : 'heartbeat_ros/HeartBeat'
      });
      this.heart.subscribe(message => {
        this.bpm = message.bpm;
        let displayBPM = 60/(this.bpm) +'s';
        document.documentElement.style.setProperty('--bpm', displayBPM); //This change the duration of the EKG animation based on bpm value
        this.SP02 = message.oxygen;
      });
    }
  },

  mounted() {
    // This is ros connection
    this.ros = new ROSLIB.Ros({
      url: "ws://localhost:9090",
    });
    this.ros.on("connection", () => {
      this.connected = true;
    });
    console.log("This is ROSLIB connection", this.ros);
    this.listenHeart();
    //Initialize the String Values
    this.bpm = "80";
    // Testing Animation
     let displayBPM = 60/(this.bpm) +'s';
     document.documentElement.style.setProperty('--bpm', displayBPM); //This change the duration of the EKG animation based on bpm value
     let get = document.documentElement.style.getPropertyValue('--bpm');
     console.log(get);
     this.SP02 = "98";
  },
}
</script>
<style scoped>
.sensor {
  width: 50vw;
  min-width: 500px;
  background: #181616;
  border-radius: 12px;
}
.name {
  margin-top: 20px;
  padding: 10px;
  font-size: 30px;
  border-radius: 12px;
  background: #414141;
  color: lightgray;
}
.content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  justify-content: center;
}
.bxs-heart {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 50px;
  color: red;
  animation-name: beating;
  animation-duration: var(--bpm);
  animation-timing-function: ease-in-out;
  animation-iteration-count: infinite;
}
@keyframes beating {
  0% {
    opacity: 0;
    font-size: 30px
  }
  25% {
    opacity: 1;
    font-size: 50px;
  }
  50% {
    opacity: 1;
    font-size: 50px;
  }
  100% {
    opacity: 0;
    font-size: 30px;
  }
}
.bpm {
  font-size: 30px;
  color: darkgray;
  display: grid;
  grid-template-columns: 3fr 7fr;
}
.bpm-number {
  display: grid;
  align-items: center;
  grid-template-rows: 1fr 1fr;
}
.info {
  display: grid;
  grid-template-columns: 1fr 1fr;
}
.info .number {
  padding-left: 10%;
  text-align: left;
}
.info .label {
  padding-right: 50%;
  text-align: left;
}
.intro-block {
  text-align: center;
}

.intro-block .monitor {
  padding: 0;
  max-width: 500px;
  border-radius: 5px;
  margin: 0 auto;
}

.intro-block svg {
  max-width: 470px;
  margin-left: 20px;
  margin-right: 20px;
  position: relative;
  transition: all 0.5s ease-in-out;
}

.intro-block svg .ekg {
  fill: none;
  stroke: #00d704;
  stroke-width: 6;
  stroke-linecap: round;
  stroke-linejoin: miter;
  opacity: 0;
  stroke-dashoffset: 1000;
  stroke-dasharray: 1000;
  animation: ekg ease-in-out forwards infinite;
  animation-duration: var(--bpm);
}

@keyframes ekg {
  0% {
    opacity: 0;
  }
  25% {
    opacity: 1;
  }
  50% {
    stroke-dashoffset: 2000;
  }
  99% {
    opacity: 0;
    stroke-dashoffset: 3000;
  }
  100% {
    stroke-dashoffset: 1000;
  }
}

</style>