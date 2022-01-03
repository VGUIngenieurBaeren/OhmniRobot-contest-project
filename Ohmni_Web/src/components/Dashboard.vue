<template>
  <div id="dash">
      <!-- Begin of Root Component -->
      <div class="toolbar">
        <a class="tools_start"><i style="padding-right: 12px" class='bx bxl-vuejs'></i>{{title}}</a>
        <a href="#" class="tools"><i class='bx bxs-cctv' ></i></a>
        <a href="#" class="tools"><i class='bx bxs-heart' ></i></a>
        <a href="#" class="tools"><i class='bx bx-line-chart' ></i></a>
        <a href="#" class="tools_end"><div class="logout"><i class='bx bxs-log-out'></i></div></a>
      </div>
    <div v-if="state = 1" class="monitor"> <!--State = 1: Monitor -->
      <Monitor></Monitor>
    </div>
    <!-- End of Root Component -->
  </div>
</template>

<script>
import Monitor from "@/components/Monitor";
export default {
  name: "Dashboard",
  props: {
    title: String
  },
  components: {
    Monitor
  }
}
</script>

<style scoped>
/* Google Font Link */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');

#dash {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
  }
.toolbar{
  position: fixed;
  top: 0;
  right: 0;
  width: 100%;
  height: 70px;
  display: grid;
  grid-template-columns: 3fr 1fr 1fr 1fr 3fr;
  align-content: center;
  font-size: 30px;
  background: #2b2b2b;
  min-width: 820px;
}
a{
  text-decoration: none;
  color: lightgray;
  min-width: 100px;
}
.toolbar .tools_start{
  display: flex;
  align-items: center;
  padding: 10px;
  text-align: left;
}
.toolbar .tools_end{
  padding: 10px;
  align-items: center;
  text-align: right;
  transition: all 0.2s ease;
}
.toolbar .tools{
  display: flex;
  padding: 10px;
  justify-content: center;
  align-items: center;
  border-radius: 12px;
  transition: all 0.2s ease;
}
.toolbar .tools:hover{
  color: black;
  background: lightgray;
}
.toolbar .tools_end{
  display: flex;
  color: lightgray;
  position: relative;
  justify-content: center;
  align-items: center;
  background: #2b2b2b;
  transition: all 0.2s ease;
}
.toolbar .tools_end .logout {
  display: flex;
  position: absolute;
  justify-content: center;
  align-items: center;
  right: 50px;
  height: 40px;
  width: 40px;
  padding: 10px;
  border-radius: 12px;
  transition: all 0.2s ease;
}

.toolbar .tools_end .logout:hover{
  color: lightgray;
  background: red;

}
/* For some reason the tooltip is placed behind the components despite having higher index. TODO: fix tooltip */
/*.tooltip {*/
/*  font-size: 20px;*/
/*  position: absolute;*/
/*  padding: 10px;*/
/*  margin-top: 25px;*/
/*  min-width: 10%;*/
/*  opacity: 0;*/
/*  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);*/
/*  background: lightgray;*/
/*  border-radius: 12px;*/
/*  z-index: 99;*/
/*}*/
/*.toolbar .tools:hover .tooltip{*/
/*  opacity: 1;*/
/*}*/

.monitor{
  margin: 0;
  padding: 0;
  left: 0;
  position: fixed;
  display: flex;
  justify-content: left;
  top: 80px;
  z-index: 1;
}
</style>