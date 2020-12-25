<template>
  <div>
    <top-menu></top-menu>
    <router-view></router-view>
    <bottom-menu></bottom-menu>
  </div>
</template>

<script>
import pubu from "../components/pubu";
export default {
  components: {
    pubu: pubu,
  },
};
</script>

<style scoped>
div{
    overflow-x: hidden;
}
</style>