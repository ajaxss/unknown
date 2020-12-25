const Service = require('egg').Service;

class NodeService extends Service {
  async getalltag() {
    const results = await this.app.mysql.select('tag', { // 搜索 post 表
      columns: ['t_id', 'tagname'], // 要查询的表字段
    });
    return results;
  }
  async addnode(formdata) {
    console.log(formdata)
    const result = await this.app.mysql.insert('node', {
      nodetitle: formdata.nodetitel,
      u_id: formdata.u_id,
      imgs: formdata.imgs,
      content: formdata.content,
      video: formdata.video
    }); // 在 post 表中，插入 title 为 Hello World 的记录
    console.log(result)
    return result
  }
  async addtnode(taglist, nid) {
    console.log(nid)
    taglist.forEach((item, index) => {
      this.app.mysql.insert('tnode', {
        t_id: item,
        n_id: nid,
      }); // 在 post 表中，插入 title 为 Hello World 的记录
    })
  }
  //获取我的笔记
  async getallnode(u_id) {
    // let uid = ctx.session.u_id;
    console.log(u_id);
    const results = await this.app.mysql.select('node', { // 搜索 post 表
      where: {
        u_id: u_id,
        status: '1'
      }, // WHERE 条件
      columns: ['n_id', 'nodetitle', 'imgs'], // 要查询的表字段
      orders: [
        ['n_id', 'desc']
      ], // 排序方式
    });
    return results;
  }
  async userothernode(n_id) {
    const result = await this.app.mysql.query(`SELECT * FROM node WHERE n_id=${n_id}`)
    let uid = result[0].u_id
    const results = await this.app.mysql.select('node', { // 搜索 post 表
      where: {
        u_id: uid,
        status: '1'
      }, // WHERE 条件
      columns: ['n_id', 'nodetitle', 'imgs'], // 要查询的表字段
      orders: [
        ['n_id', 'desc']
      ], // 排序方式
    });
    for (let i = 0; i < results.length; i++) {
      let nid = results[i].n_id
      let result1 = await this.app.mysql.query('SELECT * FROM favour WHERE n_id=? AND status=1', [nid])
      results[i].likes = result1.length;
    }
    return results;
  }



  // SELECT n.n_id,n.nodetitle,n.imgs,u.u_id,u.username FROM node AS n , user AS u WHERE n.u_id=u.u_id 
  async getnodetag(n_id) {
    const result = await this.app.mysql.query(`SELECT t_.tagname,t_.t_id,t.tn_id FROM tnode AS t , tag AS t_ WHERE t.n_id=${n_id} AND t.t_id=t_.t_id`);
    return result;
  }
  async getothernode() {
    const result = await this.app.mysql.query('SELECT n.n_id,n.nodetitle,n.imgs,u.u_id,u.username FROM node AS n , user AS u WHERE n.u_id=u.u_id AND n.status=1');
    // result.forEach((item,index)=>{
    //   let nid=item.n_id
    //   let a=[];
    //   let results =await this.app.mysql.query('SELECT * FROM favour WHERE n_id=?',[nid])
    //   console.log(results)
    //   item.likes=2;
    // })
    // return result;
    for (let i = 0; i < result.length; i++) {
      let nid = result[i].n_id
      let results = await this.app.mysql.query('SELECT * FROM favour WHERE n_id=?', [nid])
      console.log(results)
      result[i].likes = results.length;
    }
    return result;
  }
  async getnodeinfo(n_id) {
    const result = await this.app.mysql.query(`SELECT nodetitle,video,content,u_id,addtimes FROM node WHERE n_id=${n_id}`);
    const result2 = await this.app.mysql.query(`SELECT * FROM favour WHERE n_id=${n_id} AND status=1`)
    const result3 = await this.app.mysql.query(`SELECT * FROM comment WHERE n_id=${n_id}`)
    console.log(result2.length)
    result[0].likes = result2.length
    result[0].replays = result3.length
    return result;
  }



  //删除我的笔记
  async delnode(id) {
    const row = {
      status: 0,
      deltimes: this.app.mysql.literals.now, // `now()` on db server
    };
    console.log(id);
    const options = {
      where: {
        n_id: id
      }
    };
    const results = await this.app.mysql.update('node', row, options);
    let result = ''
    if (results.affectedRows) {
      result = {
        code: 1,
        msg: "删除成功"
      }
    } else {
      result = {
        code: 0,
        msg: "删除失败"
      }
    }
    return result;
  }

