$(document).ready(function () {
    // Update revenue part
    let timeout = null;
    function updateRevenue() {
        $.post(`/${currentLang}/selection/updaterevenue`, { revenue: revenuePreselection }, function (data) {
            resetAndLoad();
        });
    }
    function updateRevenueDelayed() {
        clearTimeout(timeout); // Clear the previous timeout

        // Set a new timeout
        timeout = setTimeout(() => {
            revenuePreselection = $('#revenue-input').val();
            updateRevenue();
            // You can put your custom logic here
        }, 1000); // 1000ms = 1 second
    }
    $('#revenue-input').on('input', function () {
        updateRevenueDelayed();
    });
});

