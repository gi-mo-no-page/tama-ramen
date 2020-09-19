  $(document).on('keyup', '.name-form', function(e){
  e.preventDefault();
  var input = $.trim($(this).val());
  $.ajax({
    url: '/shops/replay',
    type: 'GET',
    data: ('keyword=' + input),
    processData: false,
    contentType: false,
    dataType: 'json'
  })
  .done(function(data){ 
    $('#result').find('li').remove();
      $(data).each(function(i, name){ 
      $('#result').append('<li>' + name.name + '</li>')
    })
    
    $('li').on('click', function(){
      $(this).attr('id', 'result-li');
      var text = $('#result-li').text();
      console.log(text)
      $('#form').val(text);
      $('#result').empty();
    });


  })
});
