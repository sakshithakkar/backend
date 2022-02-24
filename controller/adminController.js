const connection = require('../config/db.js');


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
    updateAdminDetails
}