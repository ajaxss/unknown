<template>
  <div class="corrnode">
    <h3>相关视频</h3>
    <div class="videobox">
      <div
        class="videoboxnav"
        v-for="item in nodes"
        :key="item.n_id"
        @click="shownode(item.n_id)"
      >
        <div :style="{ backgroundImage: `url(${item.imgs})` }"></div>
        <div class="titlebox">
          <p>{{ item.nodetitle }}</p>
          <span class="icon iconfont iconexit" style="color: gray"
            >&#xe613;</span
          >
          <span class="likenum">{{ item.likes }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  created() {
    this.$axios
      .get(`/getuserothernode?n_id=${this.$attrs.n_id.n_id}`)
      .then((res) => {
        this.nodes = res.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    shownode(id) {
      this.$router.push(`/Explore/nodemsg?n_id=${id}`);
      window.location.reload();
    },
  },
  data() {
    return {
      nodes: [],
    };
  },
};
</script>

<style scoped lang='scss'>
.corrnode {
  border-radius: 4px;
  width: 320px;
  /* background-color: greenyellow; */
  border: 1px solid #eee;
  margin-bottom: 10px;
  box-sizing: border-box;
  h3 {
    font-weight: 500;
    font-size: 16px;
    padding: 10px 0 10px 20px;
    margin: 0;
    border-bottom: 1px solid #eee;
  }
  .videobox {
    height: 400px;
    overflow: scroll;
    .videoboxnav {
      width: 280px;
      height: 80px;
      margin: 10px 20px;
      display: flex;
      color: #555;
      cursor: pointer;

      //   background-color: hotpink;
      div {
        height: 80px;
        width: 80px;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: 50%;
        margin-right: 10px;
        border-radius: 4px;
      }
      .titlebox {
        width: 190px;
        height: 70px;
        //   background-color: indigo;
        display: inline-block;
        margin-top: 3px;
        p {
          width: 100%;
          font-size: 14px;
        }
        .icon {
          margin-top: 15px;
          display: inline-block;
        }
        .likenum {
          margin-left: 5px;
          color: #555;
        }
      }
    }
  }
}
.videobox::-webkit-scrollbar {
  display: none;
}
.videoboxnav:hover {
  color: #ff2442 !important;
}
</style>