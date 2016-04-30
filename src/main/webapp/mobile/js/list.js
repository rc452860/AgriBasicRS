/**
 * Created by rc452 on 2016/4/27.
 */
$(function () {

    $("#ctrall").click(function () {
        $(".ctr").attr("checked", $(this).attr("checked") != null);
    })
    window.Delete = function(id) {/*删除脚本*/
        if(confirm("你确定要删除吗？")) {
            $.ajax({
                cache: false,
                type: "POST",
                url: window.deleteUrl, /*此处需修改*/
                data: {'id': id},
                async: false,
                error: function (XMLHttpRequest) {
                    alert("error:" + XMLHttpRequest.status);
                },
                success: function (data) {
                    if (data.message != null) alert(data.message);
                    /*if(data.url != null) window.location.href = data.url;*/
                    if (data.message == "删除成功")
                        window.location.reload();
                }
            });
        }
    }
    window.DeleteMulit = function() {
        var arr = new Array();
        $(".ctr:checked").each(function () {
            arr.push($(this).val())
        });
        if(confirm("你确定要删除吗？")) {
            $.ajax({
                cache: false,
                type: "POST",
                url: window.deleteMulUrl, /*此BV处需修改*/
                data: {ids: arr},
                async: false,
                error: function (XMLHttpRequest) {
                    alert("error:" + XMLHttpRequest.status);
                },
                success: function (data) {
                    if (data.message != null) alert(data.message);
                    /*if(data.url != null) window.location.href = data.url;*/
                    if (data.message == "删除成功")
                        window.location.reload();
                }
            });
        }
    }

    window.dialog = function(url){
        //弹窗添加原型带写
        if($("#dd").length<=0)
            $("body").append("<div id='dd'><iframe width='100%' height='100%' id='df' src=''></iframe> </div>");
        $("#df").attr("src",url);
        $("#dd").dialog({
            title: '添加',
            width: 800,
            height: 600,
            closed: false,
            cache: false,
            modal: true
        })
    }
})