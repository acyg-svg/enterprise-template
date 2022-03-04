$(function () {
    $("#jqGrid").jqGrid({
        url:'/admin/announcement/list',
        datatype:"json",
        colModel:[
            {label: 'id', name: 'announcementId', index: 'announcementId', width: 50, key: true, hidden: true},
            {label: '公告内容', name: 'content', index: 'content', width: 120},
            {label: '创建时间', name: 'uptime', index: 'uptime', width: 120}
        ],
        height: 560,
        rowNum: 10,
        rowList: [10, 20, 50],
        styleUI: 'Bootstrap',
        loadtext: '信息读取中',
        rownumbers: false,
        rownumWidth: 20,
        autowidth: true,
        multiselect: true,
        pager:"#jqGridPager",
        jsonReader:{
            root: "data.list",
            page: "data.currPage",
            total: "data.totalPage",
            records: "data.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order",
        },
        gridComplete: function () {
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x":"hidden"});
        }
    });

    $(window).resize(function () {
        $("#jqGrid").setGridWidth($(".card-body").width());
    });

});

function announcementAdd() {
    reset();
    $('.modal-title').html('公告添加');
    $('#announcementModal').modal('show');
}

function announcementEdit() {
    reset();
    var id = getSelectedRow();
    if (id == null){
        return;
    }
    var rowData = $("#jqGrid").jqGrid("getRowData",id);
    $('.modal-title').html('公告编辑');
    $('#announcementModal').modal('show');
    $("#announcementId").val(id);
    $("#content").val(rowData.content);
}

function reload() {
    var page = $("#jqGrid").jqGrid('getGridParam','page');
    $("#jqGrid").jqGrid('setGridParam',{
        page:page
    }).trigger("reloadGrid");
}

$('#saveButton').click(function () {
    var content = $("#content").val();
    if (isNull(content)){
        $('#edit-error-msg').css("display","block");
        $('#edit-error-msg').html("请完善公告信息！");
    }else {
        var data = {
            "content":content
        };
        var url = '/admin/announcement/save';
        var id = getSelectedRowWithoutAlert();
        if (id !=null){
            url = '/admin/announcement/update';
            data = {
                "announcementId":id,
                "content":content
            };
        }
        $.ajax({
            type:'POST',
            url: url,
            contentType: 'application/json',
            data:JSON.stringify(data),
            success :function (result) {
                if (result.resultCode == 200){
                    $('#announcementModal').modal('hide');
                    swal("保存成功",{
                        icon:"success",
                    });
                    reload();
                }else {
                    $('#announcementModal').modal('hide');
                    swal(result.message,{
                        icon: "error",
                    });
                }
                ;
            },
            error:function () {
                swal("操作失败",{
                    icon: "error",
                });
            }
        });
    }
})

/**
 * 删除
 */
function deleteAnnouncement() {
    var ids = getSelectedRows();
    if (ids == null){
        return;
    }
    swal({
        title: "确认弹框",
        text: "确认要删除数据吗？",
        icon: "warning?",
        buttons: true,
        dangerMode: true
    }).then((flag) => {
        if (flag) {
            $.ajax({
                type: "POST",
                url: "/admin/announcement/delete",
                contentType: "application/json",
                data: JSON.stringify(ids),
                success: function (r) {
                    if (r.resultCode == 200) {
                        swal("删除成功", {
                            icon: "success",
                        });
                        $('#jqGrid').trigger("reloadGrid");
                    } else {
                        swal(r.message, {
                            icon: "error",
                        });
                    }
                }
            });
        }
    }
    )
    ;
}

function reset() {
    $("#content").val('');
    $('#edit-error-msg').css("display","none")
}