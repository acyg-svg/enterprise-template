//Login function
function login() {
    var u_field = $("#login_username").val();
    var p_field = $("#login_password").val();
    if (u_field == "" || p_field == "") {
        alert("Please enter the credentials");
        return false;
    }
    alert("Client side auth success!");

}



//This function is the typer function which prints a character one by one by taking a string and delay as input
var type = function (component, message, index, interval) {

    if (index < message.length) {
        $(component).append(message[index++]);
        setTimeout(function () {
            type(component, message, index, interval)
        }, interval);
    }
}


$(document).ready(function () {

    setTimeout(function () {


        $(".ENTIRE_PAGE, .menu")
            .css('display', 'block')
            .animate({
                opacity: 1.0
            }, 500);
    }, 500);


    //This function registers a permanant Async task that constantly keeps performing the typing animation that was earlier defined
    var rep = 0;
    setInterval(function () {
        $("#my_subtitle").text("");
        var text = "";
        switch (rep) {
            case 1:
                rep = 1;
                text = "Health";
                break;
            case 2:
                rep = 2;
                text = "Quality";
                break;
            default:
                rep = 0;
                text = "Innovation";
        }

        type("#my_subtitle", text, -1, 40);
        rep = (rep + 1) % 3;
    }, 2000);




    $("img#li").one('animationend', function () {
        $("img.social").css('animation', 'float 2s infinite');
        $("img#fb").css('animation-delay', '1s');
        $("img#gh").css('animation-delay', '1.5s');
        $("img#li").css('animation-delay', '2s');

    });


});
$("#clear_btn").click(function () {
    $('form').find("input[type=text], textarea").val("");
});
