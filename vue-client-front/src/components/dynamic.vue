<template>
  <div class="topnav">
    <p class="dynamic">近期动态</p>
    <div class="dynamicnews">
      <div class="dynamicnav" v-for="item in newsarr" :key="item.p_id">
        <div class="dynamicright">{{ item.release }}</div>
        <div class="dynamicight">
          {{ item.addtimes }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      newsarr: [],
    };
  },
  created() {
    this.$axios
      .get("/getdynamic")
      .then((res) => {
        console.log(res.data);
        res.data.forEach((item) => {
          console.log(1);
          console.log(new Date(item.addtimes).toLocaleString().split(" "));
          item.addtimes = new Date(item.addtimes)
            .toLocaleString()
            .split(" ")[0];
        });
        this.newsarr = res.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>

<style  lang="scss">
.topnav{
    margin-top: 200px;
}
.dynamic {
  margin-bottom: 50px;
  font-size: 36px;
  line-height: 50px;
  font-weight: 700;
  color: #333;
  text-align: center;
}
.dynamicnews {
  width: 940px;
  //   height: 500px;
  margin: 0 auto;
  .dynamicnav {
    font-size: 14px;
    line-height: 16px;
    color: #333;
    margin: 0 0 40px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    cursor: pointer;
  }
}
.dynamicnav:hover{
    color: red;
}
</style>
