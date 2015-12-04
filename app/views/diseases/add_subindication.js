$("#subindication_list").empty()
$("#subindication_list").html("<%= escape_javascript(render(:partial => "subindication", locals: {subindications: @subindications}
)) %>")

