/**
 * Created by xavier on 14-7-2.
 */
(function($){
    $(document).ready(function(){
        var uname = getCookie('vso_uname');
        var uid = getCookie('vso_uid');
        var usess = getCookie('vso_sess');
        if(typeof uname != 'undefined' && typeof uid != 'undefined' && typeof usess != 'undefined'
            && uname != null && uid !=null && usess != null) {
            var host = location.hostname;
            var operation_type = '';
            switch (host) {
                case 'www.vsochina.com':
                    operation_type = $('#operation_type').val();
                    break;
                case 'create.vsochina.com':
                    operation_type = 'create';
                    break;
                case 'render.vsochina.com':
                    operation_type = 'render';
                    break;
                default :
                    operation_type = null;
                    break;
            }

            if(operation_type) {
                if(!getCookie(uname + '_' + operation_type + '_exp')) {
                    addExp(uid, uname, operation_type);
                }
            }
        }
    });

    function addExp(uid, uname, type){
        $.ajax({
            url: 'http://account.vsochina.com/api/member/addexp_ajax',
            dataType:'jsonp',
            data:{'uid': uid, 'username':uname, 'operation_type': type},
            success:function(rjson){
                if((rjson.result == '10000') || (rjson.result == '10003')) {
                    var dd = new Date();
                    dd.setDate(dd.getDate() + 1);//获取明天
                    var y = dd.getFullYear();
                    var m = dd.getMonth() + 1;//获取当前月份的日期
                    var d = dd.getDate();
                    var date = new Date(y+'-'+m+'-'+d+' 00:00:00');
                    //$.cookie(uname + '_' + type + '_exp', 1, {expires:date ,domain: '.vsochina.com'});
                    setCookie(uname, 1, date, '', '.vsochina.com');
                }else {
                    if(!getCookie(uname + '_' + type + '_exp')) {
                        //addExp(uid, uname, type);
                    }
                }
            }
        });
    }
    function ajax_exp(){
    	var uname = getCookie('vso_uname');
    	var usess = getCookie('vso_sess');
    	if(getCookie(uname + '_exp')) return;
    	var date = new Date();
    	date.setTime(date.getTime() + (4 * 60 * 1000));
        //$.cookie(uname + '_exp', 1, {expires:date ,domain: '.vsochina.com'});
        setCookie(uname, 1, date, '', '.vsochina.com');
    	if(usess =='')return;
    	$.ajax({
            url: 'http://account.vsochina.com/api/member/ajax_exp',
            dataType:'jsonp',
            data:{'sess': usess},
            success:function(rjson){
                if((rjson.result == '10000') || (rjson.result == '10003')) {
                	
                }
            }
        });
	}
    setInterval(ajax_exp, 300000);
    //summer_lottery_chance
    function lottery_chance(){
        var uname = getCookie('vso_uname');
        if(typeof uname != 'undefined' && uname != null ) {
            $.ajax({
                url: 'http://www.vsochina.com/index.php?do=summer_lottery&action=updchance',
                dataType:'jsonp',
                data:{ 'username':uname },
                success:function(rjson){

                }
            });
        }
    }
    //setInterval(lottery_chance,300000);
})(jQuery);