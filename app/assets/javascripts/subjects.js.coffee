#This code sends an AJAX GET request to that URL /update_sites with study_id in parameter.
#Then we use this parameter to return a list of sites belonging to the relevant study.

$ ->
  $(document).on 'change', '#studies_select', (evt) ->
    $.ajax 'update_sites',
      type: 'GET'
      dataType: 'script'
      data: {
        study_id: $("#studies_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic study select OK!")
