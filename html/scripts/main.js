$(document).ready(function() {
    $('.main_container').hide();

    $('#cancel').click(() => {
        $('.main_container').hide();
        $.post('https://mrp_charselect/cancel');
    });

    $('#submit').click(() => {
        let name = $('#fname').val();
        let lastname = $('#lname').val();
        let sex = $('#sex').val();
        let bMonth = $('#month').val();
        let bDay = $('#day').val();
        let bYear = $('#year').val();
        let birthday = `${bMonth}/${bDay}/${bYear}`;
        $('.main_container').hide();
        $.post('https://mrp_charselect/submit', JSON.stringify({
            name: name,
            surname: lastname,
            sex: sex,
            birthday: birthday
        }));
    });

    window.addEventListener('message', (event) => {
        var data = event.data;
        if (data.type == "show") {
            $('.main_container').show()
        }
    })
})