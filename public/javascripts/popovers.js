$( function() {// manage all of the events that hide / show the popovers
  
  $(".cuj-selector").mouseenter( function() {
    $(this).children(".cuj-collapse").show('blind', '', 'fast').addClass("shown").removeClass("hidden");
  });
  
  $(".cuj-selector").mouseleave( function(){
    $(this).children(".cuj-collapse").hide('blind', '', 'fast').addClass("hidden").removeClass("shown");
  });  
});

$(function(){ // submits any forms in the popover on change
  $(".cuj-collapse form").find("input").change(function(){
    $(this).parents("form").submit();
  });
});
