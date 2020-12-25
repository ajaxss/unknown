<template>
  <div class="bottom-nav">
    <div class="bottom-one">
      <div>用户协议</div>
      <div>隐式政策</div>
      <div>侵权投诉指引</div>
      <div>社区规范</div>
    </div>
    <div class="bottom-two">
      <span>沪ICP备 13030189号 Copyright © 2014-2020 行吟信息科技（上海）有限公司</span>
      <span>| 地址：上海市黄浦区马当路388号C座</span>
      <span>| 电话：021-64224530</span>
      <span>| 自营经营者信息</span>
      <span>| 2020 沪公网安备 31010102002533号</span>
    </div>
    <div class="bottom-two">
      <span>
        网络文化经营许可证：沪网文[2018]4086-308号
        |
      </span>
      <span>
        增值电信业务经营许可证：沪B2-20150021
        |
      </span>
      <span>网购(订餐)大家评</span>
    </div>
    <div class="bottom-two">
      <span>医疗器械经营许可证：沪嘉食药监械经营许20187006号 |</span>
      <span>医疗器械网络交易服务第三方平台备案:（沪）网械平台备字[2019]第00006号 |</span>
      <span>互联网药品信息服务资格证书：(沪)-经营性-2018-0011</span>
    </div>
    <div class="bottom-two">
      <span>违法不良信息举报电话：(027) 5931 3970 |</span>
      <span>上海市互联网举报中心 |</span>
      <span>网上有害信息举报专区</span>
    </div>
  </div>
</template>

<script>
export default {
};
</script>

<style scoped lang="scss">
.bottom-nav {
  width: 100%;
  bottom: 0;
  z-index: 9999;
  background-color: rgba(0,0,0,0.1);
  margin: 0 auto;
}
.bottom-one {
  margin: 0  300px;

  display: flex;
  justify-content: space-around;
  font-size: 14px;
  font-weight: 500;
  color: #aaa;
  margin-bottom: 24px;
  font-family: PingFang SC, Helvetica, Arial, sans-serif;
  div {
    cursor: pointer;
  }
}
.bottom-two {
  font-size: 12px;
  font-weight: 400;
  font-family: PingFang SC, Helvetica, Arial, sans-serif;
  color: #999;
  display: flex;

  height: 20px;
  justify-content: center;
  span {
    line-height: 18px;
    cursor: pointer;
  }
}
</style>