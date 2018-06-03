$(function(){
    $("a.question").on("click", function (e) {
        // alert("You clicked the link !!!!!!")
        //fire some Ajax
        // debugger;
        // low level implementation
        // $.ajax({
        //     method: "GET",
        //     url: this.href,
        //     // data: { name: "John", location: "Boston"}
        // }).success(function(response){
        //     // console.log(response)
        //     // debugger;
        //     $("div.load-questions").html(response)
        // }).error(function(notNeeded){
        //     alert("we broke!!!!!")
        // });
        // get a response
        $.get(this.href).success(function(response){
            $("div.load-questions").html(response) 
        })
        // load that response into the HTML of the page
        e.preventDefault();
    })
})
