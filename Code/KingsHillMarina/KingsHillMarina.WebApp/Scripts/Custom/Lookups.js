
$(function () {
    $(".borderBottom").removeClass("borderBottom");
    $('#lnkLookups').addClass("borderBottom");

    $('#btnSaveBoatMake').on('click', function () {

        /*****Validate *******/

        if ($('#BoatMake_Name').val() == '') {
            Msg.error('Please supply boat make and continue...', 3 * 1000);
            return;
        }

        /**************************************/

        var boatMakeModel = $('#frmBoatMake').serializeObject();

        //console.log(boatMakeModel);
       // return

        $.post('/Lookups/SaveBoatMake', { model: boatMakeModel }).done(function (data) {

            if (data.success == true) {
                  Msg.success(data.msg, 2 * 1000);
                    $("#divBoatMake").html(data.partialView);
                    ResetBoatMake();
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

    /********************************************************************/

    $('#btnSaveBoatType').on('click', function () {

        /*****Validate *******/

        if ($('#BoatType_Name').val() == '') {
            Msg.error('Please supply boat type and continue...', 3 * 1000);
            return;
        }

        /**************************************/

        var myModel = $('#frmBoatType').serializeObject();

       
        $.post('/Lookups/SaveBoatType', { model: myModel }).done(function (data) {
            if (data.success == true) {
                Msg.success(data.msg, 2 * 1000);
                $("#divBoatType").html(data.partialView);
                ResetBoatType();
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

    /***************************************************************************/

    $('#btnSaveCharge').on('click', function () {

        /*****Validate ***************************************************/

        if ($('#Charge_Amount').val() == '') {
            Msg.error('Please supply charge and continue...', 3 * 1000);
            return;
        }

        if ($('#Charge_VAT').val() == '') {
            Msg.error('Please supply VATe and continue...', 3 * 1000);
            return;
        }


        /*********************************************************************/

        var myModel = $('#frmCharge').serializeObject();

        $.post('/Lookups/SaveCharge', { model: myModel }).done(function (data) {
            if (data.success == true) {
                Msg.success(data.msg, 2 * 1000);
                $("#divCharge").html(data.partialView);
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
      

    /*********************************************************/

    $('#btnResetBoatMake').on('click', function () {
        ResetBoatMake();
    });

    function ResetBoatMake() {
        $('#BoaMake_Id').val('');
        $('#BoatMake_Name').val('');
        $('#btnSaveBoatMake').text('Add New');
        $('table tr').removeClass("selectedRow");
    }

    /*******************************************************/

    $('#btnResetBoatType').on('click', function () {
        ResetBoatType();
    });

    /************************************* */

    function ResetBoatType() {
        $('#BoaType_Id').val('');
        $('#BoatType_Name').val('');
        $('#btnSaveBoatType').text('Add New');
        $('table tr').removeClass("selectedRow");
    }

    /***********************************************/

});









