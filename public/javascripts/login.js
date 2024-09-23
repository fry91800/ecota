$(document).ready(function () {

    let mail = "";
    let pass = "";

    function login(){
        $.post(`/${currentLang}/user/login`, { mail, pass }, function (response) {
            console.log("attemps")
            if (response.status !== 200) {
                $(`#log-in-message`).text(response.message);
                $(`#log-in-message`).removeClass("success");
                $(`#log-in-message`).addClass("error");
            }
            else {
                $(`#log-in-message`).text(response.message);
                $(`#log-in-message`).removeClass("error");
                $(`#log-in-message`).addClass("success");
                window.location.pathname = "/";
            }
            $(`#log-in-message`).addClass("visible");
            $(`#log-in-message`).removeClass("not-visible");
        });
    }

    function recovery(string) {
        $.post(`/${currentLang}/user/recovery`, { mail }, function (response) {
            if (response.status !== 200) {
                $(`#${string}-message`).text(response.message);
                $(`#${string}-message`).removeClass("success");
                $(`#${string}-message`).addClass("error");
            }
            else {
                $(`#${string}-message`).text(response.message);
                $(`#${string}-message`).removeClass("error");
                $(`#${string}-message`).addClass("success");
            }
            $(`#${string}-message`).addClass("visible");
            $(`#${string}-message`).removeClass("not-visible");
        });
    }

    $('.popup-close').each(function () {
        $(this).on('click', function () {
            // Get the id of the current element, then remove '-close' from the end
            const closeId = $(this).attr('id');
            const targetId = closeId.replace('-close', '');

            // Remove 'active' class from the target element
            $('#' + targetId).removeClass('active');
        });
    });
    $('.popup-open').each(function () {
        $(this).on('click', function () {
            // Get the id of the current element, then remove '-close' from the end
            const closeId = $(this).attr('id');
            const targetId = closeId.replace('-open', '');

            // Remove 'active' class from the target element
            $('#' + targetId).addClass('active');
        });
    });

    $("#recovery-submit-button").on('click', function () {
        mail = $('#recovery-mail').val();
        recovery("recovery");
    });

    $("#signup-submit-button").on('click', function () {
        mail = $('#signup-mail').val();
        recovery("signup");
    });
    $("#log-in-submit-button").on('click', function () {
        mail = $('#mail').val();
        pass = $('#pass').val();
        login();
    });

})