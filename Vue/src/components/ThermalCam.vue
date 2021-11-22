<template>
  <div class="camera">
    <div class="name">{{ title }}</div>
    <!-- Begin of Root Component -->
    <video class="feed"></video>
    <!-- End of Root Component -->
  </div>
</template>

<script>
export default {
  name: "ThermalCam",
  props: {
    title: String
  }
}
</script>

<style scoped>
.camera {
  margin: 0;
  padding: 0;
}
.name {
  border-radius: 12px;
  margin: 20px;
  padding: 10px;
  width: 95vw;
  font-size: 30px;
  background: #414141;
  color: lightgray;
  z-index: 1;
}
</style>