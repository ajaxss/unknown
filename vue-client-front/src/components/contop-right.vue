<template>
  <div class="nav">
    <nodeauthor v-bind="$attrs"></nodeauthor>
    <relevanttag v-bind="$attrs"></relevanttag>
    <correnode v-bind="$attrs"></correnode>
  </div>
</template>

<script>
import bus from '@/Bus.js'
import nodeauthor from'./nodeauthor'
import relevanttag from './relevanttag'
import correnode from './correnode'
export default {
components:{
  nodeauthor:nodeauthor,
  relevanttag:relevanttag,
  correnode:correnode
},
created(){
  bus.$on('passuid',uid=>{
    this.u_id=uid;
  })
},
data(){
  return{
    u_id:''
  }
}
}
</script>

<style scoped>
.nav{
    width: 320px;
    height: 500px;
    /* background-color: lightcyan; */
    margin-left: 20px;
}
</style>