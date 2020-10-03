window.addEventListener("load", function (){
    var tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate()+1); 
    var yyyy = tomorrow.getFullYear();
    var mm = ("0"+(tomorrow.getMonth()+1)).slice(-2);
    var dd = ("0"+tomorrow.getDate()).slice(-2);
    document.getElementById("deadline").value=yyyy+'-'+mm+'-'+dd;
})