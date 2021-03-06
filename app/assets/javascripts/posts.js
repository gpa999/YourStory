$(function() {
  var deleteFile, ready, sendFile;
  sendFile = function(that, file) {
    var data;
    data = new FormData;
    data.append('image[image]', file);
    return $.ajax({
      data: data,
      type: 'POST',
      url: '/images',
      cache: false,
      contentType: false,
      processData: false,
      success: function(data) {
        var img;
        img = document.createElement('IMG');
        img.src = data.url;
        img.setAttribute('id', data.image_id);
        return $(that).summernote('insertNode', img);
      }
    });
  };
  deleteFile = function(file_id) {
    return $.ajax({
      type: 'DELETE',
      url: "/images/" + file_id,
      cache: false,
      contentType: false,
      processData: false
    });
  };
  ready = function() {
    return $('[data-provider="summernote"]').each(function() {
      return $(this).summernote({
        height: 350,
        width: 700,
        callbacks: {
          onImageUpload: function(files) {
            var img;
            return img = sendFile(this, files[0]);
          },
          onMediaDelete: function(target, editor, editable) {
            var image_id;
            image_id = target[0].id;
            if (!!image_id) {
              deleteFile(image_id);
            }
            return target.remove();
          }
        }
      });
    });
  };
  $(document).ready(ready);
  return $(document).on('page:load', ready);
});
