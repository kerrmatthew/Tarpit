// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


//load typekit fonts
try{Typekit.load();}catch(e){};



var dl_list = { 
  toggle_and_bring_to_front : function(parent_associate){
    $('#dl-list-' + parent_associate + '').toggle('blind', '', 'fast') ;
    
    $(':has(#dl-list-' + parent_associate + ')').filter(".download_history").css({
      'z-index': function(index, value){
        return parseFloat(value) + 50;
      }
    });
  }
 }