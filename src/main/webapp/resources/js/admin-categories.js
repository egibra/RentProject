$( document ).ready(function() {

    // edit category button clicked
    $('table').on('click', '.edit-category-btn', function(){
        var id = $(this).data('id');
        $('#category-name').val($('tr[data-id=' + id + ']').find('td:first').text());//get category name from table
        showEditModal('Redaguoti kategoriją', id);
    });

    // delete category button clicked
    $('table').on('click', '.delete-category-btn', function () {
        var categoryId = $(this).data('id');
        sendRequest('category/'+categoryId, 'DELETE');
    });

    // add new category button clicked
    $('#add-button').click(function(){
        showAddModal('Nauja kategorija');
    });

    //save button clicked
    $('#save-button').click(function(){
        // validate required input fields
        if(!$('#category-name').val()){
            swal('Klaida', 'Neįvedėte kategorijos pavadinimo!', 'warning');
            return;
        }
        save('category', $('#category-name').val(), $('#id').val());
    });

    //auto hide alerts
    $('.alert').fadeTo(2000, 500).slideUp(500, function(){
        $('.alert').slideUp(500);
    });
});