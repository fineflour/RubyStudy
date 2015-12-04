$ ->
$(document).on 'change', '#indications_select', (evt) ->
    $.ajax '/update_subindications',
      type: 'GET'
      dataType:'script'
      data: {
        indication_id: $("#indications_select option:selected").val()
        id: id
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")
