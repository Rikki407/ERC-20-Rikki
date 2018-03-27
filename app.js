var express     =   require('express');
var app         =   express();

app.use(express.static(__dirname+"/public"));
app.get("/",function (req, res) {
    res.render(__dirname+"/views/home.ejs");
});

app.get("/products",function (req, res) {
   res.render(__dirname+"/views/index.ejs");
});

app.get("/tokens",function (req, res) {
   res.render(__dirname+"/views/tokens.ejs")
});


app.listen(8000,function () {
   console.log("Server started in port 8000 !")
});