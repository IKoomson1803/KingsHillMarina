$(function () {

    $(".borderBottom").removeClass("borderBottom");
    $('#lnkHome').addClass("borderBottom");
    $('#btnShowDeactivatePrompt').hide();
  

    $('#btnSave').on("click", function () {

        /**********Validate boat details entries *********************** */

        if ($('#BoatDetails_Length').val() == '') {
            Msg.error('Please supply boat lenght and continue...', 3 * 1000);
            return;
        }

        if ($('#BoatDetails_MakeId').val() == '') {
            Msg.error('Please supply boat make and continue...', 3 * 1000);
            return;
        }

        if ($('#BoatDetails_TypeId').val() == '') {
            Msg.error('Please supply boat type and continue...', 3 * 1000);
            return;
        }

        if ($('#BoatDetails_Pier').val() == '') {
            Msg.error('Please supply pier and continue...', 3 * 1000);
            return;
        }

        if ($('#BoatDetails_Berth').val() == '') {
            Msg.error('Please supply berth and continue...', 3 * 1000);
            return;
        }

        if ($('#BoatDetails_OwnerFirstName').val() == '') {
            Msg.error('Please supply owner first name and continue...', 3 * 1000);
            return;
        }

        if ($('#BoatDetails_OwnerLastName').val() == '') {
            Msg.error('Please supply owner last name and continue...', 3 * 1000);
            return;
        }

        if ($('#BoatDetails_OwnerAddress').val() == '') {
            Msg.error('Please supply owner address and continue...', 3 * 1000);
            return;
        }

        if ($('#BoatDetails_OwnerTelephone').val() == '') {
            Msg.error('Please supply owner telephone and continue...', 3 * 1000);
            return;
        }

        if ($('#BoatDetails_OwnerEmail').val() == '') {
            Msg.error('Please supply owner email and continue...', 3 * 1000);
            return;
        }

        /*********************************************************/

        var myModel = $('#form_boatdetails').serializeObject();

        $.post('/BoatDetails/Save', { model: myModel }).done(function (data) {

            //console.log(myModel);
            //return

            if (data.success == true) {
                 Msg.success(data.msg, 2 * 1000);
                $("#divContent").html(data.partialView);
                Reset();
            }
            else {
                Msg.error(data.msg, 5 * 1000);
            }
        })
            .fail(function (xdata) {

                Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
            })
            .always(function () {

            });

    });


    $('#btnShowDeactivatePrompt').on("click", function () {

        if ($('#BoatDetails_Id').val() == '') {
            return;
        }

        $('#deletePromptModal').modal('show');

    });

    $('#deletePromptModal').on('shown.bs.modal', function () {

        var modal = $(this);
        modal.find('.modal-body').text('Are you sure you want to deactivate this boat details?');

    });

    $('#btnDelete').on("click", function () {

        $('#deletePromptModal').modal('hide');

        var id = $('#BoatDetails_Id').val();

        $.post('/BoatDetails/Deactivate', { id : id }).done(function (data) {

            if (data.success == true) {
                Msg.success(data.msg, 2 * 1000);
                $("#divContent").html(data.partialView);
                Reset();
            }
            else {
                Msg.error(data.msg, 5 * 1000);
            }
        })
            .fail(function (xdata) {

                Msg.error('Error occured! <b>Status:</b> ' + xdata.status + ' <b>Error Message:</b> ' + xdata.statusText, 5 * 1000);
            })
            .always(function () {

                $('#deletePromptModal').modal('hide');
                $('body').removeClass('modal-open');
                $('.modal-backdrop').remove();
            });
    });


    $('#btnReset').on("click", function () {

        Reset();

    });

    $('#btnReset2').on("click", function () {

        Reset();

    });

});




function Reset() {

    $('#BoatDetails_Id').val('');
    $('#BoatDetails_Name').val('');
    $('#BoatDetails_Length').val('');
    $('#BoatDetails_MakeId').val('');
    $('#BoatDetails_TypeId').val('');
    $('#BoatDetails_Pier').val('');
    $('#BoatDetails_Berth').val('');
    $('#BoatDetails_OwnerFirstName').val('');
    $('#BoatDetails_OwnerLastName').val('');
    $('#BoatDetails_OwnerAddress').val('');
    $('#BoatDetails_OwnerTelephone').val('');
    $('#BoatDetails_OwnerEmail').val('');
    $('#btnSave').text('Add New');
    $('table tr').removeClass("selectedRow");
    $('#btnShowDeactivatePrompt').hide();
}

function Deactivate() {
    alert('hello')
}