$(document).ready(function () {
    renderQuestions();
})

class Category {
    constructor(id, name) {
        this.id = id
        this.name = name
    }
}
    function renderQuestions() {
        $("a.question").on("click", function (e) {
            $.get(this.href).success(function (response) {
                $("div.load-questions").html(response)
                $("div#single-post-content").fadeToggle()
            })
            e.preventDefault();
        })
    }
    
    // $(function() {
    //     $("a.question").on("click", function (e) {
    //         $.get(this.href).success(function (response) {
    //             $("div.load-questions").html(response)
    //             $("div#single-post-content").fadeToggle()
    //         })
    //         e.preventDefault();
    //     })
    //     $("a#new").on("click", function (e){
    //         $.get(this.href).success(function(response){
    //             debugger;
    //             $("div.new-cat").html(response)
    //         })
    //     })
    // })
// }


    
//     const getQuestions = $("a.question").on("click", function (e) {
//         $.get(this.href).success(function(response){
//             $("div.load-questions").html(response) 
//         })
//         e.preventDefault();
//     })
//     const getCategories = $("a.interested").on("click", function (e) {
//         $.get(this.href).success(function (response) {
//             $("div.load-questions").html(response)
//         })
//         e.preventDefault();
//     })
// })

    // function getQuestions() {
    // $("a.question").on("click", function (e) {
    //     $.get(this.href).success(function (response) {
    //         $("div.load-questions").html(response)
    //     })
    //     e.preventDefault();
    //     })
    // }
// }

