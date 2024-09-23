/*$(document).ready(function () {
    const themeToggleButton = $('#theme-toggle');
    const currentTheme = localStorage.getItem('theme') || 'light';

    if (currentTheme === 'dark') {
        $('#theme-toggle').find('i').toggleClass("fa-regular");
        $('#theme-toggle').find('i').toggleClass("fa-solid");
    }

    themeToggleButton.click(function () {
        const newTheme = $('body').hasClass('dark') ? 'light' : 'dark';
        $('body').toggleClass('dark', newTheme === 'dark');
        localStorage.setItem('theme', newTheme);
        $('#theme-toggle').find('i').toggleClass("fa-regular");
        $('#theme-toggle').find('i').toggleClass("fa-solid");
    });
});  */

$(document).ready(function () {
    const sun = $('#sun');
    const moon = $('#moon');    
    const currentTheme = localStorage.getItem('theme') || 'light';

    if (currentTheme === 'light') {
        sun.addClass("active");
    }
    else{
        moon.addClass("active");
    }

    sun.click(function () {
        console.log("clicksun")
        if (sun.hasClass("active")){
            console.log("shutsun")
            return
        }
        const newTheme = 'light';
        $('body').toggleClass('dark', newTheme === 'dark');
        localStorage.setItem('theme', newTheme);
        sun.toggleClass("active");
        moon.toggleClass("active");
    });
    moon.click(function () {
        console.log("clickmoon")
        if (moon.hasClass("active")){
            console.log("shutmoon")
            return
        }
        const newTheme = 'dark';
        $('body').toggleClass('dark', newTheme === 'dark');
        localStorage.setItem('theme', newTheme);
        sun.toggleClass("active");
        moon.toggleClass("active");
    });
});  