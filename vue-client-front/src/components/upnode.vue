<template>
  <div class="upnode-nav">
    <div class="nav-left">
      <h2>发布视频笔记</h2>
      <h3>预览效果</h3>
      <div class="nodemp3">
        <label for="upfile">
          <div>
            <div class="addimag">
              <img :src="imgsrc" />
              <p class="addimgmsg">拖拽或点击上传视频</p>
              <p class="addimgmsg2">
                可上传5分钟之内，大小不超过2GB的视频 支持 mp4 格式
              </p>
            </div>
            <video
              :src="videoSrc"
              controls="conrotls"
              v-show="mp4show"
              style="width= 100%; height=100%; object-fit: fill"
            ></video>
          </div>
        </label>
        <input
          type="file"
          @change="getBigectURL()"
          id="upfile"
          v-show="false"
          ref="videomsg"
        />
      </div>
      <label for="upfile">
        <div class="reup" v-show="reupshow" @click="reupmp4">重新上传</div>
      </label>
    </div>
    <div class="nav-right">
      <h3>视频封面</h3>
      <el-upload
        class="avatar-uploader"
        action="http://localhost:88/uploads"
        :show-file-list="false"
        :on-success="handleAvatarSuccess"
        :before-upload="beforeAvatarUpload"
      >
        <img v-if="imageUrl" :src="imageUrl" class="avatar" />
        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
      </el-upload>
      <h3>笔记内容</h3>
      <el-input
        placeholder="填写笔记的标题，最多20字"
        v-model="nodetitel"
        clearable
      >
      </el-input>
      <wange @getcontentmasg="contentmsg"></wange>
      <el-checkbox-group v-model="checkList">
        <el-checkbox
          v-for="item in taglist"
          :key="item.t_id"
          :label="item.tagname"
        ></el-checkbox>
      </el-checkbox-group>
      <el-button type="primary" round @click.native="submitnode"
        >发布</el-button
      >
    </div>
  </div>
</template>

<script>
import addmp4 from "../assets/添加.png";
export default {
  data() {
    return {
      videoSrc: "",
      mp4show: false,
      imgsrc: addmp4,
      reupshow: false,
      imageUrl: "",
      nodetitel: "",
      nodecontent: "",
      checkList: [],
      taglist: [],
      mp4url: "",
      imgurl: "",
      submittaglist: [],
    };
  },
  methods: {
    contentmsg(msg) {
      this.nodecontent = msg;
    },
    getBigectURL() {
      // console.log("getBigectURL", event);
      let file = this.$refs.videomsg.files[0];
      var current = event.target.files[0];
      var fileReader = new FileReader();
      fileReader.readAsDataURL(current);
      var that = this;
      fileReader.onload = function (e) {
        that.videoSrc = e.currentTarget.result;
        let formdata = new FormData();
        formdata.append("video", file);
        that.$axios
          .post("/upload", formdata)
          .then((res) => {
            that.mp4url = res.data;
          })
          .catch((error) => {
            console.log(error);
          });
        if (that.videoSrc) {
          that.mp4show = true;
          that.reupshow = true;
        } else {
          that.mp4show = false;
          that.reupshow = false;
        }
      };
    },
    reupmp4() {
      this.reupshow = false;
      this.mp4show = false;
    },
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
      this.imgurl = res.imgurl;
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isJPG && isLt2M;
    },
    submitnode() {
      let that=this;
      if (this.nodetitel) {
        if (this.nodecontent) {
          let formdata = {};
          formdata.nodetitel = this.nodetitel;
          formdata.content = this.nodecontent;
          formdata.imgs = this.imgurl;
          let u_id = localStorage.getItem("u_id");
          formdata.u_id = u_id;
          formdata.video = this.mp4url.mp4url;
          this.checkList.forEach((item1, index1) => {
            this.taglist.forEach((item2, index2) => {
              if (item1 == item2.tagname) {
                this.submittaglist.push(item2.t_id);
              }
            });
          });
          formdata.taglist = this.submittaglist;
          this.$axios.post("/publishnode", formdata).then(res=>{
            that.$router.push('/User/Node')
          }).catch(error=>{
            console.log(error)
          });
        } else {
          this.$message.error("内容不能为空哦");
        }
      } else {
        this.$message.error("标题不能为空哦");
      }
    },
  },
  created() {
    this.$axios
      .get("/getalltag")
      .then((res) => {
        this.taglist = res.data;
      })
      .catch((error) => {
        console.log(error);
      });
  },
};
</script>

<style scoped lang='scss'>
.upnode-nav {
  width: 920px;
  height: 867px;
  display: flex;
  justify-content: space-evenly;
  background-color: white;
  overflow: hidden;
  margin: 50px auto;
}
.nodemp3 {
  width: 315px;
  height: 562px;
  border-radius: 20px;
  background-color: #fafafa;
  border: 1px solid #e6e6e6;
  position: relative;
  overflow: hidden;

  div {
    width: 100%;
    height: 100%;
    z-index: 9999;
    cursor: pointer;
    video {
      width: 100%;
      height: 100%;

      border-radius: 20px;
      z-index: 1;
      position: absolute;
      top: 0;
    }
  }
}
.nav-right {
  width: 430px;
  height: 680px;
  margin-top: 115px;

  // background-color: lawngreen;
  margin-left: -80px;

  text-align: left;
  h3 {
    font-weight: 500;
    font-size: 18px;
    margin: 0 0 20px;
    color: #333;
  }
  .el-upload {
    display: flex;
    justify-content: center;
    align-content: center;
    i {
      border-radius: 6px;
      cursor: pointer;
      width: 100.5px;
      height: 134px;
      display: block;
    }
    .el-icon-plus:before {
      position: absolute;
      top: 0px;
      left: 38px;
    }
  }
}
.nav-left {
  width: 317px;
  height: 817px;
  text-align: left;
  margin-right: 60px;
  h2 {
    font-weight: 400;
    font-size: 35px;
    margin: 35px 0;
    color: #333;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  h3 {
    color: #333;
    font-weight: 500;
    font-size: 18px;
    margin: 0 0 20px;
  }
}
.addimgmsg {
  margin: 20px 0 10px;
  font-size: 18px;
  font-weight: 600;
  color: #2c2c2c;
  line-height: 24px;
}
.addimgmsg2 {
  width: 80%;
  text-align: center;
  font-size: 14px;
  font-weight: 400;
  color: #999;
  line-height: 22px;
}
.addimag {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
.reup {
  width: 282px;
  height: 35px;
  background: #fff;
  border-radius: 8px;
  border: 1px solid #e6e6e6;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 14px;
  line-height: 20px;
  padding: 0 15px;
  font-weight: 500;
  color: #5b92e1;
  cursor: pointer;
  margin-top: 20px;
}

.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 100.5px;
  height: 134px;
  line-height: 134px;
  text-align: center;
}
.avatar {
  width: 100.5px;
  height: 134px;
  display: block;
}
.el-input {
  margin-bottom: 20px;
}
.el-textarea {
  margin-bottom: 20px;
}
.el-checkbox {
  margin-bottom: 10px;
}
.el-checkbox-group {
  text-align: left;

  margin-top: 10px;
}
// .el-button.is-round {
//   margin-top: 10px;

// }
</style>