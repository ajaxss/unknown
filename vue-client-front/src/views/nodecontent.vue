<template>
  <div>
    <content-top :n_id='n_id' v-if="topshow"></content-top>
    <content-botoom :n_id='n_id' v-if="show"></content-botoom>
  </div>
</template>

<script>
import contenttop from "../components/content-top";
import contentbottom from "../components/content-bottom";
export default {
  data() {
    return {
      n_id: "",
      show:true,
      topshow:true,
    };
  },
  components: {
    "content-top": contenttop,
    "content-botoom": contentbottom,
  },
  created() {
    this.n_id=this.$route.query
    console.log(111,this.$route)
  },
};
</script>

<style>
</style>