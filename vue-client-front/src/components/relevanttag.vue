<template>
  <div class="relevanttagnav">
    <h3>相关标签</h3>
    <div>
      <span
        v-for="item in taglist"
        :key="item.tn_id"
        @click="gett_id(item.t_id)"
        >{{ item.tagname }}</span
      >
    </div>
  </div>
</template>

<script>
export default {
  created() {
    this.$axios
      .get(`/getnodetag?n_id=${this.$attrs.n_id.n_id}`)
      .then((res) => {
        console.log(111,res)
        this.taglist = res.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  data() {
    return {
      taglist: [],
    };
  },
  methods: {
    gett_id(id) {
    },
  },
};
</script>

<style scoped lang='scss'>
.relevanttagnav {
  border-radius: 4px;
  width: 320px;
  //   height: 176px;
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
  div {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    // align-content: center;
    span {
      background: rgba(91, 146, 225, 0.2);
      border-radius: 24px;
      cursor: pointer;
      color: #333;
      padding: 6px 12px;
      margin: 10px;
    }
  }
}
</style>