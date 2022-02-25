const connection = require('../config/db.js');

//@desc     get all services
//@route    GET  /admin/allservices
//@access   Private
const getAllServices = async (req,res) =>{
    let q1 = "SELECT * FROM tblservice"
    connection.query(q1,(err,result)=>{
        if(!err){
            res.send(result);
        }
        else {
            throw new Error(err);
        }
    })
}

//@desc     get service by id
//@route    GET  /admin/service/:id
//@access   Private
const getServiceById = async (req,res) =>{
    let sId = req.params.id
    let q1 = "SELECT * FROM tblservice WHERE serId = "+sId+" ";
    connection.query(q1,(err,result)=>{
        if(!err){
            res.send(result);
        }
        else {
            throw new Error(err);
        }
    })
}

//@desc     Add Service
//@route    POST  /admin/addservice
//@access   Private
const addService = async (req,res) =>{

    let sName = req.body.serName;
    let sDiscription = req.body.serDiscription;

    let q1 = "INSERT INTO tblservice (serName,serDescription) VALUES ('"+sName+"','"+sDiscription+"')"
    connection.query(q1,(err,result)=>{
        if(!err){
            res.send(result);
        }
        else {
            throw new Error(err);
        }
    })
}

//@desc     add service
//@route    GET  /admin/addservice
//@access   Private
const addServicePage = async (req,res) =>{
    res.send('Add service page');
}

//@desc     update Service
//@route    POST  /admin/updateservice/:id
//@access   Private
const updateServiceById = async (req,res) =>{

    let sName = req.body.serName;
    let sDiscription = req.body.serDiscription;
    let sId = req.params.id;

    let q1 = "UPDATE tblservice SET serName = '"+sName+"',serDescription = '"+sDiscription+"' WHERE serId ="+sId+"";
    connection.query(q1,(err,result)=>{
        if(!err){
            res.send(result);
        }
        else {
            throw new Error(err);
        }
    })
}

//@desc     update Service
//@route    GET  /admin/updateservice/:id
//@access   Private
const updateServicePageById = async (req,res) =>{
    res.send('updatePage');
}


//@desc     delete Service by id
//@route    DELETE  /admin/deleteservice/:id
//@access   Private
const deleteServiceById = async (req,res) =>{

    let sId = req.params.id;

    let q1 = " DELETE FROM tblservice WHERE serId = "+sId+" ";
    connection.query(q1,(err,result)=>{
        if(!err){
            console.log('Service deleted !');
            res.send(result);
        }
        else {
            throw new Error(err);
        }
    })
}


module.exports = {
    getAllServices,
    getServiceById,
    addService,
    addServicePage,
    updateServiceById,
    updateServicePageById,
    deleteServiceById
}