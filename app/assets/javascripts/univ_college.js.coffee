console.log "yomikomi"
$ ->
  app.initialize()
  app.setBind()
  $(".searchable").select2({
      width:      200,  # 横幅
      allowClear: true  # x で選択したものを削除できる
      # 詳細は http://ivaynberg.github.io/select2/#documentation
    })

app =
  initialize: ->

  setBind: ->
    $(window).keyup (e) ->
      console.log "aa"
    $('#to_college_university_id').change ->
      console.log 'bbb'
      app.ajaxChangeCollege(@)

  ajaxChangeCollege: (obj) ->
    console.log "aaa"
    $.ajax
      type: 'GET'
      dataType: 'json'
      url: "/items/new/ajax_change_college"
      data: {
        university_id: $(obj).val()
      }
      success: (data) ->
        $('#item_college_id').empty()
        for obj in data
          $("#item_college_id").append("<option value='#{obj.id}'>#{obj.name}</option>")

