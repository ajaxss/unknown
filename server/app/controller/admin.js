'use strict';

const Controller = require('egg').Controller;

class AdminController extends Controller {
	//登录
  async index() {
    const { ctx } = this;
    let data = ctx.request.body
	ctx.body = await ctx.service.admin.login(data);
  }

  //用户信息
  async user(){
    const {ctx} = this;
    ctx.body = await ctx.service.admin.getuser();
  }

  //删除用户信息
  async deluser(){
    const {ctx} = this;
    ctx.body = await ctx.service.admin.deluser(ctx.request.body.u_id)
  }

  //恢复用户信息
  async revuser(){
    const {ctx} = this;
    ctx.body = await ctx.service.admin.revuser(ctx.request.body.u_id)
  }

  //添加新闻
  async addnews(){
    const {ctx} = this;
    let data = ctx.request.body;
    ctx.body = await ctx.service.admin.addnews(data)
  }

   //新闻信息
   async getnews(){
    const {ctx} = this;
    ctx.body = await ctx.service.admin.getnews();
  }

  async gethotnews(){
    const {ctx} = this;
    ctx.body = await ctx.service.admin.gethotnews();
  }

  async getdynamic(){
    const {ctx} = this;
    ctx.body = await ctx.service.admin.getdynamic();
  }
  async gethonor(){
    const {ctx} = this;
    ctx.body = await ctx.service.admin.gethonor();
  }

  
  

  //删除新闻信息
  async delnews(){
    const {ctx} = this;
    ctx.body = await ctx.service.admin.delnews(ctx.request.body.p_id)
  }

  //恢复新闻信息
  async revnews(){
    const {ctx} = this;
    ctx.body = await ctx.service.admin.revnews(ctx.request.body.p_id)
  }


  //添加责任
  async addsociety(){
    const {ctx} = this;
    let data = ctx.request.body;
    ctx.body = await ctx.service.admin.addsociety(data)
  }

   //责任信息
   async getsociety(){
    const {ctx} = this;
    ctx.body = await ctx.service.admin.getsociety();
  }

  //删除责任信息
  async delsociety(){
    const {ctx} = this;
    ctx.body = await ctx.service.admin.delsociety(ctx.request.body.s_id)
  }

  //恢复责任信息
  async revsociety(){
    const {ctx} = this;
    ctx.body = await ctx.service.admin.revsociety(ctx.request.body.s_id)
  }

  //修改责任
  async updatesociety(){
    const {ctx} = this;
    let data = ctx.request.body;
    ctx.body = await ctx.service.admin.updatesociety(data)
  }

   //修改责任
   async updatepress(){
    const {ctx} = this;
    let data = ctx.request.body;
    ctx.body = await ctx.service.admin.updatepress(data)
  }

 //添加标签
 async addtag(){
  const {ctx} = this;
  let data = ctx.request.body;
  ctx.body = await ctx.service.admin.addtag(data)
}

 //标签信息
 async gettag(){
  const {ctx} = this;
  ctx.body = await ctx.service.admin.gettag();
}

//删除标签信息
async deltag(){
  const {ctx} = this;
  ctx.body = await ctx.service.admin.deltag(ctx.request.body.t_id)
}

//恢复标签信息
async revtag(){
  const {ctx} = this;
  ctx.body = await ctx.service.admin.revtag(ctx.request.body.t_id)
}

}

module.exports = AdminController;
