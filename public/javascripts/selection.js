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

    // Selection part
    let page = 1;
    function loadData() {
        $.get(`/${currentLang}/selection/getselectiondata`, {page}, function (data) {
            if (page === 1) {
                $('#data-table tbody').empty();
            }
            data.forEach(entry => {
                $('#data-table tbody').append(`
            <tr>
            <td>${entry.name} - ${entry.city}(${entry.country})</td>
            <td>${entry.mdm}</td>
            <td>${entry.team}</td>
            <td>${entry.perfScope}</td>
            <td>${entry.riskScope}</td>
            <td>${entry.spend}</td>
            <td>${entry.lastIntensity}</td>
            <td>${entry.reason1}</td>
            <td>${entry.reason2}</td>
            <td>${entry.reason3}</td>
            <td>${entry.reason4}</td>
            <td>${entry.comment}</td>
            <td>todo</td>
            </tr>`);
            });
        });
        console.log(data)
    }
    function resetAndLoad() {
        page = 1;
        loadData();
    }
    //loadData()
});

