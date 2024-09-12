$(document).ready(function () {
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
});  