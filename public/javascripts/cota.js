$(document).ready(function () {
    console.log("lol");
    $('#cotaCardBody1').click(function () {
        $(`#formPopup`).toggleClass("active");
    });
    $('#cancel-cota-form').click(function () {
        $(`#formPopup`).toggleClass("active");
    });
})