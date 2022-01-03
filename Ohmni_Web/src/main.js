import Vue from 'vue'
import App from './App.vue'
import Embed from 'v-video-embed'

Vue.config.productionTip = false
Vue.use(Embed);
new Vue({
  render: h => h(App),
  data: {
    messenger: 'here data is a property'
  }
}).$mount('#app')