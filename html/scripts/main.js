$(document).ready(function() {
    $('.main_container').hide();

    $('#cancel').click(() => {
        $('.main_container').hide();
        $.post('https://mrp_charselect/cancel');
    });

    window.addEventListener('message', (event) => {
        var data = event.data;
        if (data.type == "show") {
            $('.main_container').show()
        }
    })
})