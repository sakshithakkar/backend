// const path = require('path') ;
const express = require( 'express');
const dotenv = require('dotenv') ;
const morgan  = require('morgan') ;
// const multer = require('multer') ;

// const connection = require('../backend/config/db.js');
const userRoute = require('./routes/userRouter.js')

dotenv.config()


const PORT = process.env.PORT || 5000;
const app = express();


if (process.env.NODE_ENV === 'development') {
    app.use(morgan('dev'))
}

app.use(express.json());
app.use('/',userRoute)

app.listen(
    PORT,
    console.log(
        `Server running in ${process.env.NODE_ENV} mode on port ${PORT}`
    )
)