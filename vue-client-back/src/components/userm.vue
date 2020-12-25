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
          <span>欢迎回来，亲爱的{{admin}}！</span>
        </el-header>
        <el-main>
          <el-table :data="tabledata">
            <el-table-column prop="u_id" label="ID" width="50">
            </el-table-column>
            <el-table-column prop="username" label="昵称"> </el-table-column>
            <el-table-column
              prop="sexs"
              label="性别"
              width="50"
            ></el-table-column>
            <el-table-column prop="heads" label="头像" width="200">
            </el-table-column>
            <el-table-column prop="tel" label="电话"> </el-table-column>
            <el-table-column prop="birthday" label="生日"> </el-table-column>
            <el-table-column prop="status" label="状态"> </el-table-column>
            <el-table-column label="操作" style="width:140px">
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
              </template>
            </el-table-column>
            <el-table-column align="right">
              <template slot="header" slot-scope="scope">
                <el-input
                  v-model.trim="search"
                  size="mini"
                  placeholder="输入用户名或id搜索"
                />
              </template>
            </el-table-column>
          </el-table>
        </el-main>
      </el-container>
    </el-container>
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
      admin:this.$store.state.userInfo.adminname,
      tabledata: [
        {
          u_id: "",
          username: "",
          sexs: "",
          heads: "",
          tel: "",
          birthday: "",
          status: ""
        }
      ],
      search: ""
    };
  },
  methods: {
    exit(){
      this.$store.commit("setuerInfo","")
      localStorage.removeItem("userInfo")
      this.$router.push("/")
    },

    handleDelete(index, row) {
      if (row.status == 1) {
        this.$axios.post("/deluser", { u_id: row.u_id }).then(res => {
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
        this.$message("用户已删除，不可重复删除！");
      }
    },
    handlereserve(index, row) {
      if (row.status == 0) {
        this.$axios.post("/revuser", { u_id: row.u_id }).then(res => {
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
        this.$message("用户状态正常，不需恢复！");
      }
    },
    getuser() {
      this.$axios.get("/getuser").then(res => {
        res.data.forEach(element => {
          if (element.sexs == 1) {
            element.sexs = "男";
          } else {
            element.sexs = "女";
          }
        });
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
          if (val.username.indexOf(this.search) > -1) {
            
            result.push({
              u_id: val.u_id,
              username: val.username,
              sexs: val.sexs,
              heads: val.heads,
              tel: val.tel,
              birthday: val.birthday,
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
</style>