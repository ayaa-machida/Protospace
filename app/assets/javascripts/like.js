$(function(){
  var num = 0
  var appendNum = $('.likeNum').append(num);

  appendNum

  $('.addLike').on('click', function(num){
    // console.log("hi");
    num += 1;
    // console.log(num);
    $('.likeNum').append(num);

    $('likeNum').replace()
  });
});