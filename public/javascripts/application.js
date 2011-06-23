// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults








$( function() {
  
  $(".collection-items .meta, .dl-counter-container").hide();
  
  $(".collection-items").mouseenter(function() {
    $(this).children(".meta-spacer").hide().siblings(".meta, .dl-counter-container").fadeIn('fast') ;
    $(this).children(".main").addClass("hover");
  });
      

  $(".collection-items").mouseleave(function() {
    $(this).children(".meta, div.dl-counter-container").hide().siblings(".meta-spacer").show();
    $(this).children(".main").removeClass("hover");
  });
  
  
  $(".cuj-selector").mouseenter( function() {
    $(this).children(".cuj-collapse").show('blind', '', 'fast').addClass("shown").removeClass("hidden");
  });
  
  $(".cuj-selector").mouseleave( function(){
    $(this).children(".cuj-collapse").hide('blind', '', 'fast').addClass("hidden").removeClass("shown");
  });
  
  $(".cuj-collapse form").find("input").change(function(){
    $(this).parents("form").submit();
  })
  
});
  





var dl_list = { 
  toggle_and_bring_to_front : function(parent_associate){
    $('#dl-list-' + parent_associate + '').toggle('blind', '', 'fast') ;
    
    $(':has(#dl-list-' + parent_associate + ')').filter(".download_history").css({
      'z-index': function(index, value){
        return parseFloat(value) + 50;
      }
    });
  }
};






//load typekit fonts
try{Typekit.load();}catch(e){};


