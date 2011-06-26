// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(function(){ //hides and shows the downlaod counters on the main page
  $(".Collection-items .meta, .dl-counter-container").hide();
  
  $(".Collection-items").mouseenter(function() {
    $(this).children(".meta-spacer").hide().siblings(".meta, .dl-counter-container").fadeIn('fast') ;
    $(this).children(".main").addClass("hover");
  });
      

  $(".Collection-items").mouseleave(function() {
    $(this).children(".meta, div.dl-counter-container").hide().siblings(".meta-spacer").show();
    $(this).children(".main").removeClass("hover");
  });
})


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


