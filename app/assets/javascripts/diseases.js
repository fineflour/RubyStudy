$(function(){
  $('#indications_select').change(function(){
    $.ajax({
      url: "/diseases/update_subindications",
    dataType:"script",
    type: "GET",
    data: {
      "indication_id": $("#indications_select option:selected").val()
    },
    success: function(data, textStatus, jqXHR){
      console.log ("Dynamic indication select works")
    }
    });
  });
});

$(document).ready(function() {
  AddRemoveSubindications();
});


function AddRemoveSubindications(){
  $('a').click(function(e){
//    e.preventDefault();
    var idClicked = e.target.id
    if (idClicked.indexOf("btn_add_subindication") > -1) {
      var disease_id = $("#disease_id").val();
      $.ajax({
        url: "/diseases/add_subindication",
        dataType:"script",
        type: "GET",
        data: {
          "disease_id" : disease_id,
          "subindication_id": $("#subindications_select option:selected").val()
        },
        success: function(data, textStatus, jqXHR){
          console.log ("Dynamic indication select works")
          window.location.reload(true);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
               alert("It can not be done!");
        }
      });
    }
    if (idClicked.indexOf("btnRemoveSubindication") > -1) {
      var disease_id = $("#disease_id").val();
      var subindication_id = idClicked.substring(idClicked.indexOf('_')+1, idClicked.length); 
      $.ajax({
        url: "/diseases/remove_subindication",
        dataType:"script",
        type: "GET",
        data: {
          "disease_id" : disease_id,
          "subindication_id": subindication_id 
        },
        success: function(data, textStatus, jqXHR){
          console.log ("Dynamic indication delete works")
          window.location.reload(true);
        } 
      });
    }
  });
}

