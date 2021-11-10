// $('.slide').slick({
    
//     autoplay : true,

//     dots: true,

//     speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,

//     infinite: true,

//     autoplaySpeed: 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,

//     arrows: true,

//     slidesToShow: 1,

//     slidesToScroll: 1,

//     fade: false

// });


$('.slide1').slick({
    dots: true,
    infinite: true,
    speed: 500,
    fade: true,
    arrows: true,
    cssEase: 'linear'
  });

 $('.slider-for').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true,
    asNavFor: '.slider-nav'
  });
  $('.slider-nav').slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    asNavFor: '.slider-for',
    dots: true,
    centerMode: true,
    focusOnSelect: true
  });