<template>
  <div id="app">
   
    <Sidebar />
    <div class="content">
      <Navbar />
   
    <router-view />
  </div>
  </div>
</template>

<script>
import Navbar from './components/Navbar.vue';
import Sidebar from './components/Sidebar.vue';

export default {
  name: 'App',
  components: {
    Navbar,
    Sidebar,
  },
};
</script>

<style>
#app{
  display: flex;
}
.content{
  margin-left: 250px;
  padding: 30px;
  width: 100%;
}

</style>

<!-- up" -->
