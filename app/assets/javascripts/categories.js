$(document).ready(function (e) {
    renderCategories();
    renderQuestions();
})

class Category {
    constructor(categoryObj) {
        this.id = categoryObj.id
        this.name = categoryObj.attributes.name
        this.questionsId = categoryObj.relationships.questions.data.id
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
        this.categoryId = questionObject.relationships.category.data.id
    }

}
Question.prototype.renderQuestion = function(e){
    return `
            <div>Title: ${this.title}<br />
            Content: ${this.content}</div>
            <hr>
                                    `
    e.preventDefault()
}

function renderCategories() { 
    $("#new_category").on("submit", function (e) {         
        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function(data){
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
        const id = $(this).data('id')
         $(`div#load-questions-${id}`).html('').toggle()
         
        $.get(this.href + '.json').success(function (response) {
            console.log(response.included)
            const myObj = response.included
            console.log(myObj);
            response.included.sort(function (a, b) {
                const nameA = a.attributes.title;
                // console.log(nameA)
                const nameB = b.attributes.title;
                if (nameA > nameB) {
                    return 1;
                }
                
            })
            response.included.forEach(question => { 
                const questionObject = new Question(question)
                // console.log(questionObject)
                $(`div#load-questions-${questionObject.categoryId}`).append(questionObject.renderQuestion())
                
            })
            
        })
        e.preventDefault();
    })
}


// fetch(this.href + '.json', {
//     credentials: 'include'
// })
//     .then(res => res.json())
//     .then(response => {
//         console.log(response.included)
//         response.included.forEach(question => {
//             const questionObject = new Question(question)
//             console.log(questionObject)
//             $(`div#load-questions-${questionObject.category_id}`).append(questionObject.renderQuestion())

//         })
//     })