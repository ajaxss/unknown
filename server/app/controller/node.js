'use strict';
const fs = require('fs');
const path = require('path');
const Controller = require('egg').Controller;

class NodeController extends Controller {

    async index() {
        const { ctx } = this;
        let result = await ctx.service.node.getalltag()
        ctx.body=result;
      
    }
    async addnode() {
        const { ctx } = this;
        let result=await ctx.service.node.addnode(ctx.request.body)
        await ctx.service.node.addtnode(ctx.request.body.taglist,result.insertId)
        ctx.body=result;
    }
    async getallnode() {
        const { ctx } = this;
        let result=await ctx.service.node.getothernode()
        ctx.body=result;
    }
    async getnodetag() {
        const { ctx } = this;
        let result=await ctx.service.node.getnodetag(ctx.query.n_id)
        ctx.body=result;
    }
    async nodeinfo() {
        const { ctx } = this;
        let n_id=ctx.query.n_id;
        let result=await ctx.service.node.getnodeinfo(n_id)
        ctx.body=result;
    }
}

module.exports = NodeController;
