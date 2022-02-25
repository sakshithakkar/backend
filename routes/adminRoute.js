const express = require('express');
const router = express.Router();

const {
    getAllServices,
    getServiceById,
    addService,
    updateServiceById,
    deleteServiceById,
    addServicePage,
    updateServicePageById,
} = require('../controller/adminServiceController.js');

const {
    getAllCustomers,
    getCustomerById,
    customerById,
    updateCustomerById,
    deleteCustomerById,
    addCustomer,
    updateCustomerPageById
} = require ('../controller/adminCustomerController.js');

const {
    getAdmin,
    updateAdminDetails,
    adminDashboard
} = require('../controller/adminController.js');

const { 
    loginData,
     logout, 
     login,
     registrationOfAdmin,
     loginPage,
     registerPage
} = require('../controller/LoginSignupController.js');



router.route('/admin/manageservices/allservices').get(getAllServices);                                 //get all services
router.route('/admin/manageservices/servicebyid/:id').get(getServiceById);                             //get service by id
router.route('/admin/manageservices/addservice').post(addService).get(addServicePage);                                     //add service
router.route('/admin/manageservices/updateservice/:id').post(updateServiceById).get(updateServicePageById);                       //update service
router.route('/admin/manageservices/deleteservicebyid/:id').delete(deleteServiceById);                 //delete service by id



router.route('/admin/managecustomers/addcustomer').post(addCustomer);                                     //add customer
router.route('/admin/managecustomers/allcustomers').get(getAllCustomers);                                //get all customer
router.route('/admin/managecustomers/customer/:id').get(getCustomerById);                                //get customer by id
router.route('/admin/managecustomers/customerdetails').post(customerById);                               //post customer by id
router.route('/admin/managecustomers/updatecustomer/:id').post(updateCustomerById).get(updateCustomerPageById);                       //update customer
router.route('/admin/managecustomers/deletecustomerbyid/:id').delete(deleteCustomerById);                 //delete customer by id


router.route('admin/dashboard').get(adminDashboard);
router.route('/admin/myaccountdetails/:id').get(getAdmin);                                                // get admin details
router.route('/admin/updatemyaccount/:id').post(updateAdminDetails);                                      // update admin details


router.route('/login').post(loginData).get(loginPage);                                                               //get logindata(email,password)
// router.route('/login').get(login);                                                               //get logindata(email,password)
router.route('/logout').get(logout);                                                               //get logindata(email,password)
router.route('/admin/register').post(registrationOfAdmin).get(registerPage);                                                               //get logindata(email,password)

module.exports = router;