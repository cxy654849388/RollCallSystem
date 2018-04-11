<template>
  <div id="app">

    <login></login>
  </div>
</template>

<script>
  import HelloWorld from "./components/HelloWorld";
  import Login from "./components/login"

  export default {
    components: {HelloWorld,Login},
    name: 'App',
  }
</script>

<style>
  html,body,#app {height: 100%;}
</style>
