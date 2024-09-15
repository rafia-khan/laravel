<template>
<nav class="navbar">
    <ul>
        <li>
            <router-link to="/">Home</router-link>
        </li>
        <li>
            <router-link to="/about">About</router-link>
        </li>
        <li>
            <router-link to="/services">Services</router-link>
        </li>
        <li>
            <router-link to="/contact">Contact</router-link>
        </li>
    </ul>
</nav>
</template>

  
<script>
export default {
    name: "Navbar",
};
</script>

  
<style scoped>
.navbar {
    background-color: #965858;
    padding: 1rem;
}

.navbar ul {
    list-style-type: none;
    display: flex;
    justify-content: space-around;
}

.navbar li a {
    color: white;
    text-decoration: none;
    padding: 0.5rem 1rem;
}

.navbar li a:hover {
    background-color: #555;
}
</style>
