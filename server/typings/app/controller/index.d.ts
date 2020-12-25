// This file is created by egg-ts-helper@1.25.8
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportAdmin = require('../../../app/controller/admin');
import ExportNode = require('../../../app/controller/node');
import ExportUpload = require('../../../app/controller/upload');
import ExportUser = require('../../../app/controller/user');
import ExportUserlogin = require('../../../app/controller/userlogin');
import ExportUserreg = require('../../../app/controller/userreg');

declare module 'egg' {
  interface IController {
    admin: ExportAdmin;
    node: ExportNode;
    upload: ExportUpload;
    user: ExportUser;
    userlogin: ExportUserlogin;
    userreg: ExportUserreg;
  }
}
