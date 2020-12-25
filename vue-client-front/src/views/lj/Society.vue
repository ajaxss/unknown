<template>
  <div>
  <div class="container pc-container">
    <div
      class="oneBanner banner"
      style="background-image: url(http://ci.xiaohongshu.com/cb1d76b4-a166-449c-a9b7-0f5806979546)"
    >
      <div class="inner" style="background-color: rgba(51, 51, 51, 0.3);">
        <span class="title">社会责任</span>
      </div>
    </div>
  </div>
        <top-menu></top-menu>
        <content-menu></content-menu>
        <bottom-menu></bottom-menu>
  </div>
</template>

<script>
import content from '../../components/lj/User/society(1)'
export default {
    components:{
        'content-menu':content
    },
    data(){
        return{
            
        }
    }
}
</script>

<style scoped lang="scss">
.pc-container{
    position: relative;
}
.oneBanner {
  width: 100%;
  height: 500px;
  position: absolute;
  margin: 0 auto;
  background-size: cover;
  background-position: 50%;
  background-repeat: no-repeat;
  display: flex;
  z-index: -1;
  top: 0;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  .inner {
    max-width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    content: "";
    width: 100%;
    height: 100%;
  }
  .title {
    max-width: 100%;
    z-index: 1;
    font-size: 48px;
    line-height: 67px;
    font-weight: 700;
    font-family: PingFang SC, Helvetica, Arial, sans-serif;
    color: #fff;
    position: relative;
  }
}
</style>