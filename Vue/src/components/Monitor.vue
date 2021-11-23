<template>
  <!-- Begin Root Component -->
  <div id="monitor">
    <!-- <div class="content">
      <ThermalCam title="Thermal Camera"></ThermalCam>
    </div> -->
    <div class="content">
      <HeartSen title="Heart Beat Sensor"></HeartSen>
    </div>
  </div>
  <!-- End of Root Component -->
</template>

<script>
import ThermalCam from "@/components/ThermalCam";
import HeartSen from "@/components/HeartSen";
export default{
  name: "Monitor",
  props: {
    title: String
  },
  components:{
    //ThermalCam,
    HeartSen
  }
}
</script>

<style scoped>
.content {
  margin: 0;
  padding: 0;
}
</style>