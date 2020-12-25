<template>
  <div>
    <header>
      <top-menu></top-menu>
    </header>
    <nav>
      <div class="aboutlogin">
        <el-tabs v-model="activeName" @tab-click="handleClick"> 
          <el-tab-pane label="登录" name="first">
            <el-form
              :model="ruleForm"
              :rules="rules"
              ref="ruleForm"
              label-width="100px"
              class="demo-ruleForm"
            >
              <div class="nav-login">
                <el-form-item label="用户名" prop="name">
                  <el-input v-model="ruleForm.name"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="password">
                  <el-input v-model="ruleForm.password" type="password"></el-input>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="submitForm('ruleForm')"
                    >登录</el-button
                  >
                </el-form-item>
              </div>
            </el-form>
          </el-tab-pane>
      
          <el-tab-pane label="注册" name="second">
            <el-form
              :model="ruleForm"
              :rules="rules"
              ref="ruleForm"
              label-width="100px"
              class="demo-ruleForm"
            >
              <div class="nav-login">
                <el-form-item label="用户名" prop="name">
                  <el-input v-model="ruleForm.name"></el-input>
                </el-form-item>
                 <el-form-item label="手机号" prop="tellphone">
                  <el-input v-model="ruleForm.tellphone"></el-input>
                </el-form-item>
                <el-form-item label="密码" prop="password">
                  <el-input type="password" v-model="ruleForm.password" auto-complete="off"></el-input>
                </el-form-item>
                
                <el-form-item label="性别" prop="gender">
                  <el-radio-group v-model="ruleForm.gender">
                    <el-radio label="男"></el-radio>
                    <el-radio label="女"></el-radio>
                  </el-radio-group>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="submitForm('ruleForm')"
                    >注册</el-button
                  >
                  <el-button @click="resetForm('ruleForm')">重置</el-button>
                </el-form-item>
              </div>
            </el-form>
          </el-tab-pane>
        </el-tabs>
      </div>
    </nav>
    <bottom-menu></bottom-menu>
  </div>
</template>

<script>

export default {
  data() {
    let validatePass = (rules, value, callBack) => {
      let reg = /^(?=.*\d+)(?=.*[A-Za-z]+)(?=.*_+).{6,16}$/i;
      if (reg.test(value)) {
        callBack();
      } else {
        callBack(new Error("密码6-16位，必须包含数字，字母，下划线"));
      }
    };
    let tellphone =  (rules, value, callBack) => {
      let reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
      if (reg.test(value)) {
        callBack();
      } else {
        callBack(new Error("手机号必须是11位数字"));
      }
    };

    return {
      activeName: "first",
      ruleForm: {
        name: "",
        password: "",
      },
      rules: {
        name: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          { min: 3, max: 8, message: "长度在 3 到 8 个字符", trigger: "blur" },
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          {
            min: 6,
            max: 16,
            message: "长度在 6 到 16 个字符",
            trigger: "blur",
          },
          { validator: validatePass, trigger: "blur" },
        ],
       
       
      },
    };
  },
  methods: {
   handleClick(tab, event) {
      // console.log(tab, event);
       this.$router.push("/register");

      // console.log(this);
     
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
         
           this.$axios.post('/userlogin',this.ruleForm).then((res)=>{
            
             if(res.data.code == 1){
               
               this.$message({
                message: '登录成功',
                type: 'success'
              });
               //返回页面需要具体
               localStorage.setItem('u_id',res.data.u_id)
                this.$router.push("/User/Node");
             }else{
                // this.$message("登录不通过");
                this.$message.error(res.data.msg);
             }

            // console.log(res.data.code)//判断后端返回数据code-0或1

          })
          //返回到.......
          
        } else {
          console.log("没有通过前端验证!");
          return false;
        }
      });
    }
     
    
  },
};
</script>

<style scoped>
header {
  height: 106px;
  width: 100%;
  background-color: #ffffff;
  /* background-color: red; */
}
header img {
  margin-top: 53px;
  padding: 0px 93px;
  display: flex;
  justify-content: start;
  /* justify-items: stretch;  */
}
nav {
  background-color: #f5f8fa;
  padding: 100px;

  /* background-color: red; */
}
.aboutlogin {
  padding: 10px 10px;
  height: 350px;
  width: 500px;
  margin: 50px auto;
  border-radius: 10px;
  background-color: #fff;
  box-shadow: 0 5px 15px 0 rgba(0,0,0,.1);
}
.nav-login {
  width: 100%;
  height: 100%;
  margin: 0 -30px;
  /* background-color: red; */
}
</style>