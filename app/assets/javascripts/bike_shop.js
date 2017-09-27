
$(document).ready(function(){

  $('form').on('submit', function(event){
    event.preventDefault();
  });

// AJAX call so that when you enter in the zipcode of your
// location the results pop up in the field of view
  $(document).on('click', ".shop-search-btn", function () {
    var location = $('.shop-search').val();
    return $.ajax({
      url: '/api/v1/shops',
      method: 'GET',
      data: { location }
    })
      .done(function(shop_list){
        $('#bike-shop').empty()
        // $('#bike-shop').append('<h2> Select a shop from the list below to make it your home shop </h2><br> <form action="submit">')
        for (var i = 0; i < shop_list.length; i++) {
         $('#bike-shop').append(
 // '<input type="radio" name="shop' + i + '" value="' + shop_list[i].name + '><br>' +
           '<p>' + shop_list[i].name + '</p>');
        }
        $('#bike-shop').append('')
    })
      .fail(function(error){
        console.error(error);
    });
  });

// // AJAX call so that when you've selected a shop and click submit
// // the user.shop_name is updated
//   $('#bike-shop').on('click', ".update-shop-btn", function () {
//     var shop = $('  ').val();  // <-- not sure where to grab the value of the shop to update user with
//     // how do i grab the checkbox that's been clicked
//     return $.ajax({
//       url: '/api/v1/user',
//       method: 'PUT',
//       data: { shop }
//     })
//       .fail(function(error){
//         console.error(error);
//     });
//   });
});
