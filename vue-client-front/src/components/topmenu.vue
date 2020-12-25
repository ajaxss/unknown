<template>
  <div class="top">
    <div class="unknown">
      <div class="logo">
        <img src="../assets/项目logo.png" alt="" />
      </div>
    </div>
    <el-menu
      :default-active="activeIndex"
      class="el-menu-demo"
      mode="horizontal"
      @select="handleSelect"
    >
      <el-menu-item index="1">首页</el-menu-item>
      <el-menu-item index="2">社区精选</el-menu-item>
      <el-menu-item index="3">新闻中心</el-menu-item>
      <el-menu-item index="4">社会责任</el-menu-item>
      <el-menu-item index="5">个人中心</el-menu-item>
      <el-menu-item index="6">登录/注册</el-menu-item>
    </el-menu>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeIndex: "1",
    };
  },
  methods: {
    handleSelect(key, keypath) {
      var goto = "/";
      switch (key) {
        case "1":
          goto = "/";
          break;
        case "2":
          goto = "/Explore";
          break;
        case "3":
          goto = "/News";
          break;
        case "4":
          goto = "/Liability";
          break;
        case "5":
          goto = "/User";
          break;
        case "6":
          goto = "/Login";
          break;
      }
      if (goto != this.$route.fullPath) {
        this.$router.push(goto);
      } else {
        location.reload();
      }
      if (goto != "/") {
      }
    },
  },
  created() {
    // console.log(this.$route);
    switch (this.$route.path) {
      case "/Explore/allnode":
        console.log(this.$route)
        this.activeIndex = "2";
        break;
        case "/Explore/nodemsg":
          console.log('1112',this.$route)
        this.activeIndex = "2";
        break;
      case "/News":
        this.activeIndex = "3";
        break;
      case "/Liability":
        this.activeIndex = "4";
        break;
      case "/User/Node":
        this.activeIndex = "5";
        break;
      case "/User/Video":
        this.activeIndex = "5";
        break;
      case "/User/Massage":
        this.activeIndex = "5";
        break;
      case "/Login":
        this.activeIndex = "6";
        break;
      case "/register":
        this.activeIndex = "6";
        break;
      case "/login":
        this.activeIndex = "6";
        break;
    }
  },
};
</script>


<style>
.top {
  z-index: 999;
  display: flex;
  width: 100%;
  height: 106px;
  padding-right: 15px;
}
.top li {
  font-family: PingFang SC, Helvetica, Arial, sans-serif;
  font-size: 18px;
  font-weight: 700;
}

.unknown {
  padding-left: 91px;
  width: 120px;
  display: flex;
  align-items: center;
}

.el-menu.el-menu--horizontal {
  margin-left: 200px;
  border: none;
  width: 1080px;
  display: flex;
  flex-direction: row;
  justify-content: flex-end;
  align-items: center;
  padding-right: 80px;
  background-color: transparent;
}
.el-menu.el-menu--horizontal li {
  margin-left: 58px;
}

.el-menu--horizontal > .el-menu-item.is-active {
  border-bottom: 2px solid grey;
  color: gold;
}

.el-menu--horizontal > .el-menu-item:not(.is-disabled):hover {
  background-color: transparent;
  color: gold;
}

.el-menu--horizontal > .el-menu-item:not(.is-disabled):focus {
  background-color: transparent;
}
</style>