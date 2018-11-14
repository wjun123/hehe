$(function(){
    $(`<link rel="stylesheet" href="../css/header_index.css">`).appendTo("head");
    $.ajax({
        url:'header_index.html',
        type:"get",
        success:function(res){
            $(res).replaceAll("#header");
        }
    })
})
