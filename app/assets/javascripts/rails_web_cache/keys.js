$(document).ready(function() {
    $('#select-all-keys').on('click', function() {
        const checked = $(this).is(':checked');
        if (checked) {
            $('#delete-all-keys').removeClass('disabled');
        } else {
            $('#delete-all-keys').addClass('disabled');
        }
        $("input[name='keys[]']").each(function() {
            $(this).prop('checked', checked);
        });
    });
    $("input[name='keys[]'").on('click', function() {
        const checked = $("input:checked[name='keys[]']");
        const size = checked.length;
        if (size > 0) {
            $('#delete-all-keys').removeClass('disabled');
        } else {
            $('#delete-all-keys').addClass('disabled');
        }
    });
});