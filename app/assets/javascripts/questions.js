function Question(id, title, content) {
    this.id = id;
    this.title = title;
    this.content = content;
}

$(function () {
    $("a.answer").on("click", function (e) {
        // debugger;
        $.ajax({
            method: "GET",
            url: this.href,
            // data: { name: "John", location: "Boston"}
        }).success(function(response){
            // console.log(response)
            // debugger;
            $("div.load-questions").html(response)
        }).error(function(notNeeded){
            alert("we broke!!!!!")
        });
        alert("You clicked the link !!!!!!")
        // $.get(this.href).success(function (response) {
        //     $("div.load-answer").html(response)
        // })
        e.preventDefault();
    })
})