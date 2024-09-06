$(function () {


    if (!$.fn.dataTable.isDataTable('.grid-view')) {
        initializeDataTable();
    }

    $(".dt-buttons").hide();

});


function initializeDataTable() {

    $('.grid-view').DataTable({
        /*   dom: 'Blfrtip',*/
        /* dom: '<"top"i>rt<"bottom"flp><"clear">',*/
        "dom": '<"top"rlif>t<"bottom"p>',
        "iDisplayLength": 15,
        searching: true,
         columnDefs: [
            { "orderable": true, "targets": [0] }
            ///*  { "visible": false, "targets": [1] }*/
        ],
        buttons: [{
            //text: 'Export To Excel',
            //className: 'btn-export',
            //extend: 'excelHtml5',
            //exportOptions: {
            //    modifier: {
            //        selected: true
            //    },
            //    columns: [1, 2, 3, 4, 5, 6, 7],
            //    format: {
            //        header: function (data, columnIdx) {
            //            return data;
            //        },
            //        body: function (data, column, row) {
            //            return data;
            //        }
            //    }
            //},
            footer: false,
            //customize: function (xlsx) {
            //    var sheet = xlsx.xl.worksheets['sheet1.xml'];
            //    //$('c[r=A1] t', sheet).text( 'Custom text' );
            //    //$('row c[r^="C"]', sheet).attr('s', '2');
            //}
        }]
    });
}

