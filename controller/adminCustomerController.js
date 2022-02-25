const connection = require('../config/db.js');

//@desc     get all customers
//@route    GET  /admin/managecustomers/allcustomers
//@access   Private
const getAllCustomers = async (req,res) =>{
    let q1 = "SELECT * FROM tblcustomer"
    connection.query(q1,(err,result)=>{
        if(!err){
            res.send(result);
        }
        else {
            throw new Error(err);
        }
    })
}

//@desc     get customer by id
//@route    GET  /admin/managecustomers/customer/:id
//@access   Private
const getCustomerById = async (req,res) =>{
    let cId = req.params.id
    let q1 = "SELECT * FROM tblcustomer WHERE custId = "+cId+" ";
    connection.query(q1,(err,result)=>{
        if(!err){
            res.send(result);
        }
        else {
            throw new Error(err);
        }
    })
}

//@desc     get customer by id
//@route    POST  /admin/managecustomers/customerbyid
//@access   Private
const customerById = async (req,res) =>{
    let cId = req.body.id
    let q1 = "SELECT * FROM tblcustomer WHERE custId = "+cId+" ";
    connection.query(q1,(err,result)=>{
        if(!err){
            res.send(result);
        }
        else {
            throw new Error(err);
        }
    })
}

//@desc     update Customer
//@route    POST  /admin/managecustomers/updatecustomer/:id
//@access   Private
const updateCustomerById = async (req,res) =>{

    let cName = req.body.custName;
    let cFullName = req.body.custFullName;
    let cAddress = req.body.custAddress;
    let cPhoneNo = req.body.custPhoneNo;
    let cEmail = req.body.custEmail;
    let cPassword = req.body.custPassword;
    let cId = req.params.id;

    let q1 = "UPDATE tblcustomer SET custName = '"+cName+"',custFullName = '"+cFullName+"',custAddress = '"+cAddress+"',custPhoneNo = '"+cPhoneNo+"',custEmail = '"+cEmail+"',custPassword = '"+cPassword+"' WHERE custId ="+cId+"";
    connection.query(q1,(err,result)=>{
        if(!err){
            res.send(result);
        }
        else {
            throw new Error(err);
        }
    })
}

//@desc     update Customer
//@route    POST  /admin/managecustomers/updatecustomer/:id
//@access   Private
const updateCustomerById = async (req,res) =>{

    let cName = req.body.custName;
    let cFullName = req.body.custFullName;
    let cAddress = req.body.custAddress;
    let cPhoneNo = req.body.custPhoneNo;
    let cEmail = req.body.custEmail;
    let cPassword = req.body.custPassword;
    let cId = req.params.id;

    let q1 = "UPDATE tblcustomer SET custName = '"+cName+"',custFullName = '"+cFullName+"',custAddress = '"+cAddress+"',custPhoneNo = '"+cPhoneNo+"',custEmail = '"+cEmail+"',custPassword = '"+cPassword+"' WHERE custId ="+cId+"";
    connection.query(q1,(err,result)=>{
        if(!err){
            res.send(result);
        }
        else {
            throw new Error(err);
        }
    })
}

//@desc     update Customer page
//@route    GET  /admin/managecustomers/updatecustomer/:id
//@access   Private
const updateCustomerPageById = async (req,res) =>{
    res.send('Update customer page');
}

//@desc     delete Service by id
//@route    DELETE  /admin/deleteservice/:id
//@access   Private
const deleteCustomerById = async (req,res) =>{

    let cId = req.params.id;

    let q1 = " DELETE FROM tblcustomer WHERE custId = "+cId+" ";
    connection.query(q1,(err,result)=>{
        if(!err){
            console.log('Customer deleted !');
            res.send(result);
        }
        else {
            throw new Error(err);
        }
    })
}

//@desc     Add customer
//@route    POST  /admin/managecustomers/addcustomer
//@access   Private
const addCustomer = async (req,res) =>{

    let cName = req.body.custName;
    let cFullName = req.body.custFullName;
    let cAddress = req.body.custAddress;
    let cPhoneNo = req.body.custPhoneNo;
    let cEmail = req.body.custEmail;
    let cPassword = req.body.custPassword;
    // let cId = req.params.id;

    let q1 = "INSERT INTO tblcustomer (custName ,custFullName ,custAddress ,custPhoneNo ,custEmail ,custPassword) VALUES ('"+cName+"','"+cFullName+"','"+cAddress+"' ,'"+cPhoneNo+"','"+cEmail+"','"+cPassword+"' )"
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
    getAllCustomers,
    getCustomerById,
    customerById,
    updateCustomerById,
    updateCustomerPageById,
    deleteCustomerById,
    addCustomer,
}