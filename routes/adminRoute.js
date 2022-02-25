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
    registrationOfAdmin,
    adminDashboard,
    getAdmin,
    updateAdminDetails
} = require('../controller/adminController.js');

const { 
     registerPage
} = require('../controller/LoginSignupController.js');



router.route('/manageservices/allservices').get(getAllServices);                                 //get all services
router.route('/manageservices/servicebyid/:id').get(getServiceById);                             //get service by id
router.route('/manageservices/addservice').post(addService).get(addServicePage);                                     //add service
router.route('/manageservices/updateservice/:id').post(updateServiceById).get(updateServicePageById);                       //update service
router.route('/manageservices/deleteservicebyid/:id').delete(deleteServiceById);                 //delete service by id



router.route('/managecustomers/addcustomer').post(addCustomer);                                     //add customer
router.route('/managecustomers/allcustomers').get(getAllCustomers);                                //get all customer
router.route('/managecustomers/customer/:id').get(getCustomerById);                                //get customer by id
router.route('/managecustomers/customerdetails').post(customerById);                               //post customer by id
router.route('/managecustomers/updatecustomer/:id').post(updateCustomerById).get(updateCustomerPageById);                       //update customer
router.route('/managecustomers/deletecustomerbyid/:id').delete(deleteCustomerById);                 //delete customer by id


router.route('/dashboard').get(adminDashboard);
router.route('/myaccountdetails/:id').get(getAdmin);                                                // get admin details
router.route('/updatemyaccount/:id').post(updateAdminDetails);                                      // update admin details

                                                           
router.route('/register').post(registrationOfAdmin).get(registerPage);                                                               //get logindata(email,password)

module.exports = router;