// $(document).on('turbolinks:load', function() {
//   $videoField=$('#video-label')

//   $($videoField).on('change', $videoField, function(e){

//     file = e.target.files[0]
//     reader = new FileReader(),
//     $preview = $(".video-choice");

//     reader.onload = (function(file){
//       return function(e) {
//         $preview.empty();
//         $preview.append($('<video>').attr({
//           src: e.target.result,
//           width: "100%",
//           height: "220px",
//           class: "preview-video",
//           autoplay: "autoplay",
//           loop: "loop",
//           playsinline: "true",
//           title: file.name
//         }));
//       };
//     })(file);
//     reader.readAsDataURL(file);
//   });
// });

