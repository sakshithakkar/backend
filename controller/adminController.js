const connection = require('../config/db.js');



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


// @desc      Admin dashboard
// @route     POST /admin/dashboard
// @access    private

const adminDashboard = async(req,res)=>{
    res.send('Admin Dashboard');
}


//@desc     get admin
//@route    GET  /admin/myaccount
//@access   Private
const getAdmin = async (req,res) =>{
    let aId = req.params.id
    console.log(aId)
    let q1 = "SELECT * FROM tbladmin WHERE adminId = "+aId+" ";
    connection.query(q1,(err,result)=>{
        if(!err){
            res.send(result);
        }
        else {
            throw new Error(err);
        }
    })
}

//@desc     update Admin
//@route    POST  /admin/myaccount
//@access   Private
const updateAdminDetails = async (req,res) =>{

    let aName = req.body.adminName;
    let aFullName = req.body.adminFullName;
    let aAddress = req.body.adminAddress;
    let aPhoneNo = req.body.adminPhoneNo;
    let aEmail = req.body.adminEmail;
    let aPassword = req.body.adminPassword;
    let aId = req.params.id;

    let q1 = "UPDATE tbladmin SET adminName = '"+aName+"',adminFullName = '"+aFullName+"',adminAddress = '"+aAddress+"',adminPhoneNo = '"+aPhoneNo+"',adminEmail = '"+aEmail+"',adminPassword = '"+aPassword+"' WHERE adminId ="+aId+"";
    connection.query(q1,(err,result)=>{
        if(!err){
            res.send(result);
        }
        else {
            throw new Error(err);
        }
    })
}


module.exports = {
    getAdmin,
    updateAdminDetails,
    adminDashboard,
    registrationOfAdmin
}