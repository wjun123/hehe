const express=require('express');
const bodyParser=require("body-parser");

//const user=require('./routes/user.js');
const login=require('./routes/login.js');
//const details=require('./routes/details.js');

var app=express();
app.listen(3000,()=>{
	console.log('good');
});
app.use(bodyParser.urlencoded({
	extended:false
}));
app.use(express.static("./static"));
//配置路由
//app.use('/user',user);
app.use('/login',login);
//app.use('/details',details);