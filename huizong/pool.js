const mysql=require("mysql");
var pool=mysql.createPool({
	host:"127.0.0.1",
	password:'',
	user:'root',
	database:'team',
	connectionLimit:10
});
module.exports=pool;