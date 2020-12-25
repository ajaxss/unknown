<template>
  <div>
    <div class="top">
      <div class="unknown">
        <div class="logo">
          <img src="../assets/项目logo.png" alt="" />
        </div>
      </div>
    </div>
    <div class="content">
      <div class="login">
        <div class="login-header">
          <div class="active">
            管理员界面登录
          </div>
        </div>
        <div class="mylogin">
          <el-form status-icon label-width="60px" class="demo-ruleForm">
            <el-form-item label="账号">
              <el-input v-model="name" placeholder="请输入用户名"></el-input>
            </el-form-item>
            <el-form-item label="密码" prop="pass">
              <el-input
                type="password"
                v-model="pass"
                autocomplete="off"
                placeholder="请输入密码"
              ></el-input>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="submitForm()">提交</el-button>
              <el-button @click="resetForm()">重置</el-button>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <el-button :plain="true" style="display:none"></el-button>
  </div>
</template>

<script>

export default {
  data() {
    return {
      labelPosition: "left",
      pass: "",
      name: ""
    };
  },
  methods: {
    submitForm() {
      let formdata = {};
      formdata.passwd = this.pass;
      formdata.adminname = this.name;
      this.$axios.post("/alogin", formdata).then(res => {
        
        if (res.data.code == 1) {
          this.$message({
            message: "登录成功",
            type: "success"
          });
           this.$store.commit("setuerInfo",res.data.results[0])
          this.$router.push("/Admin");
        //   localStorage.setItem('results',res.data.results[0])
        } else {
           this.$store.commit("setuerInfo","")
          this.$message.error(res.data.msg);
        }
      });
    },
    resetForm() {
      this.pass = "";
      this.name = "";
    },
    
  },
  created() {
  }
};
</script>


<style scoped>
.top {
  z-index: 999;
  display: flex;
  width: 100%;
  height: 106px;
  padding-right: 15px;
  background-color: #fff;
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

.content {
  width: 100%;
  flex: 1;
  height: auto;
  background: #f5f8fa;
  display: flex;
  align-items: center;
  justify-content: center;
}

.login {
  width: 420px;
  height: 390px;
  background: #fff;
  border-radius: 12px;
  padding: 61px 64px 0;
  box-shadow: 0 5px 15px 0 rgba(0, 0, 0, 0.1);
  margin: 64px 50px;
}

.login-header {
  display: flex;
  width: 100%;
  align-items: center;
  border-bottom: 1px solid #eee;
}

.login-header > div.active {
  cursor: auto;
  color: #333;
  position: relative;
  background: transparent;
}

.login-header > div {
  flex: 1;
  text-align: center;
  position: relative;
  cursor: pointer;
  font-size: 18px;
  color: #999;
  line-height: 40px;
}

.login-header > div:hover {
  background: #fbfbfb;
}

.login-header > div.active:after {
  content: "";
  position: absolute;
  left: 0;
  right: 0;
  bottom: -1px;
  height: 2px;
  width: 100%;
  background: #ff2442;
}
:after,
:before {
  box-sizing: border-box;
}

.mylogin {
  width: 300px;
  height: 230px;
  margin-top: 40px;
  text-align: left;
}
.el-form-item__label {
  text-align: left!important;
  width: 60px !important;
}
.el-form-item__content {
  margin-left: 60px !important;
}
.myclass1 {
  display: block;
  margin-bottom: 10px;
  margin-left: 20px;
  font-size: 12px;
  color: red;
}
.el-form-item{
  margin-right: 10px;
}
</style>