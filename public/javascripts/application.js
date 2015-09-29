$(function() {

  document.getElementById("uploadButton").onchange = function () {
      document.getElementById("uploadFile").value = this.files[0].name;
  };

});
