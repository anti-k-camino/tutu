$(document).ready(function(){
  $("#carriage_type" ).change(function(e) {
    e.preventDefault();
    alert($("select option:selected").val());
    var id = $("select option:selected").val();
   
    $('.schmidt').hide();
    
    $('.schmidt.' + id).show();   
  });  
});