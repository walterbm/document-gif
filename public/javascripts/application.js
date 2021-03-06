document.addEventListener("DOMContentLoaded", function(event) { 

  var form = document.getElementById("fileForm");
  var uploadButton = document.getElementById("uploadButton");
  var uploadFileField = document.getElementById("uploadFile");
  var submitButton = document.getElementById("convertButton");
  var fileSelect = document.getElementById("uploadButton");
  var cog = document.getElementById("settingsCog");
  var loader = document.getElementById("loader");

  uploadButton.onchange = function(){
    uploadFileField.value = this.files[0].name;
    submitRequest();
  };
  cog.onclick = showSettings;

  function submitRequest() {
    uploadButton.previousElementSibling.innerHTML = "Converting...";
    loader.style.display = "block";

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
        var response = JSON.parse(xhr.response);
        subscribeServerSentEvent(response.file_name,response.html);
      }
      else {
        serverFailure();
      }
    };
    xhr.send(formData);
  }

  function subscribeServerSentEvent(channel,imageHTMLResponse){
    var es = new EventSource('/stream/'+channel);
    es.onmessage = function(e) { 
      if (e.data === "true"){
        appendImageToPage(imageHTMLResponse);
        es.close();
      }
      else {
        serverFailure();
        es.close();
      }
    };
  }

  function appendImageToPage(imageHTMLResponse){
    uploadButton.previousElementSibling.innerHTML = "<img class='icon' src='/images/download.gif'>Convert";
    document.getElementById("convertedImage").innerHTML = imageHTMLResponse;
    loader.style.display = "none";
  }

  function getRadioValue(){
    var radios = document.getElementsByName("size");
    for (var i = 0, length = radios.length; i < length; i++) {
      if (radios[i].checked) {
        return radios[i].value;
      }
    }
  }

  function serverFailure(){
    alert('Sorry, the conversion failed!');
    loader.style.display = "none";
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