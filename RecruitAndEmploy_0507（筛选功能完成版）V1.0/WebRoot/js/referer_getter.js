(function ($) {
    var href = window.location.href;
    if (href.indexOf('?show_msg') > -1) {
        href = href.substring(0, href.indexOf('?show_msg'));
    }
    setCookie('redirect_url', encodeURI(href), '', '/', '.vsochina.com', '');
})(jQuery);
$(function () {
    var reg_url = document.referrer;
    var patten = /vsochina/ig;
    if (patten.test(reg_url) || reg_url == '' || reg_url == null) {
        return false;
    }
    else {
        setCookie('source_url', reg_url);
    }
});