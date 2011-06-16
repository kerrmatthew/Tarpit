$(function () {
  $('#fileupload').fileupload({
        dropZone: $(),
        maxNumberOfFiles: 1,
        maxChunkSize: 1000000, // 10 MB
        multipart: true,
        autoUpload: true
        
/*
        uploadTemplate: function () {
            return $('<tr><td><\/td>' +
                    '<td class="file_upload_progress"><div><\/div><\/td>' +
                    '<td class="file_upload_cancel">' +
                    '<button class="ui-state-default ui-corner-all" title="Cancel">' +
                    '<span class="ui-icon ui-icon-cancel">Cancel<\/span>' +
                    '<\/button><\/td><\/tr>');
        },
        downloadTemplate: function () {
            return $('<tr><td><img alt="Photo" width="80" height="80" src="<\/td><\/tr>');
        },

        done: function () {
          $("#file_upload_container").hide();
        }
        
        
        */
  });
/*   $('.upload').bind('fileuploaddone', function (e, data) {} )  */
});
