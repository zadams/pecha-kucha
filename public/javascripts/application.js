$(document).ready(function(){
    if($('.flash_info')){
      $('.flash_info').animate({opacity: 1.0},2000,function(){ 
        $('.flash_info').hide('blind','',1000);
      }); 
    }
});
