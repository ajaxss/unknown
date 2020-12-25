/* eslint valid-jsdoc: "off" */

'use strict';

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1601265109689_546';

  // add your middleware config here
  config.middleware = [];

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };
  config.security = {
    csrf: {
      enable: false,
      ignoreJSON: true,
    }
  }
  // config.cors = {
  //   // origin: ['http://localhost'],
  //   origin: function (ctx) { //设置允许来自指定域名请求
  //     const whiteList = ['http://192.168.2.43', 'http://192.168.5.125', 'http://192.168.5.151', 'http://192.168.5.124', 'http://localhost', 'http://192.168.7.185'];
  //     let url = ctx.request.header.origin;
  //     if (whiteList.includes(url)) {
  //       return url;
  //     }
  //     return 'http://localhost' //默认允许本地请求3000端口可跨域
  //   },
  //   allowMethods: 'GET,HEAD,PUT,POST,DELETE,PATCH',
  //   credentials: true,
  // };
  config.cors = {
    // origin: 'http://192.168.5.120',
    // origin: 'http://localhost:8080',
    origin: '*',
    // origin: ctx => ctx.get('origin'),
    allowMethods: 'GET,HEAD,PUT,POST,DELETE,PATCH,OPTIONS',
    credentials: true
};

  config.session = {
    key: 'EGG_SESS',  //eggjs默认session的key
    maxAge: 24 * 3600 * 1000,  // 1 day
    httpOnly: true,
    encrypt: true,
    renew: true  //每次访问页面都会给session会话延长时间
  };

  config.cluster = {
    listen: {
      path: '',
      port: 88,
      hostname: 'localhost',//默认localhost和ip地址,上线时用0.0.0.0
    }
  };

  config.multipart = {
    mode: 'file',
    fileSize:1048576000,
  }

  exports.mysql = {
    // 单数据库信息配置
    client: {
      // host
      host: 'localhost',
      // 端口号
      port: '3306',
      // 用户名
      user: 'root',
      // 密码
      password: 'root',
      // 数据库名
      database: 'yebook',
    },
    // 是否加载到 app 上，默认开启
    app: true,
    // 是否加载到 agent 上，默认关闭
    agent: false,
  };

  return {
    ...config,
    ...userConfig,
  };
};
