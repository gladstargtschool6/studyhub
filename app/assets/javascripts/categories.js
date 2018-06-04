$(document).ready(function () {
    renderQuestions();
    renderAnswers();
})

class Category {
    constructor(id, name, questions_id) {
        this.id = id
        this.name = name
        this.questions_id = questions_id
    }
}
class Question {
    constructor(questionObject) {
        this.id = questionObject.id
        this.title = questionObject.attributes.title
        this.content = questionObject.attributes.content
        this.category_id = questionObject.relationships.category.data.id
    }

    renderQuestion(){
        return `<div>${this.title}<br />${this.content}</div>`
    }
}


function renderQuestions() { //works fine
    $("a.question").on("click", function (e) {
        //console.log(this.href)
        $.get(this.href + '.json').success(function (response) {
            console.log(response.included)
            response.included.forEach(question => {
                const questionObject = new Question(question)
                console.log(questionObject)
                $(`div#load-questions-${ questionObject.category_id}`).append(questionObject.renderQuestion())
            })
        })
        e.preventDefault();
    })
}
function renderAnswers() { 
    // debugger; // works only in the console 
    // and render 1st question repeated
    $("a#answer").on("click", function (e) {
        // debugger;
        $.get(this.href).success(function (response) {
            // debugger;
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

