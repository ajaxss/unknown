<template>
  <div class="home">
    <div id="demo1" v-if="1"></div>
    <textarea
      name=""
      id=""
      cols="170"
      rows="20"
      readonly
      v-model="editorData"
      v-if="0"
    ></textarea>
  </div>
</template>

<script>
// 引入 wangEditor
import wangEditor from "wangeditor";

export default {
  data() {
    return {
      editor: null,
      editorData: "",
    };
  },
  watch:{
      editorData(){
          this.$emit('getcontentmasg',this.editorData)
      }
  },
  mounted() {
    const editor = new wangEditor(`#demo1`);
    editor.config.height = 150;

    // 配置 onchange 回调函数，将数据同步到 vue 中
    editor.config.onchange = (newHtml) => {
      this.editorData = newHtml;
    };

    // 创建编辑器
    editor.create();

    this.editor = editor;
  },
  methods: {
    getEditorData() {
      // 通过代码获取编辑器内容
      let data = this.editor.txt.html();
      alert(data);
    },
  },
  beforeDestroy() {
    // 调用销毁 API 对当前编辑器实例进行销毁
    this.editor.destroy();
    this.editor = null;
  },
};
</script>

<style lang="scss" scoped>
.home {
  width: 100%;
  margin: auto;
  position: relative;
  .btn {
    position: absolute;
    right: 0;
    top: 0;
    padding: 5px 10px;
    cursor: pointer;
  }
  h3 {
    margin: 30px 0 15px;
  }
  #demol {
    height: 200px;
  }
}
</style>
