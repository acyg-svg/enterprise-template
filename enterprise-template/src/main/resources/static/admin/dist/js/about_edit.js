var editorD;

$(function () {

    //富文本编辑器 用于商品详情编辑
    const E = window.wangEditor;
    editorD = new E('#wangEditor')
    // 设置编辑区域高度为 750px
    editorD.config.height = 750

    editorD.create();
})

$('#saveButton').click(function () {
    var aboutId = $('#aboutId').val();
    var aboutTitle = $('#aboutTitle').val();
    var aboutRank = $('#aboutRank').val();
    var aboutContent = editorD.txt.html();
    console.log(aboutId)

    if (isNull(aboutTitle)){
        swal("请输入标题",{
            icon: "error",
        });
        return;
    }
    if (isNull(aboutRank)){
        swal("请输入排序值",{
            icon: "error",
        });
        return;
    }
    if (isNull(aboutContent)){
        swal("请输入介绍内容",{
            icon: "error",
        });
        return;
    }

    if (aboutId > 0){
        var url = '/admin/about/update';
        var swlMessage = '修改成功';
        var data = {
            "aboutId":aboutId,
            "aboutTitle":aboutTitle,
            "aboutRank":aboutRank,
            "aboutContent":aboutContent
        };
    }else {
         url = '/admin/about/save';
         swlMessage = '保存成功';
         data = {
            "aboutTitle":aboutTitle,
            "aboutRank":aboutRank,
            "aboutContent":aboutContent
        };
    }

    $.ajax({
        type:'POST',
        url:url,
        contentType:'application/json',
        data: JSON.stringify(data),
        success:function (result) {
            if (result.resultCode == 200){
                swal({
                    title: swlMessage,
                    type: 'success',
                    showCancelButton: false,
                    confirmButtonColor: '#1baeae',
                    confirmButtonText: '返回介绍列表',
                    confirmButtonClass: 'btn btn-success',
                    buttonsStyling: false
                }).then(function () {
                    window.location.href = "/admin/aboutpage";
                })
            }else {
                swal(result.message,{
                    icon: "error",
                });
            }
            ;
        },
        error: function () {
            swal("操作失败",{
                icon:"error",
            });
        }
    });
});

$('#cancelButton').click(function () {
    window.location.href = "/admin/aboutpage";
});
