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
            <el-table-column prop="t_id" label="ID"> </el-table-column>
            <el-table-column prop="tagname" label="标签名"> </el-table-column>
            <el-table-column label="操作" style="width:400px">
              <template slot="header" slot-scope="scope" align="right">
                <el-input
                  v-model.trim="search"
                  size="mini"
                  placeholder="输入标签关键词搜索"
                />
              </template>
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="danger"
                  @click="handleDelete(scope.$index, scope.row)"
                  >删除</el-button
                >
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
      admin: this.$store.state.userInfo.adminname,
      tabledata: [
        {
          t_id: "",
          tagname: "",
        }
      ],
      search: ""
    };
  },
  methods: {
    exit() {
      this.$store.commit("setuerInfo", "");
      localStorage.removeItem("userInfo");
      this.$router.push("/");
    },

    handleDelete(index, row) {
        this.$axios.post("/deltag", { t_id: row.t_id }).then(res => {
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
      
    },
    getuser() {
      this.$axios.get("/gettag").then(res => {
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
          if (val.tagname.indexOf(this.search) > -1) {
            console.log();
            result.push({
              t_id: val.t_id,
              tagname: val.tagname,
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
</style>