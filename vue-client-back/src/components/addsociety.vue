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
         <div class="title">
          <span style="margin-right:10px">封面上传</span>
    <el-upload
      class="avatar-uploader"
      action="http://192.168.43.135:88/uploads"
      :show-file-list="false"
      :on-success="handleAvatarSuccess"
      :before-upload="beforeAvatarUpload"
    >
      <img v-if="imageUrl" :src="imageUrl" class="avatar" />
      <i v-else class="el-icon-plus avatar-uploader-icon"></i>
    </el-upload>
        </div>
          <div class="mainf">
            <el-form ref="form" :model="form" label-width="120px">
              <el-form-item label="责任标题">
                <el-input v-model="form.title"></el-input>
              </el-form-item>
              <el-form-item label="新闻内容">
                <el-input type="textarea" v-model="form.content" style="height:200px"></el-input>
              </el-form-item>
        </el-upload>
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
      imageUrl: "",
      admin: this.$store.state.userInfo.adminname,
      form: {
        a_id: this.$store.state.userInfo.a_id,
        title: "",
        content: "",
        imgs: "",
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
      this.$axios.post("/addsociety", this.form).then(res => {
        console.log(res);
        if (res.data.code == 1) {
          this.$message({
            message: res.data.msg,
            type: "success"
          });
        } else {
          this.$message.error(res.data.msg);
        }
      });
    },
    outsub() {
      this.from = {
         title: "",
        content: "",
        imgs: "",
      };
    },
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
      this.form.imgs = res.imgurl;
    },
    beforeAvatarUpload(file) {
      const isLt2M = file.size / 1024 / 1024 < 3;

      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 3MB!");
      }
      return  isLt2M;
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
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #DCDFE6;
  width: 400px;
  height: 178px;
  border: 1px solid #DCDFE6;
  border-radius: 4px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 400px;
  height: 178px;
  display: block;
  border-radius: 4px;
}
.title{
  display: flex;
  padding-left: 54px;
  font-size: 14px;
    color: #606266;
    margin-bottom: 15px;
}
</style>