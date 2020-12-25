<template>
  <div class="nodeauthor">
    <h3>笔记作者</h3>
    <div class="author">
      <img :src="headphoto" alt="" />
      <h6>{{ authorname }}</h6>
    </div>
    <div class="tag">
      <div>
        <span class="tag1">笔记</span>
        <span class="tag2">{{ nodenum }}</span>
      </div>
      <div>
        <span class="tag1">粉丝</span>
        <span class="tag2">{{ fans }}</span>
      </div>
      <div>
        <span class="tag1">点赞数</span>
        <span class="tag2">{{ getlikes }}</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      headphoto:
        "https://img.xiaohongshu.com/avatar/5e71ea1f9bfac40001dc3740.jpg@240w_240h_90q_1e_1c_1x.jpg",
      authorname: "crush",
      nodenum: 887,
      fans: 883,
      getlikes: 884,
    };
  },
  created(){
    this.$axios.get(`/getauthorinfo?n_id=${this.$attrs.n_id.n_id}`).then(res=>{
      this.headphoto=res.data[0].heads;
      this.authorname=res.data[0].username;
      this.nodenum=res.data[0].nodes;
      this.getlikes=res.data[0].likes;
    }).catch(error=>{
      console.log(error)
    })
  },
};
</script>

<style scoped lang='scss'>
.nodeauthor {
  border-radius: 4px;
  width: 320px;
  height: 176px;
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
  .author {
    position: relative;
    border-bottom: 1px solid #eee;
    img {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      margin-top: 10px;
      margin-left: 10px;
    }
    h6 {
      margin-left: 80px;
      font-size: 16px;
      color: #333;
      position: absolute;
      top: 10px;
    }
  }
  .tag {
    display: flex;
    justify-content: space-around;
    margin-top: 15px;
    div {
      width: 70px;
      height: 42px;
      display: flex;
      flex-direction: column;
      text-align: center;
      .tag1 {
        color: #999;
        font-size: 14px;
      }
      .tag2 {
        font-size: 14px;
      }
    }
  }
}
</style>