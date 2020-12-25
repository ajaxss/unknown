'use strict';

const Controller = require('egg').Controller;

class UserController extends Controller {
	//注册
  async reg() {
    const { ctx } = this;
	let data = ctx.request.body
	console.log(data)
	ctx.body = await ctx.service.user.reg(data);

	
  }
  
  
  
  

}

module.exports = UserController;
