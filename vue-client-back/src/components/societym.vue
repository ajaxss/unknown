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
          <el-table :data="tabledata">
            <el-table-column prop="s_id" label="ID" width="50">
            </el-table-column>
            <el-table-column
              prop="title"
              label="责任标题"
              width="200"
              style="overflow-x:hidden"
            >
            </el-table-column>
            <el-table-column
              prop="content"
              label="责任内容"
              width="400"
              hight="200px"
              hidden
            >
            </el-table-column>
            <el-table-column prop="imgs" label="封面" style="display:none;">
            </el-table-column>
            <el-table-column prop="status" label="状态" width="50">
            </el-table-column>
            <el-table-column label="操作" style="width:400px">
              <template slot="header" slot-scope="scope" align="right">
                <el-input
                  v-model.trim="search"
                  size="mini"
                  placeholder="输入社会责任关键词搜索"
                />
              </template>
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="danger"
                  @click="handleDelete(scope.$index, scope.row)"
                  >删除</el-button
                >
                <el-button
                  size="mini"
                  @click="handlereserve(scope.$index, scope.row)"
                  >恢复</el-button
                >
                <el-button size="mini" @click="handleedit(scope.$index, scope.row)"
                  >编辑</el-button
                >
              </template>
            </el-table-column>
          </el-table>
        </el-main>
      </el-container>
    </el-container>
    <div class="edit" :style="mystyle">
       <div class="title">
          <span style="margin-right:10px">封面上传</span>
    <el-upload
      class="avatar-uploader"
      action="http://localhost:88/uploads"
      :show-file-list="false"
      :on-success="handleAvatarSuccess"
      :before-upload="beforeAvatarUpload"
    >
      <img v-if="imageUrl" :src="imageUrl"  class="avatar" />
      <i v-else class="el-icon-plus avatar-uploader-icon"></i>
    </el-upload>
        </div>
          <div class="mainf">
            <el-form ref="form" :model="form" label-width="120px">
              <el-form-item label="责任标题">
                <el-input v-model="form.title"></el-input>
              </el-form-item>
              <el-form-item label="责任内容">
                <el-input type="textarea" v-model="form.content"></el-input>
              </el-form-item>
        </el-upload>
              <el-form-item>
                <el-button type="primary" @click="onSubmit">立即修改</el-button>
                <el-button @click="outsub">取消</el-button>
              </el-form-item>
            </el-form>
          </div>
    </div>

  </div>
</template>

<script>
const delay = (function() {
  let timer = 0;
  return function(callback, ms) {
    clearTimeout(timer);
    timer = setTimeout(callback.ms);
  };
})();
export default {
  data() {
    return {
      mystyle:"display:none",
      imageUrl: "",
      admin: this.$store.state.userInfo.adminname,
      tabledata: [
        {
          s_id: "",
          title: "",
          content: "",
          imgs: "",
          status: ""
        }
      ],
      form:{
          s_id: "",
          title: "",
          content: "",
          imgs: "",
          status: ""
      },
      search: ""
    };
  },
  methods: {
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
      this.form.imgs = res.imgurl;
    },
    handleedit(index,row){
     this.mystyle="";
     this.form = row;
    },
     onSubmit() {
      this.$axios.post('/updatesociety',this.form)
      .then(res=>{
          if(res.data.code == 1){
              this.$message({
              message: res.data.msg,
              type: "success"
            });
            this.getuser();
          }else {
            this.$message.error(res.data.msg);
          }
          
      })
    },
    outsub() {
      this.mystyle = "display:none"
    },
    beforeAvatarUpload(file) {
      const isLt2M = file.size / 1024 / 1024 < 3;

      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 3MB!");
      }
      return isLt2M;
    },
    exit() {
      this.$store.commit("setuerInfo", "");
      localStorage.removeItem("userInfo");
      this.$router.push("/");
    },

    handleDelete(index, row) {
      if (row.status == 1) {
        this.$axios.post("/delsociety", { s_id: row.s_id }).then(res => {
          if (res.data.code == 1) {
            this.getuser();
            this.$message({
              message: res.data.msg,
              type: "success"
            });
          } else {
            this.$message.error(res.data.msg);
          }
        });
      } else {
        this.$message("责任已删除，不可重复删除！");
      }
    },
    handlereserve(index, row) {
      if (row.status == 0) {
        this.$axios.post("/revsociety", { s_id: row.s_id }).then(res => {
          if (res.data.code == 1) {
            this.getuser();
            this.$message({
              message: res.data.msg,
              type: "success"
            });
          } else {
            this.$message.error(res.data.msg);
          }
        });
      } else {
        this.$message("责任状态正常，不需恢复！");
      }
    },
    getuser() {
      this.$axios.get("/getsociety").then(res => {
        this.tabledata = res.data;
      });
    }
  },
  watch: {
    search() {
      //函数节流
      if (this.timer) {
        clearTimeout(this.timer);
      }
      //删除文字  清零
      if (!this.search) {
        this.getuser();
        return;
      }
      this.timer = setTimeout(() => {
        const result = [];
        this.tabledata.forEach(val => {
          if (val.title.indexOf(this.search) > -1) {
            console.log();
            result.push({
              s_id: val.s_id,
              title: val.title,
              content: val.content,
              imgs: val.imgs,
              status: val.status
            });
          }
        });
        this.tabledata = result;
      }, 100);
    }
  },
  created() {
    //获取用户信息
    this.getuser();
  }
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
.el-input {
  width: 200px;
}
.el-table td,
.el-table th {
  padding: 0;
  height: 100px;
}
.el-button {
  margin-left: 20px;
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
  color: #dcdfe6;
  width: 200px;
  height: 178px;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  line-height: 178px;
  text-align: center;
}
.avatar {
  width: 200px;
  height: 178px;
  display: block;
  border-radius: 4px;
}
.title {
  display: flex;
  padding-left: 54px;
  font-size: 14px;
  color: #606266;
  margin-bottom: 15px;
}
.edit{
  width: 600px;
  height: 400px;
  position: absolute;
  top: 140px;
  left: 30%;
  border: 1px solid #606266;
  background-color: #fff;
  z-index: 9999;
  text-align: left;
  padding: 20px;
}
</style>