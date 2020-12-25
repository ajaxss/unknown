<template>
  <div class="liability-wrapper">
    <div class="outline" >
      <div class="item-wrapper" v-for="(item,index) in val" :key="index">
        <div class="image-wrapper">
          <img :src="item.imgs" class="image" />
        </div>
        <div class="item">
            <div class="title-wrapper">
            <h3 class="title">{{item.title}}</h3>
            </div>
            <span class="content">{{item.content}}</span>
            <span class="date">{{item.addtimes}}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
        val:[]
    };
  },
  created(){
      this.$axios.get('/getsociety')
      .then(res=>{
          res.data.forEach(element => {
              let day = new Date(element.addtimes).toLocaleString().split('上午')[0].replace('/','-').replace('/','-')
              let time = new Date(element.addtimes).toLocaleString().split('上午')[1]
              element.addtimes=day + time
          });
          this.val = res.data;
      })
  }
};
</script>

<style scoped lang="scss">
.liability-wrapper {
  background-color: #fafafa;
  padding-bottom: 50px;
  margin-top: 396px;
  .outline {
    display: flex;
    justify-content: flex-start;
    align-items: center;
  }
}
.outline {
  flex-direction: column;
  padding-top: 80px;
}
.item-wrapper {
  width: 940px;
  height: 198px;
  flex-direction: row;
  background-color: #fff;
  margin: 0 0 58px;
  cursor: pointer;
  .item{
          margin: 0 0 0 36px;
    padding-right: 30px;
    height: 189px;
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-items: flex-start;
    .title-wrapper{
        margin: 10px 0 0;
    font-size: 20px;
    color: #000;
    .title{
        font-size: 24px;
    line-height: 28px;
    margin: 0;
    }
    }
    .content{
            color: #666;
    font-size: 14px;
    line-height: 24px;
    width: 581px;
    height: 48px;
    text-overflow: ellipsis;
    overflow: hidden;
    }
    .date{
        color: #999;
    }
  }
}

.item-wrapper,
.outline {
  display: flex;
  justify-content: flex-start;
  align-items: center;
}
.item-wrapper .image-wrapper {
  height: 100%;
}
.item-wrapper .image-wrapper .image {
  width: 310px;
  height: 100%;
  object-fit: cover;
}
</style>