$( document ).ready(function() {

    // edit attribute button clicked
    $('table').on('click', '.edit-attribute-btn', function(){
        $('#attribute-category').prop('disabled', 'disabled');
        var id = $(this).data('id');
        //get info from table
        var $row = $('tr[data-id=' + id + ']');
        $('#attribute-name').val($row.find('td:first').text());
        $('#attribute-description').val($row.find('td:nth-of-type(3)').text());
        $('option[value='+$row.find('td:nth-of-type(2)').data('id')+']').prop('selected', true);
        showEditModal('Redaguoti daikto parametrą', id);
    });

    // delete attribute button clicked
    $('table').on('click', '.delete-attribute-btn', function () {
        var attributeId = $(this).data('id');
        sendRequest('attribute/'+attributeId, 'DELETE');
    });

    // add new category button clicked
    $('#add-button').click(function(){
        $('#attribute-category').prop('disabled', false);
        showAddModal('Naujas parametras');
    });

    //save button clicked
    $('#save-button').click(function(){
        // validate required input fields
        if(!$('#attribute-name').val()){
            swal('Klaida', 'Neįvedėte parametro pavadinimo!', 'warning');
            return;
        }
        //serialize
        var json = {};
        $('.form-control').each(function() { json[this.name] = this.value; });
        save('attribute', json, $('#id').val());
    });

    //auto hide alerts
    $('.alert').fadeTo(2000, 500).slideUp(500, function(){
        $('.alert').slideUp(500);
    });
});