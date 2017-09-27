//
// $(document).ready(function(){
//
//   $('form').on('submit', function(event){
//     event.preventDefault();
//   });
//
//   $('.find-bike-shops').on('click', ".bike-search-btn", function () {
//     var location = $('.bike-search').val();
//     return $.ajax({
//       url: '/api/v1/shops',
//       method: 'GET',
//       data: { location }
//     })
//       .done(function(shop_list){
//         $('.find-bike-shops').empty()
//         for (var i = 0; i < shop_list.length; i++) {
//          $('.find-bike-shops').append('<p>' + shop_list[i].name + ' : ' + shop_list[i].email + '</p>');
//         }
//     })
//       .fail(function(error){
//         console.error(error);
//     });
//   });
// });
