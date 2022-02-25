const express = require('express');
const router = express.Router();


const {
    registrationOfUser
} = require('../controller/userController.js');

const {
    registerPage
} = require('../controller/LoginSignupController.js');

router.route('/register').post(registrationOfUser).get(registerPage);


module.exports = router;