/*导航下拉菜单*/
var tabs = document.querySelectorAll("[data-toggle=tab]");
for(var tab of tabs){
    //console.log(tab);
    tab.onmouseover=function(e){
        e.preventDefault();
        var tab=this;
        var gg = document.querySelectorAll("#gg_zz>ul");
        for(var g of gg ){
          //console.log(g);
            g.style.zIndex="";
        }
        var id = tab.getAttribute("data-target");
        //console.log(id);
        document.querySelector(id).style.zIndex=10;
    }
}


/*楼层2--2*/
document.getElementById("cok2").style.display="none";
document.getElementById("cok3").style.display="none";
document.getElementById("cok4").style.display="none";
var gz = document.querySelectorAll("[data-toggle=rm]");
for(var g of gz){
    //console.log(g);
    g.onmouseover=function(e){
        e.preventDefault();
        var g=this;
        var gls = document.querySelectorAll("#gou>div~div");
        //console.log(gls);
        for(var gl of gls){
        // console.log(gl);
            gl.style.display="none";
        }
        var id=g.getAttribute("data-target");
        document.querySelector(id).style.display="block";
    }
}

/*楼层3-2*/
document.getElementById("cor1").style.display="none";
document.getElementById("cor3").style.display="none";
document.getElementById("cor4").style.display="none";
var gz = document.querySelectorAll("[data-toggle=rmr]");
for(var g of gz){
    //console.log(g);
    g.onmouseover=function(e){
        e.preventDefault();
        var g=this;
        var gls = document.querySelectorAll("#gougou>div~div");
        //console.log(gls);
        for(var gl of gls){
        // console.log(gl);
            gl.style.display="none";
        }
        var id=g.getAttribute("data-target");
        document.querySelector(id).style.display="block";
    }
}
/*楼层4-2*/
document.getElementById("coq1").style.display="none";
document.getElementById("coq2").style.display="none";
document.getElementById("coq4").style.display="none";
var gz = document.querySelectorAll("[data-toggle=rmq]");
for(var g of gz){
    //console.log(g);
    g.onmouseover=function(e){
        e.preventDefault();
        var g=this;
        var gls = document.querySelectorAll("#goudog>div~div");
        //console.log(gls);
        for(var gl of gls){
        // console.log(gl);
            gl.style.display="none";
        }
        var id=g.getAttribute("data-target");
        document.querySelector(id).style.display="block";
    }
}


/*楼层5-2*/
document.getElementById("cop1").style.display="none";
document.getElementById("cop2").style.display="none";
document.getElementById("cop3").style.display="none";
var gz = document.querySelectorAll("[data-toggle=rmb]");
for(var g of gz){
    //console.log(g);
    g.onmouseover=function(e){
        e.preventDefault();
        var g=this;
        var gls = document.querySelectorAll("#gouzi>div~div");
        //console.log(gls);
        for(var gl of gls){
        // console.log(gl);
            gl.style.display="none";
        }
        var id=g.getAttribute("data-target");
        document.querySelector(id).style.display="block";
    }
}