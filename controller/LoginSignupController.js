const connection = require('../config/db.js');
const generateToken = require('../utils/generateToken.js');

// @desc      get login data from login page
// @route     POST /login
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

// @desc      get login data from login page
// @route     GET /login
// @access    public

const loginPage = async (req,res) =>{
    res.send('login page')
}


// @desc      get registration data from register page
// @route     GET /login
// @access    public

const registerPage = async (req,res) =>{
    res.send('register page')
}

// @desc      Admin registration
// @route     POST /admin/register
// @access    public

const registrationOfAdmin = async (req,res) =>{
    let name = req.body.name;
    let fullname = req.body.fullname;
    let address = req.body.address;
    let phone = req.body.phone;
    let email = req.body.email;
    let password = req.body.password;
    let createdTime = new Date().toISOString().slice(0, 19).replace('T', ' ');;
    let role = 'admin';

    let q1 = "INSERT INTO tblusers (userName ,userFullName ,userAddress ,userPhoneNo ,userEmail ,userPassword, Role,userCreated) VALUES ('"+name+"','"+fullname+"','"+address+"' ,'"+phone+"','"+email+"','"+password+"','"+role+"','"+createdTime+"' )";
    connection.query(q1,(err,result)=>{
        if(!err){
            let gToken = generateToken(email);
            res.cookie('jwt_Token',gToken,{httpOnly:true})
            res.send(result);
            console.log('register successfully');  
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
    login,
    loginPage,
    registerPage,
    registrationOfAdmin
}