<template>
  <div class="commentbox">
    <h3>
      <i></i>
      <span>笔记评论</span>
    </h3>
    <div v-for="item in comment" :key="item.c_id" id="contantbox">
      <div class="replaybox">
        <div class="userinfo">
          <span class="headimg"><img :src="item.heads" alt="" /></span>
          <span class="username">{{ item.username }}</span>
        </div>
        <div>
          <span class="icon iconfont iconexit" style="color: gray"
            >&#xe61d;</span
          >
          <span class="likes">800</span>
          <span class="replay" @click="open(item.c_id)">回复</span>
        </div>
      </div>
      <p class="replaycontant">{{ item.comments }}</p>
      <div class="otherbox">
        <div class="otherreplay" v-for="el in item.children" :key="el.c_id">
          <span>{{ el.username }}:</span>
          <p>{{ el.comments }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  created() {
    this.$axios.get(`/getcomment?n_id=${this.$attrs.n_id.n_id}`).then((res) => {
      this.comment = res.data;
    });
  },
  methods: {
    change(val) {
      console.log(val);
    },
    open(cid) {
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
                c_id:cid,
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
                  this.$parent.topshow = false;
                  setTimeout(() => {
                    this.$parent.topshow = true;
                  }, 1);
                  this.$parent.show=false;
                  setTimeout(() => {
                    this.$parent.show = true;
                  }, 1);
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
  },
  data() {
    return {
      nums: 50,
      comment: [],
    };
  },
};
</script>

<style scoped lang='scss'>
.commentbox {
  width: 500px;
  // height: 500px;
  margin-left: 330px;
  margin-top: 30px;
  // background-color: lawngreen;
  margin-bottom: 50px;
  i {
    width: 5px;
    height: 16px;
    display: inline-block;
    background: #ff2442;
    vertical-align: middle;
    margin: 0 7px 0 0;
  }
  span {
    color: #000;
    font-weight: bold;
    vertical-align: middle;
    font-size: 16px;
  }
}
.userinfo {
  .headimg {
    display: inline-block;
    height: 32px;
    width: 32px;
    border-radius: 50%;
    margin-left: 10px;
    margin-right: 10px;
    img {
      width: 32px;
      height: 32px;
      border-radius: 50%;
    }
  }
}
.replaybox {
  display: flex;
  justify-content: space-between;
}
.icon {
  font-size: 20px !important;
  margin-right: 3px;
}
.replaybox .likes {
  color: #666;
  font-size: 14px;
  margin-right: 6px;
}
.replaybox .replay {
  color: #666;
  font-size: 14px;
  font-weight: normal;
  margin-right: 6px;
}
.replaycontant {
  width: 445px;
  margin: 10px 0 0 40px;
  font-size: 14px;
}
.otherbox {
  background-color: #f5f8fa;
  width: 445px;
  margin: 10px 0 0 40px;
  font-size: 14px;
  padding: 0 10px;
  .otherreplay {
    color: #000;
    margin: 10px;
    p {
      display: inline;
    }
  }
}
#contantbox {
  margin: 20px 0;
}
.replay{
  cursor: pointer;
}
</style>