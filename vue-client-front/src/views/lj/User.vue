<template>
  <div class="back">
    <top-menu></top-menu>
    <div class="content1">
      <div class="header-box">
        <img :src="header" alt="头像加载失败" />
      </div>
      <div class="pf-username" @load="icon">
        <h1 class="username">{{ username }}</h1>
        <span
          class="icon iconfont iconexit"
          v-show="icont == true"
          style="color: blue"
          >&#xe609;</span
        >
        <span class="icon iconfont iconexit" v-show="icont == false"
          >&#xe608;</span
        >
      </div>
      <div class="myactive">
        <ul class="myaf">
          <li class="myhref">
            <router-link to="/User/Node">我的笔记</router-link>
          </li>
          <li class="myhref">
            <router-link to="/User/Video">发布视频</router-link>
          </li>
          <li class="myhref">
            <router-link to="/User/Massage">编辑信息</router-link>
          </li>
          <li class="myhref">
            <el-dropdown :hide-on-click="false">
              <span class="el-dropdown-link">
                下拉菜单<i class="el-icon-arrow-down el-icon--right"></i>
              </span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item @click.native="changevue"
                  >退出账号</el-dropdown-item
                >
                <el-dropdown-item @click.native="changelogin"
                  >切换账号</el-dropdown-item
                >
              </el-dropdown-menu>
            </el-dropdown>
          </li>
        </ul>
      </div>
    </div>

    <router-view></router-view>
    <bottom-menu></bottom-menu>
  </div>
</template>

<script >
export default {
  data() {
    return {
      header:
        "https://img.xiaohongshu.com/avatar/5f3ca471c4ee5b00011f914b.jpg@240w_240h_90q_1e_1c_1x.jpg",
      username: "用户1",
      icont: true,
      sex: 1,
      dis: false,
    };
  },
  methods: {
    icon: function () {
      if (this.sex == 1) {
        this.icont = false;
      }
    },
    changevue: function () {
      localStorage.removeItem("u_id");
      this.$router.push("/");
    },
    changelogin: function () {
      localStorage.removeItem("u_id");

      this.$router.push("/login");
    },
  },
  created(){
    //获取用户头像
    let uid=localStorage.getItem('u_id')
     this.$axios.get(`/getheader?u_id=${uid}`)
    .then(res=>{
      let data = res.data
      console.log(data);
      data.map(element => { 
        this.id=element.u_id;      
      this.header=element.heads;
      this.sexs=element.sexs;
      this.username=element.username;
      });
      if (this.sexs==1) {
        this.icont=true
      }else{
        this.icont=false
      }
    })
  }
};
</script>

<style lang="scss">
.back {
  width: 100%;
  height: 100%;
  background-image: url("../../assets/back1.jpg");
  background-repeat: no-repeat;
  background-attachment: scroll;
  background-size: 100% 100%;
}

.content1 {
  width: 920px;
  height: 300px;
  background-color: rgba($color: #7e6aab, $alpha: 0.5);
  margin: 0 auto;
  position: relative;
}
.header-box {
  position: relative;
  width: 100px;
  height: 100px;
  margin: 0 auto;
  top: 48px;
  padding: 4px;
  background: rgba(255, 255, 255, 0.3);
  border-radius: 50%;
  img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
  }
}

.pf-username {
  margin-top: 60px;
  color: #fff;
  text-align: center;
  text-shadow: 0 0 4px rgba(0, 0, 0, 0.5);
  vertical-align: text-bottom;
}
.pf-username .username {
  opacity: 0.6;
  display: inline-block;
  font-size: 16px;
  margin-right: 10px;
}
.iconfont {
  color: pink;
}

.myactive {
  background-color: #fff;
  width: 920px;
  height: 40px;
}

.myactive ul {
  display: flex;
  line-height: 40px;
  margin-top: 100px;
  position: relative;
  justify-content: space-around;
  li {
    cursor: pointer;
    a {
      color: black;
    }
    a:hover {
      color: gold;
    }
  }
  .myhref:hover {
    border-bottom: 3px solid grey;
    span:hover {
      color: gold;
    }
  }
}

  .el-dropdown-link {
    cursor: pointer;
    color: black;
  }
  .el-icon-arrow-down {
    font-size: 16px;
    font-weight: 500;
  }

  .el-dropdown-menu__item{
    width: 60px;
  }
</style>

