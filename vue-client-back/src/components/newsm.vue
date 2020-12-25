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
            <el-table-column prop="p_id" label="ID" width="50">
            </el-table-column>
            <el-table-column
              prop="release"
              label="新闻标题"
              width="200"
              style="overflow-x:hidden"
            >
            </el-table-column>
            <el-table-column
              prop="regional"
              label="新闻类别"
              width="80"
            ></el-table-column>
            <el-table-column prop="publishing" label="出版社" width="150">
            </el-table-column>
            <el-table-column
              prop="newscontent"
              label="新闻内容"
              style="display:none;"
            >
            </el-table-column>
            <el-table-column prop="status" label="状态" width="50">
            </el-table-column>
            <el-table-column label="操作" style="width:400px">
              <template slot="header" slot-scope="scope" align="right">
                <el-input
                  v-model.trim="search"
                  size="mini"
                  placeholder="输入新闻关键词搜索"
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
                <el-button
                  size="mini"
                  @click="handleedit(scope.$index, scope.row)"
                  >编辑</el-button
                >
              </template>
            </el-table-column>
          </el-table>
        </el-main>
      </el-container>
    </el-container>
      <div :class="mystyle">
            <el-form ref="form" :model="form" label-width="120px">
              <el-form-item label="新闻标题">
                <el-input v-model="form.release"></el-input>
              </el-form-item>
              <el-form-item label="出版社">
                <el-input type="textarea" v-model="form.publishing"></el-input>
              </el-form-item>
              <el-form-item label="新闻版块">
                <el-radio-group v-model="form.regional">
                  <el-radio label="0">热门报道</el-radio>
                  <el-radio label="1">近期动态</el-radio>
                  <el-radio label="2">荣誉奖项</el-radio>
                </el-radio-group>
              </el-form-item>
              <el-form-item label="新闻内容">
                <el-input type="textarea" v-model="form.newscontent"></el-input>
              </el-form-item>
        </el-upload>
              <el-form-item>
                <el-button type="primary" @click="onSubmit">立即修改</el-button>
                <el-button @click="outsub">取消</el-button>
              </el-form-item>
            </el-form>
    </div>
  </div>
</template>

<script>
import { loadavg } from 'os';
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
          p_id: "",
          release: "",
          publishing: "",
          regional: "",
          newscontent: "",
          status: ""
        }
      ],
      form:{
          p_id: "",
          release: "",
          publishing: "",
          regional: "",
          newscontent: "",
          status: ""
      },
      mystyle:"none",
      search: ""
    };
  },
  methods: {
    exit() {
      this.$store.commit("setuerInfo", "");
      localStorage.removeItem("userInfo");
      this.$router.push("/");
    },
    handleedit(index,row){
     this.mystyle="edit";
     this.form = row;
    },
     onSubmit() {
      this.$axios.post('/updatepress',this.form)
      .then(res=>{
          if(res.data.code == 1){
              this.$message({
              message: res.data.msg,
              type: "success"
            });
            this.getuser();
            this.mystyle = "none"
          }else {
            this.$message.error(res.data.msg);
          }
          
      })
    },
    outsub() {
      this.mystyle = "none"
    },
    handleDelete(index, row) {
      if (row.status == 1) {
        this.$axios.post("/delnews", { p_id: row.p_id }).then(res => {
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
        this.$message("新闻已删除，不可重复删除！");
      }
    },
    handlereserve(index, row) {
      if (row.status == 0) {
        this.$axios.post("/revnews", { p_id: row.p_id }).then(res => {
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
        this.$message("新闻状态正常，不需恢复！");
      }
    },
    getuser() {
      this.$axios.get("/getnews").then(res => {
        res.data.forEach(element => {
          if (element.regional == 0) {
            element.regional = "热门报道";
          } else if (element.regional == 1) {
            element.regional = "近期动态";
          } else {
            element.regional = "荣誉奖项";
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
          if (val.release.indexOf(this.search) > -1) {
           
            result.push({
              p_id: val.p_id,
              release: val.release,
              publishing: val.publishing,
              regional: val.regional,
              newscontent: val.newscontent,
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
.none{
  display: none;
}
</style>