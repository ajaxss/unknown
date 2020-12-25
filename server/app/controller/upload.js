'use strict';
const fs = require('fs');
const path = require('path');
const Controller = require('egg').Controller;

class UploadController extends Controller {

    async index() {
        const { ctx } = this;
        let file = ctx.request.files[0];
        let dest = path.dirname(__dirname) + '/public/mp4/' + path.basename(file.filepath);
        fs.copyFileSync(file.filepath, dest);
        let cc = this.app.config.cluster.listen;
        let mp4url = `http://${cc.hostname}:${cc.port}/public/mp4/${path.basename(file.filepath)}`;
        ctx.body = { mp4url };
    }
    async indexs() {
        const { ctx } = this;
        let file = ctx.request.files[0];
        let dest = path.dirname(__dirname) + '/public/img/' + path.basename(file.filepath);
        fs.copyFileSync(file.filepath, dest);
        let cc = this.app.config.cluster.listen;
        let imgurl = `http://${cc.hostname}:${cc.port}/public/img/${path.basename(file.filepath)}`;
        ctx.body = { imgurl };
    }
}

module.exports = UploadController;
