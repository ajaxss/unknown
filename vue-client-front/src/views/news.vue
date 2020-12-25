<template>
  <div>
    <top-menu></top-menu>
    <div class="headimg">
      <div>新闻中心</div>
    </div>
    <hotnews></hotnews>
    <dynamic></dynamic>
    <honor></honor>
    <bottom-menu></bottom-menu>
  </div>
</template>

<script>
import hotnews from "../components/hotnews";
import dynamic from "../components/dynamic"
import honor from "../components/honor"
export default {
  components: {
    hotnews: hotnews,
    dynamic,
    honor
  },
};
</script>

<style scoped lang="scss">
.headimg {
  width: 100%;
  height: 500px;
  background-image: url("https://ci.xiaohongshu.com/44c37c44-266f-4cff-a9fb-ad35d41cd9d3");
  background-size: 100% 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  z-index: -1;
  top: 0;
  div {
    max-width: 100%;
    z-index: 1;
    font-size: 48px;
    line-height: 67px;
    font-weight: 700;
    font-family: PingFang SC, Helvetica, Arial, sans-serif;
    color: #fff;
  }
}
</style>