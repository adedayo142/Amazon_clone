//Import from packages
const express = require('express');
const mongoose = require('mongoose');
require('dotenv').config();


//Import from other files
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/product');
const userRouter = require('./routes/user');
 //INIT
const app = express();
const PORT = 2000
const port = process.env.PORT;
const DB = "mongodb+srv://adedayo142:onipede@cluster0.qqwe8q5.mongodb.net/?retryWrites=true&w=majority"
//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

app.get("/user", (req, res) => {
	res.json({ name:"samson"})
})

//Connections
mongoose.connect(`${process.env.MONGODB_URI}`).then(() => {
	console.log("Connection successful");
}).catch((e) => {
	console.log(e+" not connected");
});

app.listen(port,  () => {
	console.log(`connected at port ${port}`);
})