$(function () {
    $("#jqGrid").jqGrid({
        url:'/admin/about/list',
        datatype:"json",
        colModel:[
            {label: 'id', name: 'aboutId', index: 'aboutId', width: 50, key: true, hidden: true},
            {label: '标题',name: 'aboutTitle',index: 'aboutTitle',width: 120},
            {label: '排序值', name: 'aboutRank', index: 'aboutRank', width: 120},
            {label: '创建时间', name: 'subTime', index: 'subTime', width: 120},
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

    /**
     * 添加介绍
     */
    function addAbout() {
        window.location.href = "/admin/about/edit";
    }
    
    function aboutEdit() {

    }
    
    function aboutDelete() {

    }
});