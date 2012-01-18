$(function () {
  
  if (! jQuery.browser.mozilla){

    $('#fileupload').fileupload({
      maxChunkSize: 10000000, // 10 MB  
        dropZone: $('#fileupload'),
        maxNumberOfFiles: 1,
        multipart: true,
        autoUpload: true,
        maxFileSize: 610000000 //610 MB
      
    });
  } else {
    
    $('#fileupload').fileupload({
          dropZone: $('#fileupload'),
          maxNumberOfFiles: 1,
          multipart: true,
          autoUpload: true,
          maxFileSize: 120000000 //120 MB
     
    });
  };
  $('.upload').bind('fileuploaddone', function (e, data) { 
    $.each(data.files, function (index, file) {
      //re = RegExp(/collections\/(\d)/);
      //fossil_id = e.currentTarget.action.match(re);
      window.location = "/collections?ref=fossil_create"/* &fossil_id="  + fossil_id[1] */ ; 
    });  
  }); 
});
