$(document).ready(function(){
   


  $("#start-wizard").click(function(e){
    e.preventDefault();
    $(document.body).fadeOut(function(){
      window.location='guide.html';
    });
  });
  $("#end-wizard").click(function(e){
    e.preventDefault();
    $(document.body).fadeOut(function(){
      window.location='index.html';
    });
  });




  
   
  

});