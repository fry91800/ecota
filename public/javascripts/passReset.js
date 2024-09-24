$(document).ready(function () {

    let pass = "";
    let confirmpass = "";
    let token = $('#token').val();

    function reset() {
        pass = $('#pass').val();
        confirmpass = $('#confirmpass').val();
        $.post(`/${currentLang}/user/passreset`, { pass, confirmpass, token }, function (response) {
            if (response.status !== 200) {
                $(`#pass-reset-message`).text(response.message);
                $(`#pass-reset-message`).removeClass("success");
                $(`#pass-reset-message`).addClass("error");
            }
            else {
                $(`#pass-reset-message`).text(response.message);
                $(`#pass-reset-message`).removeClass("error");
                $(`#pass-reset-message`).addClass("success");
                new Promise(resolve => setTimeout(resolve, 1000)).then(
                    result => window.location.pathname = "/"
                  );
            }
            $(`#pass-reset-message`).addClass("visible");
            $(`#pass-reset-message`).removeClass("not-visible");
        });
    }

    $("#pass-reset-submit-button").on('click', function () {
        reset();
    });

    $('#pass, #confirmpass').on('keypress', function (event) {
        if (event.key === 'Enter') {
            reset();
        }
    });

})