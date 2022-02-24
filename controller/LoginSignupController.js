const connection = require('../config/db.js');
const generateToken = require('../utils/generateToken.js');

// @desc      get login data from login page
// @route     /login
// @access    public

const loginData = async (req,res) =>{
    let email = req.body.email;
    let password = req.body.password;
    let q1 = "SELECT userPassword FROM tblusers WHERE userEmail = '"+email+"' ";
    connection.query(q1,(err,result)=>{
        if(!err){
            var databasePassword = result[0].userPassword;
            if( password === databasePassword)
            {
                let gToken = generateToken(email);
                res.cookie('jwt_Token',gToken,{httpOnly:true})
                res.send('login Successfully');
            }   
        }
        else {
            throw new Error(err);
        }
    })
}


// @desc      logout page
// @route     /logout
// @access    public

const login = async (req,res) =>{
    res.send('hello');
}


// @desc      logout page
// @route     /logout
// @access    public

const logout = async (req,res) =>{
    console.log(res.cookie('jwt_Token'));
    res.clearCookie('jwt_Token');
    console.log(res.cookie('jwt_Token'));    
    res.redirect('/login');
}

module.exports ={
    loginData,
    logout,
    login
}