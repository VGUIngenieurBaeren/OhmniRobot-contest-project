<template>
  <body>
    <div id="app">
      <!-- Boxicons CDN Link -->
      <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
      <Dashboard title="Vue JS"></Dashboard>
    </div>
  </body>
</template>

<script>
import Dashboard from "@/components/Dashboard";

export default {
  name: 'App',
  components: {
    Dashboard
  }
}
</script>

<style>
#app {
  /* Google Font Link */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
  font-family: "Poppins", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: left;
  color: #2c3e50;
}
body{
  background: #1e1e1e;
}
</style>
