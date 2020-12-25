<template>
  <div class="main">
    <left-menu></left-menu>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  methods:{
    
  },
  created() {
  }
};
</script>

<style scoped>
.main {
    display: flex;
    background-color: #fff;
}

</style>