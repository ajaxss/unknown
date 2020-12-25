<template>
  <div class="topnav">
    <p class="hottitle">荣誉奖项</p>
    <div class="hotnews">
      <div class="hotnewsnav" v-for="item in newsarr" :key="item.p_id">
        <div class="navleft">{{item.release}}</div>
        <div class="navright">
            <div class="post">{{item.publishing}}</div>
            <div class="time">{{item.addtimes}}</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
    data(){
       return{
           newsarr:[]
       }
    },
    created(){
        this.$axios.get('/gethonor').then(res=>{
            console.log(res.data)
            res.data.forEach(item=>{
                console.log(1)
                console.log(new Date(item.addtimes).toLocaleString().split(' '))
                item.addtimes=new Date(item.addtimes).toLocaleString().split(' ')[0]
            })
            this.newsarr=res.data;
        }).catch((error)=>{
            console.log(error)
        })
    }
};
</script>

<style scoped lang="scss">
.topnav{
    margin-top: 200px;
    margin-bottom: 150px;
}
.hottitle {
  margin-bottom: 50px;
  font-size: 36px;
  line-height: 50px;
  font-weight: 700;
  color: #333;
  text-align: center;
}
.hotnews {
  width: 940px;
//   height: 500px;
  margin: 0 auto;
  .hotnewsnav {
    font-size: 14px;
    line-height: 16px;
    color: #333;
    margin: 0 0 40px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    cursor: pointer;
    .navright{
        display: flex;
        .post{
            margin-right: 50px;
        }
    }
  }
}
.hotnewsnav:hover{
    color: red;
}
</style>