<template>
  <div class="nav">
    <div class="video">
      <video :src="videosrc" controls="controls"></video>
    </div>
    <h1>{{ titel }}</h1>
    <div class="content" v-html="content"></div>
    <div class="interaction">
      <span class="icon iconfont iconexit" style="color: gray" @click="givelike"
        >&#xe613;</span
      >
      <span>{{ likes }}</span>
      <span class="icon iconfont iconexit" style="color: gray" @click="open"
        >&#xe607;</span
      >
      <span>{{ replays }}</span>
      <span class="icon iconfont iconexit" style="color: gray">&#xe73d;</span>
      <span>{{ collects }}</span>
    </div>
    <div class="releasetime">
      <span>发布于 {{ retime }}</span>
    </div>
  </div>
</template>

<script>
import bus from "@/Bus.js";
export default {
  methods: {
    open() {
      if (localStorage.getItem("u_id")) {
        this.$prompt("请输入您的评论", "评论", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          inputPattern: /.{1,}/s,
          inputErrorMessage: "评论不能为空哦",
        })
          .then(({ value }) => {
            this.$axios
              .post("/comment", {
                n_id: this.$attrs.n_id.n_id,
                u_id: localStorage.getItem("u_id"),
                comments: value,
              })
              .then((res) => {
                console.log(res);
                if (res.data.code == 1) {
                  this.$message({
                    message: "评论成功成功",
                    type: "success",
                  });
                  this.replays+=1;
                  // window.location.reload()
                  this.$parent.$parent.show=false
                  setTimeout(()=>{
                    this.$parent.$parent.show=true
                  },1)
                  
                }
              })
              .catch((error) => {
                console.log(error);
              });
          })
          .catch(() => {
            this.$message({
              type: "info",
              message: "取消评论",
            });
          });
      } else {
        this.$message.error("你还没有登录哦，快去登录吧");
        setTimeout(() => {
          this.$router.push("/login");
        }, 3000);
      }
    },
    givelike() {
      let formdata = {};
      formdata.n_id = this.$attrs.n_id.n_id;
      formdata.u_id = localStorage.getItem("u_id");
      if (localStorage.getItem("u_id")) {
        this.$axios.post("/like", formdata).then((res) => {
          if (res.data.code == 1) {
            this.$message({
              message: "点赞成功",
              type: "success",
            });
            this.likes += 1;
          } else {
            this.$message({
              message: "取消点赞",
              type: "success",
            });
            this.likes -= 1;
          }
        });
      } else {
        this.$message.error("你还没有登录哦，快去登录吧");
        setTimeout(() => {
          this.$router.push("/login");
        }, 3000);
      }
    },
  },
  created() {
    this.n_id = this.$attrs.n_id.n_id;
    this.$axios
      .get(`/getnodeinfo?n_id=${this.n_id}`)
      .then((res) => {
        this.videosrc = res.data[0].video;
        this.titel = res.data[0].nodetitle;
        this.content = res.data[0].content;
        this.likes = res.data[0].likes;
        this.replays = res.data[0].replays;
        this.retime = new Date(res.data[0].addtimes).toLocaleString();
        this.u_id = res.data[0].u_id;
        bus.$emit("passuid", this.u_id);
      })
      .catch((error) => {
        console.log(error);
      });
  },
  data() {
    return {
      videosrc:
        "http://localhost:88/public/mp4/14d73dd7-b201-42b9-8ea8-785eff98a285.mp4",
      titel: "玩乐vlog | 迪士尼万圣节美食all in啦！",
      content:
        "<p>分享一个我最近超爱的口袋打印机给大家</p><p>可以打印文档，还可以打印图案，撕开背胶就可以贴</p><p>自己DIY，就可以拥有超多胶带跟贴纸了</p><p>还是懒得写字懒得画画的手账儿福音哦~</p>",
      likes: 100,
      replays: 200,
      collects: 300,
      retime: "2020-10-30 11:19",
      n_id: "",
      u_id: "",
    };
  },
};
</script>

<style scoped lang='scss'>
.releasetime {
  color: #999;
  font-size: 16px;
}
.nav {
  width: 500px;
  margin-right: 20px;
  .video {
    width: 500px;
    height: 500px;
    video {
      width: 500px;
      height: 500px;
      object-fit: contain;
      background-color: #000;
    }
  }
  h1 {
    font-size: 24px;
    font-weight: 500;
    overflow: hidden;
    text-align: left;
    margin: 10px 0;
  }
  .content {
    width: 500px;
    p {
      margin: 20px 0;
    }
  }
  .interaction {
    margin: 30px 0;
    :nth-child(odd) {
      font-size: 20px !important;
      margin-right: 5px;
    }
    :nth-child(even) {
      margin-right: 15px;
    }
    font-size: 20px;
    span {
      color: gray;
    }
  }
}
.icon {
  cursor: pointer;
}
</style>