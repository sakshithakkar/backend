const connection = require('../config/db.js');
const generateToken = require('../utils/generateToken.js');



//@desc     register user
//@route    POST  /user/register
//@access   Private
const registrationOfUser = async (req,res) =>{
    let name = req.body.name;
    let fullname = req.body.fullname;
    let address = req.body.address;
    let phone = req.body.phone;
    let email = req.body.email;
    let password = req.body.password;
    let createdTime = new Date().toISOString().slice(0, 19).replace('T', ' ');;
    let role = 'user';

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

//@desc     user homepage (service calculator page)
//@route    GET  /user/homepage
//@access   Private
const getHomePage = async(res,req)=>{
    res.send('Homepage');
}

//@desc     user homepage (service calculator page)
//@route    POST  /user/homepage
//@access   Private
const serviceCalculator = async(res,req)=>{
    let vin = req.body.vin;
    let milage = req.body.milage;


}


module.exports ={
    registrationOfUser,
    getHomePage,
    serviceCalculator

}