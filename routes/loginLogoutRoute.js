const express = require('express');
const router = express.Router();

const { 
    startPage,
    loginData,
    logout, 
    loginPage,
} = require('../controller/LoginSignupController.js');


router.route('/').get(startPage);
router.route('/login').post(loginData).get(loginPage);                                                               //get logindata(email,password)
// router.route('/login').get(login);                                                               //get logindata(email,password)
router.route('/logout').get(logout);                                                                  //get logindata(email,password)

module.exports = router;