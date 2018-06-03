$(function(){
    $("a.question").on("click", function (e) {
        // alert("You clicked the link !!!!!!")
        //fire some Ajax
        // debugger;
        $.ajax({
            method: "GET",
            url: this.href,
            // data: { name: "John", location: "Boston"}
        }).done(function(response){
            // console.log(response)
            // debugger;
            $("div.load-questions").html(response)
        });
        // get a response

        // load that response into the HTML of the page
        e.preventDefault();
    })
})
