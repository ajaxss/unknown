<template>
  <div>
    <el-container style="height: 500px; border: 1px solid #eee">
      <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
        <el-menu
          :default-openeds="['1', '4']"
          :default-active="activeIndex"
          @select="changerouter"
        >
          <el-submenu index="1">
            <template slot="title"
              ><i class="el-icon-message"></i>用户管理</template
            >
            <el-menu-item-group>
              <el-menu-item index="1-1">用户操作</el-menu-item>
            </el-menu-item-group>
          </el-submenu>
          <el-submenu index="2">
            <template slot="title"
              ><i class="el-icon-message"></i>新闻管理</template
            >
            <el-menu-item-group>
              <el-menu-item index="2-1">新闻操作</el-menu-item>
              <el-menu-item index="2-2">添加新闻</el-menu-item>
            </el-menu-item-group>
          </el-submenu>
          <el-submenu index="3">
            <template slot="title"
              ><i class="el-icon-message"></i>社会职责管理</template
            >
            <el-menu-item-group>
              <el-menu-item index="3-1">社会职责操作</el-menu-item>
              <el-menu-item index="3-2">添加社会职责</el-menu-item>
            </el-menu-item-group>
          </el-submenu>
          <el-submenu index="4">
            <template slot="title"
              ><i class="el-icon-message"></i>标签管理</template
            >
            <el-menu-item-group>
              <el-menu-item index="4-1">标签操作</el-menu-item>
              <el-menu-item index="4-2">添加标签</el-menu-item>
            </el-menu-item-group>
          </el-submenu>
        </el-menu>
      </el-aside>
    </el-container>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeIndex: "1-1",
    };
  },
  methods: {
    changerouter(key, keypath) {
      var goto = "/Admin/UserM";
      switch (key) {
        case "1-1":
          goto = "/Admin/UserM";
          break;
          case "2-1":
          goto = "/Admin/NewsM";
          break;
          case "2-2":
          goto = "/Admin/AddNews";
          break;
        case "3-1":
          goto = "/Admin/SocietyM";
          break;
          case "3-2":
          goto = "/Admin/AddSociety";
          break;
        case "4-1":
          goto = "/Admin/TagM";
          break;
          case "4-2":
          goto = "/Admin/AddTag";
          break;
      }
      if (goto != this.$route.fullPath) {
        this.$router.push(goto);
      } else {
        location.reload();
      }
      if (goto != "/Admin/UserM") {
      }
    }
  },
  created() {
    switch (this.$route.fullPath) {
        case "/Admin/NewsM":
        this.activeIndex = "2-1";
        break;
        case "/Admin/AddNews":
        this.activeIndex = "2-2";
        break;
      case "/Admin/SocietyM":
        this.activeIndex = "3-1";
        break;
        case "/Admin/AddSociety":
        this.activeIndex = "3-2";
        break;
      case "/Admin/TagM":
        this.activeIndex = "4-1";
        break;
        case "/Admin/AddTag":
        this.activeIndex = "4-2";
        break;
    }
  }
};
</script >

<style scoped>
.unknown {
  width: 120px;
  margin-right: 20px;
  display: inline-block;
  position: absolute;
  left: 120px;
}
.el-header {
  background-color: #b3c0d1;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
  background-color: #fff !important;
}
.el-container {
  height: 100vh !important;
}
.el-submenu{
  text-align: left;
}
</style>