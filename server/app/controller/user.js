'use strict';
const url = require('url')
const fs = require('fs')
const path = require('path')
const Controller = require('egg').Controller;

class UserController extends Controller {
    //获取用户笔记
    async index() {
        const { ctx } = this;
        console.log(ctx.query)
        ctx.body=await this.ctx.service.node.getallnode(ctx.query.u_id);
    }
    //用户删除笔记
    async indexs() {
        const {ctx} = this;
        ctx.body = await this.ctx.service.node.delnode(ctx.request.body.id);
    }

    //获取已登录用户信息
    async getheader(){
        const {ctx}= this;
        ctx.body = await this.ctx.service.node.gethead(ctx.query.u_id);
    }
    async getuserinfo(){
        const {ctx}= this;
        ctx.body = await this.ctx.service.node.getuserinfo(ctx.query.u_id);
    }
    async userinfo(){
        const {ctx}= this;
        ctx.body = await this.ctx.service.node.userinfo(ctx.query.n_id);
    }
    async userothernode(){
        const {ctx}= this;
        ctx.body = await this.ctx.service.node.userothernode(ctx.query.n_id);
    }
    //修改用户信息
    async updatauser(){
        const {ctx}= this;
        ctx.body = await this.ctx.service.node.updatauser(ctx.request.body)
    }
    async getcomment(){
        const {ctx}= this;
        ctx.body = await this.ctx.service.node.getcomment(ctx.query.n_id)
    }
    async likes(){
        const {ctx}= this;
        let formdata=ctx.request.body;
        ctx.body = await this.ctx.service.node.likes(formdata)
    }
    async comment(){
        const {ctx}= this;
        let formdata=ctx.request.body;
        ctx.body = await this.ctx.service.node.comment(formdata)
    }

    

}

module.exports = UserController;
