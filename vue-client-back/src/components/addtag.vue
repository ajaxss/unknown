<template>
  <div class="content1">
    <el-container style="height: 500px; border: 1px solid #eee">
      <el-container>
        <el-header style="text-align: right; font-size: 12px">
          <div class="unknown">
            <div class="logo">
              <img src="../assets/项目logo.png" alt="" />
            </div>
          </div>
          <el-button :plain="true" class="mubutton"></el-button>
          <el-dropdown>
            <i class="el-icon-setting" style="margin-right: 15px"></i>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item @click.native="exit">退出账号</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
          <span>欢迎回来，亲爱的{{ admin }}！</span>
        </el-header>
        <el-main>
          <div class="mainf">
            <el-form ref="form" :model="form" label-width="120px">
              <el-form-item label="标签名">
                <el-input v-model="form.tagname"></el-input>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="onSubmit">立即创建</el-button>
                <el-button @click="outsub">取消</el-button>
              </el-form-item>
            </el-form>
          </div>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
export default {
  data() {
    return {
      admin: this.$store.state.userInfo.adminname,
      form: {
        a_id:this.$store.state.userInfo.a_id,
        tagname:"",
      }
    };
  },
  methods: {
    exit() {
      this.$store.commit("setuerInfo", "");
      localStorage.removeItem("userInfo");
      this.$router.push("/");
    },
    onSubmit() {
      this.$axios.post('/addtag',this.form)
      .then(res=>{
          if(res.data.code == 1){
              this.$message({
              message: res.data.msg,
              type: "success"
            });
          }else {
            this.$message.error(res.data.msg);
          }
          
      })
    },
    outsub() {
      this.from = {
        tagname:"",
      };
    }
  },
  watch: {},
  created() {}
};
</script>

<style scoped>
.content1 {
  width: 100%;
}
.el-header {
  background-color: #b3c0d1;
  color: #333;
  line-height: 60px;
}
.unknown {
  width: 120px;
  margin-right: 20px;
  display: inline-block;
  position: absolute;
  left: 15%;
}

.el-aside {
  color: #333;
  background-color: #fff !important;
}
.el-container {
  height: 100vh !important;
}
.mubutton {
  display: none;
}
.mainf {
  width: 50%;
  text-align: left;
}
</style>