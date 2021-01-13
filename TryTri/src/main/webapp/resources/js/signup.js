$(document).ready(function(){

    // hide all alerts
    $(".alert").hide();

    // check id
    $("#member_id").keyup(function(){
        let join_id = $("#member_id").val();
    });

    // check password
    // join2js 참고
    $("#member_pw").keyup(function(){
        let join_pw = $("#member_pw").val();
        let join_re_pw = $("#member_re_pw").val();

        if(join_pw != "" || join_re_pw != ""){
            if(join_pw == join_re_pw){
                $(".alert_success_pw").show();
                $(".alert_danger_pw").hide();
                $(".alert_diff_pw").hide();
                $(".alert_none_pw").hide();
            }else if(join_pw.length < 10 || join_re_pw.length < 10){
                $(".alert_success_pw").hide();
                $(".alert_danger_pw").show();
                $(".alert_diff_pw").hide();
                $(".alert_none_pw").hide();
            }else{
                $(".alert_success_pw").hide();
                $(".alert_danger_pw").hide();
                $(".alert_diff_pw").show();
                $(".alert_none_pw").hide();
            }
        }
    });

    // check email
});