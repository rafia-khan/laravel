<template>
  <div id="app">
    <Navbar />
    <Sidebar />
    <router-view />
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

<!-- <style>
.content {
  margin-left: 250px; /* Adjust to match the sidebar width */
  padding: 20px;
}
</style> -->
