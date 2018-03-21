
$(document).ready(function(){

  $('form').on('submit', function(event){
    event.preventDefault();
  });

// AJAX call so that when you enter in the zipcode of your
// location the results pop up in the field of view
  $('#bike-shop').on('click', "#shop-search-btn", function () {
    var location = $('#shop-search').val();
    return $.ajax({
      url: '/api/v1/shops',
      method: 'GET',
      data: { location }
    })
      .done(function(shop_list){
        $('#bike-shop').empty()
        $('#bike-shop').append('<table id="list"><tbody id="add-shop-btn"><form>')
        for (var i = 0; i < shop_list.length; i++) {
         $('#list').append('<tr><td><div class="radio"><label><input type="radio" name="optradio" value="' + shop_list[i].name + '"></label></div></td><td><div class="radiotext"><label for="regular">' + shop_list[i].name + '</label></div></td></tr>');
        }
        $('#list').append('</form></tbody></table><br><button class="btn btn-search"> Add Your Shop </button>')
      })
      .fail(function(error){
        console.error(error);
    });
  });

// AJAX call so that when you've selected a shop and click submit
// the user.shop_name is updated
  $('#list').on('click', "#shop-search-btn", function () {
    debugger
      $('#add-shop-btn').click(function(){
          var shop = $("input[name='optradio']:checked").val();
          console.log(shop);
          return $.ajax({
            url: '/api/v1/user',
            method: 'PUT',
            data: { shop }
          })
        .fail(function(error){
          console.error(error);
      });
    });
  });
});
