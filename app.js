var express     =   require('express');
var app         =   express();

app.use(express.static(__dirname+"/public"));
app.get("/",function (req, res) {
    res.sendFile(__dirname+"/views/home.html");
});

app.get("/products",function (req, res) {
   res.sendFile(__dirname+"/views/index.html");
});

app.get("/tokens/add",function (req, res) {
   res.sendFile(__dirname+"/views/tokens.html")
});










app.listen(3000,function () {
   console.log("Server started in port 3000 !")
});