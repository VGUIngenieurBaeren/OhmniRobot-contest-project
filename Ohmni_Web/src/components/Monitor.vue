<template>
  <!-- Begin Root Component -->
  <div class="monitor">
    <div class="content">
      <ThermalCam title="Thermal Camera"></ThermalCam>
    </div>
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
    ThermalCam,
    HeartSen
  }
}
</script>

<style scoped>
.monitor {
  width: 100%;
  height: 100%;
  display: grid;
  grid-template-columns: 50vw 50vw;
}
.content {
  margin: 0;
  padding: 0;
}
</style>