$(document).ready(function () {
    // Update revenue part
    let timeout = null;
    function updateRevenue() {
        $.post(`/${currentLang}/selection/updaterevenue`, { revenue: revenuePreselection }, function () {
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
    let searches = {};
    let filters = {};
    let checkData = {};
    function loadData() {
        $.get(`/${currentLang}/selection/getselectiondata`, { page, searches, filters }, function (data) {
            if (page === 1) {
                $('#selection-table tbody').empty();
            }
            data.forEach(entry => {
                $('#selection-table tbody').append(`
            <tr>
            <td>${entry.vendorname} - ${entry.city}(${entry.country})</td>
            <td>${entry.mdmcode}</td>
            <td>${entry.teamshorttext}</td>
            <td><input id="force-perf-${entry.vendorcode}" class="popup-open" data-target-id="check-overlay" data-vendorcode="${entry.vendorcode}" data-purchasingorganisationcode="${entry.purchasingorganisationcode}" data-field="forceperfcota" type="checkbox" ${entry.perfscope ? 'checked' : ''}></td>
            <td><input id="force-risk-${entry.vendorcode}" class="popup-open" data-target-id="check-overlay" data-vendorcode="${entry.vendorcode}" data-purchasingorganisationcode="${entry.purchasingorganisationcode}" data-field="forceriskcota" type="checkbox" ${entry.riskscope ? 'checked' : ''}></td>
            <td>${entry["Value(EUR)"]}</td>
            <td>${entry.lastsurveillancetext ? entry.lastsurveillancetext : ''}</td>
            <td><input id="reason1-${entry.vendorcode}" class="popup-open" data-target-id="check-overlay" data-vendorcode="${entry.vendorcode}" data-purchasingorganisationcode="${entry.purchasingorganisationcode}" data-field="reason1" type="checkbox" ${entry.reason1 ? 'checked' : ''}></td>
            <td><input id="reason2-${entry.vendorcode}" class="popup-open" data-target-id="check-overlay" data-vendorcode="${entry.vendorcode}" data-purchasingorganisationcode="${entry.purchasingorganisationcode}" data-field="reason2" type="checkbox" ${entry.reason2 ? 'checked' : ''}></td>
            <td><input id="reason3-${entry.vendorcode}" class="popup-open" data-target-id="check-overlay" data-vendorcode="${entry.vendorcode}" data-purchasingorganisationcode="${entry.purchasingorganisationcode}" data-field="reason3" type="checkbox" ${entry.reason3 ? 'checked' : ''}></td>
            <td><input id="reason4-${entry.vendorcode}" class="popup-open" data-target-id="check-overlay" data-vendorcode="${entry.vendorcode}" data-purchasingorganisationcode="${entry.purchasingorganisationcode}" data-field="reason4" type="checkbox" ${entry.reason4 ? 'checked' : ''}></td>
            <td id="comment-${entry.vendorcode}" title="${entry.comment ? entry.comment : ''}">${entry.comment ? entry.comment : ''}</td>
            <td></td>
            </tr>`);
            });
            $('.popup-close').each(function () {
                $(this).on('click', function () {
                    // Get the id of the current element, then remove '-close' from the end
                    const targetId = $(this).data('target-id');
                    // Remove 'active' class from the target element
                    $('#' + targetId).removeClass('active');
                });
            });
            $('.popup-open').each(function () {
                $(this).on('click', function () {
                    event.preventDefault();
                    // Set checkData object
                    checkData.vendorcode = $(this).data('vendorcode');
                    checkData.purchasingorganisationcode = $(this).data('purchasingorganisationcode');
                    checkData.field = $(this).data('field');
                    if ($(this).is(':checked')){
                        checkData.action = "check"
                    }
                    else{
                        checkData.action = "uncheck"
                    }
                    // Get the id of the current element, then remove '-open' from the end
                    const targetId = $(this).data('target-id');
                    // Add 'active' class from the target element
                    $('#' + targetId).addClass('active');
                });
            });
        });
    }
    function check(callback) {
        $.post(`/${currentLang}/selection/check/${checkData.action}`, {
            vendorcode: checkData.vendorcode,
            purchasingorganisationcode: checkData.purchasingorganisationcode,
            field: checkData.field,
            comment: checkData.comment
        }, function (data) {
            console.log("check sent");
            if (typeof callback === 'function') {
                callback(); // Execute the callback after check is done
            }
        });
    }
    
    function resetAndLoad() {
        page = 1;
        loadData();
    }
    function search(id) {
        const inputId = id + "-search"
        const value = $("#" + inputId).val();
        searches[id] = value;
        console.log(searches)
        resetAndLoad()
    }
    $(".search").keydown(function (event) {
        // Check if the key pressed is Enter (key code 13)
        if (event.keyCode === 13) {
            var searchId = $(this).attr("id");
            var id = searchId.replace("-search", "");
            // Call your function here
            search(id)
        }
    });
    $("#check-submit-button").on('click', function () {
        checkData.comment = $("#check-comment").val();
        check(function () {
            resetAndLoad();
            $("#check-overlay").removeClass('active');
        });
    });
    
    loadData()
    // Interaction part

});

