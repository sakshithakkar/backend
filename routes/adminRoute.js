const express = require('express');
const router = express.Router();

const {
    getAllServices,
    getServiceById,
    addService,
    updateServiceById,
    deleteServiceById,
} = require('../controller/adminServiceController.js');

const {
    getAllCustomers,
    getCustomerById,
    customerById,
    updateCustomerById,
    deleteCustomerById,
    addCustomer
} = require ('../controller/adminCustomerController.js');

const {
    getAdmin,
    updateAdminDetails
} = require('../controller/adminController.js');

const { 
    loginData,
     logout, 
     login
} = require('../controller/LoginSignupController.js');



router.route('/admin/manageservices/allservices').get(getAllServices);                                 //get all services
router.route('/admin/manageservices/servicebyid/:id').get(getServiceById);                             //get service by id
router.route('/admin/manageservices/addservice').post(addService);                                     //add service
router.route('/admin/manageservices/updateservice/:id').post(updateServiceById);                       //update service
router.route('/admin/manageservices/deleteservicebyid/:id').delete(deleteServiceById);                 //delete service by id



router.route('/admin/managecustomers/addcustomer').post(addCustomer);                                     //add customer
router.route('/admin/managecustomers/allcustomers').get(getAllCustomers);                                //get all customer
router.route('/admin/managecustomers/customer/:id').get(getCustomerById);                                //get customer by id
router.route('/admin/managecustomers/customerdetails').post(customerById);                               //post customer by id
router.route('/admin/managecustomers/updatecustomer/:id').post(updateCustomerById);                       //update customer
router.route('/admin/managecustomers/deletecustomerbyid/:id').delete(deleteCustomerById);                 //delete customer by id


router.route('/admin/myaccountdetails/:id').get(getAdmin);                                                // get admin details
router.route('/admin/updatemyaccount/:id').post(updateAdminDetails);                                      // update admin details


router.route('/login').post(loginData);                                                               //get logindata(email,password)
router.route('/login').get(login);                                                               //get logindata(email,password)
router.route('/logout').get(logout);                                                               //get logindata(email,password)

module.exports = router;