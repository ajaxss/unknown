const Service = require('egg').Service;

class AdminService extends Service {
  //登录
  async login(data) {
    const results = await this.app.mysql.select('admin', { // 搜索 post 表
      where: {
        adminname: data.adminname,
        status: '1'
      }, // WHERE 条件
      columns: ['a_id', 'adminname', 'passwd'], // 要查询的表字段
    });
    if (results.length < 1) {
      return {
        code: 0,
        msg: "用户不存在"
      }
    } else {
      if (data.passwd == results[0].passwd) {
        return {
          results,
          code: 1,
          msg: "恭喜您，登陆成功"
        }
      } else {
        return {
          code: 0,
          msg: "密码错误"
        }
      }
    }
  }

  //用户信息
  async getuser() {
    const results = await this.app.mysql.select('user', { // 搜索 post 表
      columns: ['u_id', 'username', 'sexs', 'heads', 'birthday', 'tel', 'ip', 'status'], // 要查询的表字段
    });
    return results;
  }

  //删除用户
  async deluser(u_id) {
    const row = {
      status: 0,
      // modifiedAt: this.app.mysql.literals.now, // `now()` on db server
    };
    const options = {
      where: {
        u_id: u_id
      }
    };
    const results = await this.app.mysql.update('user', row, options);
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

  //恢复用户信息
  async revuser(u_id) {
    const row = {
      status: 1,
      // modifiedAt: this.app.mysql.literals.now, // `now()` on db server
    };
    const options = {
      where: {
        u_id: u_id
      }
    };
    const results = await this.app.mysql.update('user', row, options);
    let result = ''
    if (results.affectedRows) {
      result = {
        code: 1,
        msg: "用户恢复成功"
      }
    } else {
      result = {
        code: 0,
        msg: "用户恢复失败"
      }
    }
    return result;
  }

  //添加新闻
  async addnews(data) {
    const result1 = await this.app.mysql.select('press', { // 搜索 post 表
      where: {
        release: data.release
      } // 要查询的表字段
    })
    let result = ''
    if (result1.length > 0) {
      result = {
        code: 0,
        msg: "新闻已存在"
      }
    } else {
      const results = await this.app.mysql.insert('press', {
        a_id: data.a_id,
        release: data.release,
        publishing: data.publish,
        regional: data.regional,
        newscontent: data.content
      });
      if (results.affectedRows) {
        result = {
          code: 1,
          msg: "新闻新增成功"
        }
      } else {
        result = {
          code: 0,
          msg: "新闻新增失败"
        }
      }
    }
    return result;
  }

  //新闻信息
  async getnews() {
    const results = await this.app.mysql.select('press', { // 搜索 post 表
      columns: ['p_id', 'release', 'publishing', 'regional', 'newscontent', 'status', 'addtimes'], // 要查询的表字段
    });
    return results;
  }

  async gethotnews() {
    const results = await this.app.mysql.select('press', { // 搜索 post 表
      columns: ['p_id', 'release', 'publishing', 'regional', 'newscontent', 'status', 'addtimes'],
      where: {
        status: 1,
        regional:0
      }, // 要查询的表字段
    });
    return results;
  }

  async getdynamic() {
    const results = await this.app.mysql.select('press', { // 搜索 post 表
      columns: ['p_id', 'release', 'publishing', 'regional', 'newscontent', 'status', 'addtimes'],
      where: {
        status: 1,
        regional:1
      }, // 要查询的表字段
    });
    return results;
  }

  async gethonor() {
    const results = await this.app.mysql.select('press', { // 搜索 post 表
      columns: ['p_id', 'release', 'publishing', 'regional', 'newscontent', 'status', 'addtimes'],
      where: {
        status: 1,
        regional:2
      }, // 要查询的表字段
    });
    return results;
  }

  
  

  //删除新闻
  async delnews(p_id) {
    const row = {
      status: 0,
      // modifiedAt: this.app.mysql.literals.now, // `now()` on db server
    };
    const options = {
      where: {
        p_id: p_id
      }
    };
    const results = await this.app.mysql.update('press', row, options);
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

  //恢复新闻信息
  async revnews(p_id) {
    const row = {
      status: 1,
      // modifiedAt: this.app.mysql.literals.now, // `now()` on db server
    };
    const options = {
      where: {
        p_id: p_id
      }
    };
    const results = await this.app.mysql.update('press', row, options);
    let result = ''
    if (results.affectedRows) {
      result = {
        code: 1,
        msg: "新闻恢复成功"
      }
    } else {
      result = {
        code: 0,
        msg: "新闻恢复失败"
      }
    }
    return result;
  }


  //添加责任
  async addsociety(data) {
    const result1 = await this.app.mysql.select('society', { // 搜索 post 表
      where: {
        title: data.title
      } // 要查询的表字段
    })
    let result = ''
    if (result1.length > 0) {
      result = {
        code: 0,
        msg: "责任已存在"
      }
    } else {
      const results = await this.app.mysql.insert('society', {
        a_id: data.a_id,
        title: data.title,
        content: data.content,
        imgs: data.imgs
      });
      if (results.affectedRows) {
        result = {
          code: 1,
          msg: "责任新增成功"
        }
      } else {
        result = {
          code: 0,
          msg: "责任新增失败"
        }
      }
    }
    return result;
  }

  //责任信息
  async getsociety() {
    const results = await this.app.mysql.select('society', { // 搜索 post 表
      columns: ['s_id', 'title', 'content', 'imgs', 'status', 'addtimes'], // 要查询的表字段
    });
    return results;
  }

  //删除责任
  async delsociety(s_id) {
    const row = {
      status: 0,
      // modifiedAt: this.app.mysql.literals.now, // `now()` on db server
    };
    const options = {
      where: {
        s_id: s_id
      }
    };
    const results = await this.app.mysql.update('society', row, options);
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

  //恢复责任信息
  async revsociety(s_id) {
    const row = {
      status: 1,
      // modifiedAt: this.app.mysql.literals.now, // `now()` on db server
    };
    const options = {
      where: {
        s_id: s_id
      }
    };
    const results = await this.app.mysql.update('society', row, options);
    let result = ''
    if (results.affectedRows) {
      result = {
        code: 1,
        msg: "责任恢复成功"
      }
    } else {
      result = {
        code: 0,
        msg: "责任恢复失败"
      }
    }
    return result;
  }

  //修改责任
  async updatesociety(data) {
    const row = {
      title: data.title,
      content: data.content,
      imgs: data.imgs,
      // modifiedAt: this.app.mysql.literals.now, // `now()` on db server
    };
    const options = {
      where: {
        s_id: data.s_id
      }
    };
    const results = await this.app.mysql.update('society', row, options);
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


  //修改新闻
  async updatepress(data) {
    const row = {
      release: data.release,
      publishing: data.publishing,
      regional: data.regional,
      newscontent: data.newscontent
      // modifiedAt: this.app.mysql.literals.now, // `now()` on db server
    };
    const options = {
      where: {
        p_id: data.p_id
      }
    };
    const results = await this.app.mysql.update('press', row, options);
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


  //添加标签
  async addtag(data) {
    const result1 = await this.app.mysql.select('tag', { // 搜索 post 表
      where: {
        tagname: data.tagname
      } // 要查询的表字段
    })
    let result = ''
    if (result1.length > 0) {
      result = {
        code: 0,
        msg: "标签已存在"
      }
    } else {
      const results = await this.app.mysql.insert('tag', {
        a_id: data.a_id,
        tagname: data.tagname
      });
      if (results.affectedRows) {
        result = {
          code: 1,
          msg: "标签新增成功"
        }
      } else {
        result = {
          code: 0,
          msg: "标签新增失败"
        }
      }
    }
    return result;
  }

  //标签信息
  async gettag() {
    const results = await this.app.mysql.select('tag', { // 搜索 post 表
      columns: ['t_id', 'tagname', 'addtimes'], // 要查询的表字段
    });
    return results;
  }

  //删除标签
  async deltag(t_id) {
    const results = await this.app.mysql.delete('tag', {
      t_id: t_id,
    });
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



}
module.exports = AdminService;