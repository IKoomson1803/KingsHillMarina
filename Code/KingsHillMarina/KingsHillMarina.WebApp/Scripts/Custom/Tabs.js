
$(function () {
    initialize();
});

function initialize() {
    initializeTabs();

}

function initializeTabs() {

    var region = getQueryStringParams('type');
    
    if (!region) {
        region = 'BoatMake'
    }

   showActiveRegion(region);
}

function getQueryStringParams(sParam) {
    var sPageURL = window.location.search.substring(1);
   // console.log(sPageURL)

    if (!sPageURL) {
        return undefined;
    }

    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) {
            return sParameterName[1];
        }
    }

}

function showActiveRegion(region) {

    $("li").removeClass("active");

    if (!$('#' + region).hasClass("active")) {
        $('#' + region).addClass("active");
    }
}

function showRegion(region) {
   
    ToggleTabs(region);
    showActiveRegion(region);
}

function ToggleTabs(region) {
    location.href = '/Lookups/Index?type=' + region;
}








