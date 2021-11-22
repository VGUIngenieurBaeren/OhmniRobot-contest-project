<template>

  <!-- Main content -->
  
  <div class="container">
    <div class="name">Heart Sensor</div> 

  <div style="display: inline-block;">              
    <IEcharts :option="bpm"  style="width: 600px; height: 400px ;" ></IEcharts>
</div>
  <div style="display: inline-block;">
    <IEcharts :option="oxygen "  style="width: 600px; height: 400px ;" ></IEcharts>

  </div>
</div>

 
  <!-- /.content -->
 
</template>

<script>

import IEcharts from 'vue-echarts-v3/src/full.js'
import ROSLIB from "roslib";


export default {
   name: 'hello',
  components: { IEcharts },
  props: { },
  data () {
    return {
      ros: null,
      connected: false,
      loading: true,
      temp: 0,


  oxygen: {
  series: [
    {
      type: 'gauge',
      center: ['50%', '60%'],
      startAngle: 200,
      endAngle: -20,
      min: 0,
      max: 100,
      splitNumber: 10,
      itemStyle: {
        color: '#FFAB91'
      },
      progress: {
        show: true,
        width: 30
      },
      pointer: {
        show: false
      },
      axisLine: {
        lineStyle: {
          width: 30
        }
      },
      axisTick: {
        distance: -45,
        splitNumber: 5,
        lineStyle: {
          width: 2,
          color: '#999'
        }
      },
      splitLine: {
        distance: -52,
        length: 14,
        lineStyle: {
          width: 3,
          color: '#999'
        }
      },
      axisLabel: {
        distance: -20,
        color: '#999',
        fontSize: 15
      },
      anchor: {
        show: false
      },
      title: {
        show: false
      },
      detail: {
        valueAnimation: true,
        width: '60%',
        lineHeight: 40,
        borderRadius: 8,
        offsetCenter: [0, '-15%'],
        fontSize: 25,
        fontWeight: 'bolder',
        formatter: 'SPO2: {value} %',
        color: 'yellow'
      },
 
      data: [
        {
          value: 20
        }
      ]
    },
    {
      type: 'gauge',
      center: ['50%', '60%'],
      startAngle: 200,
      endAngle: -20,
      min: 0,
      max: 100,
      

      itemStyle: {
        color: '#FD7347'
      },
      progress: {
        show: true,
        width: 8
      },
      pointer: {
        show: false
      },
      axisLine: {
        show: false
      },
      axisTick: {
        show: false
      },
      splitLine: {
        show: false
      },
      axisLabel: {
        show: false
      },
      detail: {
        show: false
      },
      data: [
        {
          value: 20
        }
      ]
    }
  ],
},
bpm: {
  series: [
    {
      type: 'gauge',
      axisLine: {
        lineStyle: {
          width: 30,
          color: [
            [0.3, '#67e0e3'],
            [0.7, '#37a2da'],
            [1, '#fd666d']
          ]
        }
      },
      pointer: {
        itemStyle: {
          color: 'auto'
        }
      },
      axisTick: {
        distance: -30,
        length: 8,
        lineStyle: {
          color: '#fff',
          width: 2
        }
      },
      splitLine: {
        distance: -30,
        length: 30,
        lineStyle: {
          color: '#fff',
          width: 4
        }
      },
      axisLabel: {
        color: 'auto',
        distance: -30,
        fontSize: 20
      },
      detail: {
        valueAnimation: true,
        formatter: '{value} bpm',
        color: 'auto'
      },
      data: [
        {
          value: 20
        }
      ]
    }
  ]
}

    }
  },

  methods: {  
    listenHeart() {
      this.heart = new ROSLIB.Topic({
        ros : this.ros,
        name : '/HeartBeat',
        messageType : 'heartbeat_ros/HeartBeat'
      });
      this.heart.subscribe(message => { 
        this.SP02=message.oxygen;  
        this.bpm.series[0].data[0].value=message.bpm;
        this.oxygen.series[0].data[0].value = parseFloat(message.oxygen).toFixed(2)
        this.oxygen.series[1].data[0].value = this.oxygen.series[0].data[0].value;
      });
    }
},
  mounted () 
  {

    this.ros = new ROSLIB.Ros({
      url: "ws://localhost:9090",
    });
    this.ros.on("connection", () => {
      this.connected = true;
    });
    console.log("This is ROSLIB connection", this.ros);
    this.listenHeart();
    this.SP02 = "0";

  },


}
</script>
<style scoped>

.name {
  margin: 20px;
  padding: 10px;
  width: 95vw;
  font-size: 30px;
  border-radius: 12px;
  background: #414141;
  color: lightgray;
}
.bpm {
  font-size: 30px;
  color: darkgray;
}
</style>