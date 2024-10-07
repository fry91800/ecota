$(document).ready(function () {
    // Cota list part
    let page = 1;
    let searches = {};
    let filters = {};
    let field = null;
    let vendorcode = null;
    let purchasingorganisationcode = null;
    function loadData() {
        $.get(`/${currentLang}/cota/getcotadata`, { page, searches, filters }, function (data) {
            console.log(data)
            if (page === 1) {
                $('#cota-table tbody').empty();
            }
            data.forEach(entry => {
                $('#cota-table tbody').append(`
            <tr>
            <td><div id="perf-${entry.vendorcode}" class="popup-open" data-target-id="perf-overlay" data-vendorcode="${entry.vendorcode}" data-purchasingorganisationcode="${entry.purchasingorganisationcode}" data-field="forceperfcota">${entry.perfscope ? '<i class="fa-regular fa-file-lines"></i>' : ''}</td>
            <td><div id="risk-${entry.vendorcode}" class="popup-open" data-target-id="risk-overlay" data-vendorcode="${entry.vendorcode}" data-purchasingorganisationcode="${entry.purchasingorganisationcode}" data-field="forceriskcota">${entry.riskscope ? '<i class="fa-regular fa-file-lines"></i>' : ''}</td>
            <td>${entry.vendorname} - ${entry.city}(${entry.country})</td>
            <td>${entry.mdmcode}</td>
            <td>${entry.teamshorttext}</td>
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
                    // Set data 
                    vendorcode = $(this).data('vendorcode');
                    purchasingorganisationcode = $(this).data('purchasingorganisationcode');
                    field = $(this).data('field');
                    // load Answers
                    loadAnswers(vendorcode, purchasingorganisationcode);
                    // Get the id of the current element, then remove '-open' from the end
                    const targetId = $(this).data('target-id');
                    // Add 'active' class from the target element
                    $('#' + targetId).addClass('active');
                });
            });
        });
    }
    function loadAnswers(vendorcode, purchasingorganisationcode) {
        $.get(`/${currentLang}/cota/answers`, { vendorcode, purchasingorganisationcode }, function (data) {
            $('.answer').prop('checked', false);
            data.forEach((element) => {
                $(`#${element.questioncode}-${element.answer}`).prop('checked', true)
                $(`#${element.questioncode}-comment`).val(element.comment);
            }
            );

        });
    }
    function addAnswer(questioncode, answer) {
        $.post(`/${currentLang}/cota/answer`, { vendorcode, purchasingorganisationcode, questioncode, answer }, function (data) {
        });
    }
    $('.answer').on('click', function () {
        const questioncode = $(this).attr('name')
        const answer = $(this).val()
        console.log(questioncode)
        console.log(answer)
        addAnswer(questioncode, answer)
    });
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
    // Update comment part
    let timeout = null;
    function comment(text, questioncode) {
        $.post(`/${currentLang}/cota/comment`, { vendorcode, purchasingorganisationcode, questioncode, comment: text }, function () {
        });
    }
    function commentDelayed(text, questioncode) {
        clearTimeout(timeout); // Clear the previous timeout

        // Set a new timeout
        timeout = setTimeout(() => {
            comment(text, questioncode);
            // You can put your custom logic here
        }, 1000); // 1000ms = 1 second
    }
    $('.comment').on('input', function () {
        const text = $(this).val();
        const questioncode = $(this).attr("name");
        commentDelayed(text, questioncode);
    });
    loadData()
    // Interaction part

});