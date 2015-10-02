document.addEventListener("DOMContentLoaded", function(event) { 

  var form = document.getElementById("fileForm");
  var uploadButton = document.getElementById("uploadButton");
  var uploadFileField = document.getElementById("uploadFile");
  var submitButton = document.getElementById("convertButton");
  var fileSelect = document.getElementById("uploadButton");
  var cog = document.getElementById("settingsCog");

  uploadButton.onchange = function(){
    uploadFileField.value = this.files[0].name;
    submitRequest();
  };
  cog.onclick = showSettings;

  function submitRequest() {
    uploadButton.previousElementSibling.innerHTML = "Converting...";
    var file = fileSelect.files[0];
    var size = getRadioValue();
    var interval = document.getElementById("intervalField").value;

    var formData = new FormData();
    formData.append("document", file, file.name);
    formData.append("size",size);
    formData.append("interval",interval);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/', true);

    xhr.onload = function () {
      if (xhr.status === 200) {
        appendImageToPage(xhr.response);
      }
      else {
        alert('An error occurred!');
      }
    };
    xhr.send(formData);
  }

  function appendImageToPage(imageHTMLResponse){
    uploadButton.previousElementSibling.innerHTML = "<img class='icon' src='/images/download.gif'>Convert";
    document.getElementById("convertedImage").innerHTML = imageHTMLResponse;
  }

  function getRadioValue(){
    var radios = document.getElementsByName("size");
    for (var i = 0, length = radios.length; i < length; i++) {
      if (radios[i].checked) {
        return radios[i].value;
      }
    }
  }

  function showSettings(){
    var settings = document.getElementById("settingWrapper");
    cog.classList.toggle("rotateCog");
    if (settings.style.display === "block"){
      settings.style.display = "none";
    }
    else{
      settings.style.display = "block";
      settings.className = "animated flipInX";
    }
  }

});