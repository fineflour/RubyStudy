//$("#subindication_list").empty()
//.append("<%= escape_javascript(render(:partial => @subindications)) %>")

$("#subindication_list").empty()
$("#subindication_list").html("<%= escape_javascript(render(:partial => "subindication", locals: {subindications: @subindications}
)) %>")

