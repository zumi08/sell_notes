console.log "yomikomi"
$ ->
  app.initialize()
  app.setBind()

app =
  initialize: ->

  setBind: ->
    $(window).keyup (e) ->
      console.log "aa"
    $('#to_college_university_id').change ->
      alert 'aaa'
      console.log 'bbb'
      app.ajaxChangeCollege(@)

  ajaxChangeCollege: (obj) ->
    console.log "aaa"
    $.ajax
      type: 'GET'
      dataType: 'json'
      url: "/teachers/#{id}/ajax_change_certificate_branch"
      data: {
        certificate: $(obj).val()
      }
      success: (data) ->
        $('#category_list').empty()
        for obj in data
          console.log obj
          $('#category_list').append("""<li><a href="/teachers/#{obj.id}">#{obj.name}</a></li>""")


