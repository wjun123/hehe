$(function(){
    $(`<link rel="stylesheet" href="../css/header_other.css">`).appendTo("head");
    $.ajax({
        url:'header_other.html',
        type:"get",
        success:function(res){
            $(res).replaceAll("#header");
        }
    })
})
