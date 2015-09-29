document.addEventListener("DOMContentLoaded", function(event) { 

  var form = document.getElementById("fileForm");
  var uploadButton = document.getElementById("uploadButton");
  var uploadFileField = document.getElementById("uploadFile");
  var submitButton = document.getElementById("convertButton");
  var fileSelect = document.getElementById("uploadButton");

  uploadButton.onchange = function(){
    uploadFileField.value = this.files[0].name;
  };

  form.onsubmit = function(event) {
    event.preventDefault();

    submitButton.innerHTML = "Converting...";
    var file = fileSelect.files[0];
    var formData = new FormData();

    formData.append("document", file, file.name);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/', true);

    xhr.onload = function () {
      if (xhr.status === 200) {
        submitButton.innerHTML = 'Convert';
        document.getElementById("convertedImage").innerHTML = xhr.response;
      }
      else {
        alert('An error occurred!');
      }
    };

    xhr.send(formData);

  };


});
