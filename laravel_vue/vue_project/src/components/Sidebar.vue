<template>
    <div class="sidebar">
      <ul>
        <li><router-link to="/">Dashboard</router-link></li>
      <li><router-link to="/profile">Profile</router-link></li>
      <li><router-link to="/settings">Settings</router-link></li>
      <li><router-link to="/logout">Logout</router-link></li>
      </ul>
    </div>
  </template>
  
  <script>
  export default {
    name: 'Sidebar',
  };
  </script>
  
  <style scoped>
  .sidebar {
   
    width: 250px;
    height: 100vh;
    background-color: #854e4e;
    padding-top: 20px;
    position: fixed;
    top: 0;
    left: 0;
  }
  
  .sidebar ul {
    margin-left: 10px;
    list-style-type: none;
    padding: 0;
  }
  
  .sidebar ul li {
    margin: 20px 0;
  }
  
  .sidebar ul li a {
    color: white;
    text-decoration: none;
    padding: 10px;
    display: block;
  }
  
  .sidebar ul li a:hover {
    background-color: #e43232;
  }
  </style>
  