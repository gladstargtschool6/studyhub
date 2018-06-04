$(document).ready(function () {
    // debugger;
    // function renderAnswers() {
    //     debugger;
        $("a#answer").on("click", function (e) {
            debugger; // didn't hit
            $.get(this.href).success(function (response) {
                $("div.load-questions").html(response)
                $("div#single-post-content").fadeToggle()
            })
            e.preventDefault();
        })
    }
    // renderAnswers();
)

// class Question {
//     constructor(id, title, content, category_id) {
//         this.id = id
//         this.title = title
//         this.content = content
//         this.category_id = category_id
//     }
// }
// didn't work in the browser!!!!
function renderAnswers() {
    $("a#answer").on("click", function (e) {
        debugger; // didn't hit
        $.get(this.href).success(function (response) {
            $("div.load-questions").html(response)
            $("div#single-post-content").fadeToggle()
        })
        e.preventDefault();
    })
}


// $(function () {
//     $("a.answer").on("click", function (e) {
//         // debugger;
//         $.ajax({
//             method: "GET",
//             url: this.href,
//             // data: { name: "John", location: "Boston"}
//         }).success(function(response){
//             // console.log(response)
//             // debugger;
//             $("div.load-questions").html(response)
//         }).error(function(notNeeded){
//             alert("we broke!!!!!")
//         });
//         alert("You clicked the link !!!!!!")
//         // $.get(this.href).success(function (response) {
//         //     $("div.load-answer").html(response)
//         // })
//         e.preventDefault();
//     })
// })