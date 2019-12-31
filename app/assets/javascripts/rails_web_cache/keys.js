$(document).ready(function() {
    $('#select-all-keys').on('click', function() {
        var checked = $(this).is(':checked');
        if (checked) {
            $('#delete-all-keys').removeClass('disabled').prop('disabled', false);
        } else {
            $('#delete-all-keys').addClass('disabled').prop('disabled', true);
        }
        $("input[name='keys[]']").each(function() {
            $(this).prop('checked', checked);
        });
    });
    $("input[name='keys[]'").on('click', function() {
        var checked = $("input:checked[name='keys[]']");
        var size = checked.length;
        if (size > 0) {
            $('#delete-all-keys').removeClass('disabled').prop('disabled', false);
        } else {
            $('#delete-all-keys').addClass('disabled').prop('disabled', true);
        }
    });
});