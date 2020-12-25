'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const {
    router,
    controller
  } = app;
  // 单文件上传
  router.post('/upload', controller.upload.index)
  // 多文件上传
  router.post('/uploads', controller.upload.indexs)
  // 获取所有标签
  router.get('/getalltag', controller.node.index)
  // 上传笔记
  router.post('/publishnode', controller.node.addnode)
  // 用户登录
  router.post('/userlogin', controller.userlogin.login)
  // 注册
  router.post('/userreg', controller.userreg.reg)
  //我的笔记获取接口
  router.get('/getallnode', controller.user.index)
  // 获取瀑布流中的所有笔记
  router.get('/getothernode', controller.node.getallnode)

  //我的笔记删除接口
  router.post('/delnode', controller.user.indexs)

  //获取用户头像及信息
  router.get('/getheader', controller.user.getheader)
  router.get('/getuserinfo', controller.user.getuserinfo)
  // 过去当前笔记的有的标签
  router.get('/getnodetag', controller.node.getnodetag)

  //修改用户信息接口
  router.post('/updatauser', controller.user.updatauser)
  //管理员登录
  router.post('/alogin', controller.admin.index)
  // 获取笔记的信息
  router.get('/getnodeinfo', controller.node.nodeinfo)
  //删除用户信息
  router.post('/deluser', controller.admin.deluser)
  //恢复用户
  router.post('/revuser', controller.admin.revuser)
  //获取用户信息
  router.get('/getuser', controller.admin.user)

  // 获取作者的信息
  //获取新闻信息
  router.get('/getnews', controller.admin.getnews)
  //删除新闻信息
  router.post('/delnews', controller.admin.delnews)
  router.get('/getauthorinfo', controller.user.userinfo)
  // 获取用户的其他笔记
  //新增新闻
  router.post('/addnews', controller.admin.addnews)
  router.get('/getuserothernode', controller.user.userothernode)
  // 获取评论
  router.get('/getcomment', controller.user.getcomment)
  // 点赞
  router.post('/like', controller.user.likes)

  // 评论
  router.post('/comment', controller.user.comment)

  //获取责任信息
  router.get('/getsociety', controller.admin.getsociety)

  //删除责任信息
  router.post('/delsociety', controller.admin.delsociety)

  //恢复责任
  router.post('/revsociety', controller.admin.revsociety)

  //新增责任
  router.post('/addsociety', controller.admin.addsociety)

  //修改责任
  router.post('/updatesociety', controller.admin.updatesociety)
  //恢复新闻
  router.post('/revnews', controller.admin.revnews)

  //修改新闻
  router.post('/updatepress', controller.admin.updatepress)

  //获取标签信息
  router.get('/gettag', controller.admin.gettag)

  //删除标签信息
  router.post('/deltag', controller.admin.deltag)

  //恢复标签
  router.post('/revtag', controller.admin.revtag)

  //新增标签
  router.post('/addtag', controller.admin.addtag)


  // 获取热门报道
  router.get('/gethotnews',controller.admin.gethotnews)
  router.get('/getdynamic',controller.admin.getdynamic)
  router.get('/gethonor',controller.admin.gethonor)
};