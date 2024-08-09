$(document).ready(function () {
    let page = 1;
    // Filters
    let selected = false;
    let notSelected = false;
    let revenueSign = ">";
    let revenue = 0;
    let intensity1 = false;
    let intensity2 = false;
    let intensity3 = false;
    let intensity4 = false;
    // Search
    let supplier = '';
    // Sort
    let sortField = '';
    let sortOrder = 'asc';


    // check Reason
    let currentErp = "";
    let reason = "";
    let action = "check";

    //Comment
    let comment = "";

    // Slide and Revenue values
    //var $slider = $('#revenue-slider');
    var $filterRevenue = $('#filter-revenue');

    function reasonAction() {
        $.post(`/fr/selection/reason/${encodeURIComponent(action)}`, { erp: currentErp, reason: reason }, function (data) {
            if (data.selected === true) {
                $(`#selected-${currentErp}`).prop('checked', true);
            }
            if (data.selected === false) {
                $(`#selected-${currentErp}`).prop('checked', false);
            }
        });
    }


    function loadData() {
        $.get('/fr/selection/data', { page, selected, notSelected, supplier, revenueSign, revenue, intensity1, intensity2, intensity3, intensity4, sortField, sortOrder }, function (data) {
            if (page === 1) {
                $('#data-table tbody').empty();
            }
            data.forEach(entry => {
                $('#data-table tbody').append(`
            <tr>
            <td><input id="selected-${entry.erp}" type="checkbox" ${entry.selected ? 'checked' : ''}></td>
            <td>${entry.supplier}</td>
            <td>${Intl.NumberFormat().format(entry.revenue)}</td>
            <td class="intensity${entry.intensityCode}" data-intensityCode="${entry.intensityCode}">${entry.intensity}</td>
            <td><input id="reason1-${entry.erp}" type="checkbox" ${entry.reason1 ? 'checked' : ''}></td>
            <td><input id="reason2-${entry.erp}" type="checkbox" ${entry.reason2 ? 'checked' : ''}></td>
            <td><input id="reason3-${entry.erp}" type="checkbox" ${entry.reason3 ? 'checked' : ''}></td>
            <td><input id="reason4-${entry.erp}" type="checkbox" ${entry.reason4 ? 'checked' : ''}></td>
            <td id="comment-${entry.erp}" title="${entry.comment ? entry.comment : ''}">${entry.comment ? entry.comment : ''}</td>
            <td>${entry.history === true ? '...' : ''}</td>
            </tr>`);
                $(`#reason1-${entry.erp}`).on('change', function () {
                    currentErp = entry.erp;
                    reason = "reason1"
                    if ($(this).is(':checked')) {
                        action = "check"
                    } else {
                        action = "uncheck"
                    }
                    reasonAction()
                });
                $(`#comment-${entry.erp}`).click(function () {
                    location.hash = '#newCommentPopup';
                });
            });
        });
    }

    function resetAndLoad() {
        page = 1;
        loadData();
    }

    $('#load-more').click(function () {
        page++;
        loadData();
    });

    $('#filter-selected').click(function () {
        selected = !selected
        $(this).toggleClass('active');
        if (selected === true && notSelected === true) {
            notSelected = !notSelected
            $('#filter-not-selected').toggleClass('active');
        }
        resetAndLoad();
    });
    $('#filter-not-selected').click(function () {
        notSelected = !notSelected
        $(this).toggleClass('active');
        if (selected === true && notSelected === true) {
            selected = !selected
            $('#filter-selected').toggleClass('active');
        }
        resetAndLoad();
    });
    $('#search-supplier').on('keydown', function (event) {
        // Check if the pressed key is Enter (key code 13)
        if (event.which === 13) {
            // Prevent the default action (optional)
            event.preventDefault();
            supplier = $(this).val();
            resetAndLoad();
        }
    });
    

    $('#sort-supplier').click(function () {
        sortField = 'supplier';
        sortOrder = $(this).data('sort');
        resetAndLoad();
        $(this).data('sort', sortOrder === 'asc' ? 'desc' : 'asc');
    });
    $('#filter-revenue-sign').click(function () {
        var currentText = $(this).text().trim();
        if (currentText === '>') {
            $(this).text('<');
        } else {
            $(this).text('>');
        }
        revenueSign = $(this).text();
        resetAndLoad();
    });
    $('#filter-revenue').on('keydown', function (event) {
        // Check if the pressed key is Enter (key code 13)
        if (event.which === 13) {
            revenue = $(this).val();
            resetAndLoad();
        }
    });
    /*
    $('#revenue-slider').on('input', function () {
        revenue = $(this).val();
        resetAndLoad();
    });
    */
    $('#sort-revenue').click(function () {
        sortField = 'revenue';
        sortOrder = $(this).data('sort');
        resetAndLoad();
        $(this).data('sort', sortOrder === 'asc' ? 'desc' : 'asc');
    });
    $('#filter-intensity1').click(function () {
        intensity1 = !intensity1
        $(this).toggleClass('active');
        if (intensity1 && intensity2 && intensity3 && intensity4) {
            intensity1 = false
            intensity2 = false
            intensity3 = false
            intensity4 = false
            $('#filter-intensity1').toggleClass('active');
            $('#filter-intensity2').toggleClass('active');
            $('#filter-intensity3').toggleClass('active');
            $('#filter-intensity4').toggleClass('active');
        }
        resetAndLoad();
    });
    $('#filter-intensity2').click(function () {
        intensity2 = !intensity2
        $(this).toggleClass('active');
        if (intensity1 && intensity2 && intensity3 && intensity4) {
            intensity1 = false
            intensity2 = false
            intensity3 = false
            intensity4 = false
            $('#filter-intensity1').toggleClass('active');
            $('#filter-intensity2').toggleClass('active');
            $('#filter-intensity3').toggleClass('active');
            $('#filter-intensity4').toggleClass('active');
        }
        resetAndLoad();
    });
    $('#filter-intensity3').click(function () {
        intensity3 = !intensity3
        $(this).toggleClass('active');
        if (intensity1 && intensity2 && intensity3 && intensity4) {
            intensity1 = false
            intensity2 = false
            intensity3 = false
            intensity4 = false
            $('#filter-intensity1').toggleClass('active');
            $('#filter-intensity2').toggleClass('active');
            $('#filter-intensity3').toggleClass('active');
            $('#filter-intensity4').toggleClass('active');
        }
        resetAndLoad();
    });
    $('#filter-intensity4').click(function () {
        intensity4 = !intensity4
        $(this).toggleClass('active');
        if (intensity1 && intensity2 && intensity3 && intensity4) {
            intensity1 = false
            intensity2 = false
            intensity3 = false
            intensity4 = false
            $('#filter-intensity1').toggleClass('active');
            $('#filter-intensity2').toggleClass('active');
            $('#filter-intensity3').toggleClass('active');
            $('#filter-intensity4').toggleClass('active');
        }
        resetAndLoad();
    });

    /*
    // Function to synchronize slider and text input
    function updateSliderFromInput() {
        var value = parseInt($filterRevenue.val(), 10);
        if (!value) {
            value = 0;
        }
        // Ensure value is within the slider's range
        if (isNaN(value) || value < $slider.attr('min')) {
            value = $slider.val(); // Reset to slider value if input is invalid
        }
        $slider.val(value);
        revenue = value;
    }

    function updateInputFromSlider() {
        $filterRevenue.val($slider.val());
        revenue = $slider.val();
    }

    // Initial synchronization
    updateSliderFromInput();

    // Event handler for slider input
    $slider.on('input', function () {
        updateInputFromSlider();
    });

    // Event handler for text input
    $filterRevenue.on('input', function () {
        updateSliderFromInput();
    });
    */
    $('#cancel-comment').click(function () {
        location.hash = '#';
    });




    loadData();
});
