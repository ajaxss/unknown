<template>
  <div class="content-top-nav">
    <left v-bind="$attrs"></left>
    <right v-bind="$attrs"></right>
  </div>
</template>

<script>
import left from "./contop-left";
import right from "./contop-right";
export default {
  components: {
    left: left,
    right: right,
  },
};
</script>

<style scoped lang='scss'>
.content-top-nav {
  margin-top: 50px;
  // height: 500px;
  width: 100%;
  // background-color: khaki;
  display: flex;
  justify-content: center;
}
</style>