  //获取用户信息
  async gethead(u_id) {

    const results = await this.app.mysql.select('user', { // 搜索 post 表
      where: {
        u_id: u_id
      }, // WHERE 条件
      columns: ['u_id', 'username', 'sexs', 'heads'], // 要查询的表字段
      orders: [
        ['u_id', 'desc']
      ], // 排序方式
    });
    return results;
  }
  async getuserinfo(u_id) {

    const results = await this.app.mysql.select('user', { // 搜索 post 表
      where: {
        u_id: u_id
      }, // WHERE 条件
      columns: ['u_id', 'username', 'sexs', 'birthday', 'heads'], // 要查询的表字段
    });
    console.log(results)
    return results;
  }
  async userinfo(n_id) {
    const result3 = await this.app.mysql.select('node', {
      where: {
        n_id: n_id
      },
      columns: ['u_id']
    })
    let u_id = result3[0].u_id;
    let nums = 0;
    const result1 = await this.app.mysql.select('user', { // 搜索 post 表
      where: {
        u_id: u_id
      }, // WHERE 条件
      columns: ['u_id', 'username', 'heads'], // 要查询的表字段
    });
    const result = await this.app.mysql.query(`SELECT * FROM node WHERE u_id=${u_id}`);
    for (let i = 0; i < result.length; i++) {
      let nid = result[i].n_id
      let results = await this.app.mysql.query('SELECT * FROM favour WHERE n_id=?', [nid])
      nums += results.length
      console.log(nums)
    }
    result1[0].nodes = result.length;
    result1[0].likes = nums;
    return result1;
  }

  //修改用户信息
  async updatauser(formdata) {

    const row = {
      username: formdata.username,
      sexs: formdata.sexs,
      heads: formdata.heads,
      birthday: formdata.birthday,
      // modifiedAt: this.app.mysql.literals.now, // `now()` on db server
    };
    console.log(formdata.username);
    const options = {
      where: {
        u_id: formdata.uid
      }
    };
    const results = await this.app.mysql.update('user', row, options);
    let result = ''
    if (results.affectedRows) {
      result = {
        code: 1,
        msg: "修改成功"
      }
    } else {
      result = {
        code: 0,
        msg: "修改失败"
      }
    }
    return result;
  }

  async getcomment(n_id) {
    const result = await this.app.mysql.query(`SELECT u.u_id,u.username,c.c_id,c.comments,u.heads FROM comment AS c , user AS u WHERE c.n_id=${n_id} AND c.status=1 AND c.u_id=u.u_id AND c.c1_id=0`);
    for (let i = 0; i < result.length; i++) {
      let results = await this.app.mysql.query(`SELECT u.u_id,u.username,c.c_id,c.comments,u.heads FROM comment AS c , user AS u WHERE c.c1_id=${result[i].c_id} AND c.status=1 AND c.u_id=u.u_id AND n_id=${n_id}`);
      result[i].children = results
    }
    return result;
  }
  async likes(formdata) {
    const result = await this.app.mysql.query(`SELECT * FROM favour WHERE n_id=${formdata.n_id} AND u_id=${formdata.u_id} AND status=1`);
    if (result.length == 0) {
      const results = await this.app.mysql.insert('favour', {
        n_id: formdata.n_id,
        u_id: formdata.u_id
      });
      return {
        code: 1,
        msg: '点赞成功'
      }
    } else {
      const row = {
        status: 0,
        deltimes: this.app.mysql.literals.now, // `now()` on db server
      };

      const options = {
        where: {
          n_id: formdata.n_id,
          u_id: formdata.u_id,
        }
      };
      const result = await this.app.mysql.update('favour', row, options); // 更新 posts 表中的记录
      return {
        code: 0,
        msg: '你取消了点赞'
      }
    }
  }
  async comment(formdata) {
    if (formdata.c_id) {
      const result1 = await this.app.mysql.insert('comment', {
        n_id: formdata.n_id,
        u_id: formdata.u_id,
        comments: formdata.comments,
        c1_id: formdata.c_id
      })
      return {
        code: 1,
        msg: "评论成功"
      }
    } else {
      const result = await this.app.mysql.insert('comment', {
        n_id: formdata.n_id,
        u_id: formdata.u_id,
        comments: formdata.comments
      });
      return {
        code: 1,
        msg: "评论成功"
      }
    }

  }
}



module.exports = NodeService;