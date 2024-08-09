$(document).ready(function () {
    let page = 1;
    // Filters
    let selected = false;
    let notSelected = false;
    // Search
    let supplier = '';
    // Sort
    let sortField = '';
    let sortOrder = 'asc';

    // Slide and Revenue values
    var $slider = $('#rangeSlider');
    var $textInput = $('#textInput');

    function loadData() {
        $.get('/fr/selection/data', { page, selected, notSelected, supplier, sortField, sortOrder }, function (data) {
            if (page === 1) {
                $('#data-table tbody').empty();
            }
            data.forEach(entry => {
                $('#data-table tbody').append(`
            <tr>
            <td><input type="checkbox" ${entry.selected ? 'checked' : ''}></td>
            <td>${entry.supplier}</td>
            <td>${entry.revenue}</td>
            <td>${entry.intensity}</td>
            <td><input type="checkbox" ${entry.reason1 ? 'checked' : ''}></td>
            <td><input type="checkbox" ${entry.reason2 ? 'checked' : ''}></td>
            <td><input type="checkbox" ${entry.reason3 ? 'checked' : ''}></td>
            <td><input type="checkbox" ${entry.reason4 ? 'checked' : ''}></td>
            <td>${entry.comment ? entry.comment : ''}</td>
            </tr>`);
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
        resetAndLoad();
    });
    $('#filter-not-selected').click(function () {
        notSelected = !notSelected
        console.log(notSelected)
        $(this).toggleClass('active');
        resetAndLoad();
    });

    $('#search-supplier').on('input', function () {
        supplier = $(this).val();
        resetAndLoad();
    });

    $('#search-city').on('input', function () {
        city = $(this).val();
        resetAndLoad();
    });

    $('#sort-supplier').click(function () {
        sortField = 'supplier';
        sortOrder = $(this).data('sort');
        resetAndLoad();
        $(this).data('sort', sortOrder === 'asc' ? 'desc' : 'asc');
    });

    $('#sort-revenue').click(function () {
        sortField = 'revenue';
        sortOrder = $(this).data('sort');
        resetAndLoad();
        $(this).data('sort', sortOrder === 'asc' ? 'desc' : 'asc');
    });


            // Function to synchronize slider and text input
            function updateSliderFromInput() {
                var value = parseInt($textInput.val(), 10);
                if (!value)
                {
                    value = 0;
                }
                // Ensure value is within the slider's range
                if (isNaN(value) || value < $slider.attr('min')) {
                    value = $slider.val(); // Reset to slider value if input is invalid
                }
                $slider.val(value);
            }

            function updateInputFromSlider() {
                $textInput.val($slider.val());
            }

            // Initial synchronization
            updateSliderFromInput();

            // Event handler for slider input
            $slider.on('input', function() {
                updateInputFromSlider();
            });

            // Event handler for text input
            $textInput.on('input', function() {
                updateSliderFromInput();
            });
    loadData();
});
