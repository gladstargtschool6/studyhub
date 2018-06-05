$(document).ready(function (e) {
    renderCategories();
    renderQuestions();
    // e.preventDefault()
    // renderAnswers();
})

class Category {
    constructor(categoryObj) {
        this.id = categoryObj.id
        this.name = categoryObj.attributes.name
        this.questions_id = categoryObj.relationships.questions.data.id
    }
    renderCategory() {
        return `<div>${this.name}<br />`
    }
}
class Question {
    constructor(questionObject) {
        this.id = questionObject.id
        this.title = questionObject.attributes.title
        this.content = questionObject.attributes.content
        this.category_id = questionObject.relationships.category.data.id
    }

    // renderQuestion(){
    //     return `<div>${this.title}<br />${this.content}</div>`
    // }

}
Question.prototype.renderQuestion = function(e){
    return `<div>${this.title}<br />${this.content}</div>`
    e.preventDefault()
}
function renderCategories() { 
    $("#new_category").on("submit", function (e) {         
        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function(data){
                // debugger
                data.forEach(category => {
                    const categoryObj = new Category(category)
                    console.log(categoryObj)
                    $(`div#main-content#/categories/${categoryObj.id}`).append(categoryObj.renderCategory().renderQuestion())
                })   
            }
        })
        e.preventDefault();
    })
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
