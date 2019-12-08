<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/main.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        table tbody tr:nth-child(odd){background:#F4F4F4;}
        table tbody td:nth-child(even){color:#C00;}
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 广告管理</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <%@ include file="/WEB-INF/jsp/common/top.jsp" %>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="/WEB-INF/jsp/common/menu.jsp"></jsp:include>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input class="form-control has-success" id="queryText" type="text" placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button type="button" id="queryBtn" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
                    </form>
                    <button type="button" id="deleteByIdsBtn" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
                    <button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='${APP_PATH}/advert/toAdd.htm'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr >
                                <th width="30">#</th>
                                <th width="30"><input id="allCheckbox" type="checkbox"></th>
                                <th>广告描述</th>
                                <th>状态</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%--
                            <tr>
                                <td>1</td>
                                <td>XXXXXXXXXXXX商品广告</td>
                                <td>未审核</td>
                                <td>
                                    <button type="button" class="btn btn-success btn-xs"><i class="glyphicon glyphicon-check"></i></button>
                                    <button type="button" class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-pencil"></i></button>
                                    <button type="button" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i></button>
                                </td>
                            </tr>
                            --%>
                            </tbody>
                            <tfoot>
                            <tr >
                                <td colspan="4" align="center">
                                    <ul class="pagination">
                                        <%--
                                        <li class="disabled"><a href="#">上一页</a></li>
                                        <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#">下一页</a></li>
                                        --%>
                                    </ul>
                                </td>
                            </tr>

                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/script/docs.min.js"></script>
<script src="${APP_PATH}/script/menu.js"></script>
<script src="${APP_PATH}/jquery/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        $(".list-group-item").click(function(){
            if ( $(this).find("ul") ) {
                $(this).toggleClass("tree-closed");
                if ( $(this).hasClass("tree-closed") ) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });
        showMenu();
        onPage(1);

    });
    $("#queryBtn").click(function(){
        jsonObj.queryText=$("#queryText").val();
        onPage(1);
    });
    var jsonObj={
        "pageno":1
    };
    function onPage(pageno){
        jsonObj.pageno=pageno;
        var loadingIndex=-1;
        $.ajax({
            url:"${APP_PATH}/advert/doIndex.do",
            type:"post",
            data:jsonObj,
            beforeSend:function(){
               loadingIndex=layer.msg('数据加载中', {icon: 16})
                return true;
            },
            success:function(result){
                layer.close(loadingIndex);
                if(result.success){
                    var page=result.page;
                    var data=page.data;
                    var content='';
                    $.each(data,function(i,n){
                        content+='<tr>';
                        content+='	<td>'+(i+1)+'</td>';
                        content+='	<td><input type="checkbox" id="'+n.id+'"></td>';
                        content+='	<td>'+n.name+'</td>';
                        content+='	<td>'+onStatus(n.status)+'</td>';
                        content+='	<td>';
                        content+='	    <button type="button" class="btn btn-success btn-xs"><i class="glyphicon glyphicon-check"></i></button>';
                        content+='	    <button type="button" class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-pencil"></i></button>';
                        content+='	    <button type="button" onclick="deleteAdvert('+n.id+',\''+n.name+'\')" class="btn btn-danger btn-xs"><i class="glyphicon glyphicon-remove"></i></button>';
                        content+='	</td>';
                        content+='</tr>';
                    });
                    $("tbody").html(content);
                    var contentBar='';
                    if(page.pageno==1){
                        contentBar+='<li class="disabled"><a>上一页</a></li>';
                    }else{
                        contentBar+='<li><a onclick="onPage('+(page.pageno-1)+')">上一页</a></li>';
                    }
                    for(var i=1;i<=page.totalno;i++){
                        contentBar+='<li';
                        if(page.pageno==i){
                            contentBar+=' class="active"';
                        }
                        contentBar+='><a onclick="onPage('+i+')">'+i+'<span class="sr-only"></span></a></li>';
                    }
                    if(page.pageno==page.totalno){
                        contentBar+='<li class="disabled"><a >下一页</a></li>';
                    }else{
                        contentBar+='<li><a onclick="onPage('+(page.pageno+1)+')">下一页</a></li>';
                    }
                    $(".pagination").html(contentBar);
                }else{
                    layer.msg(result.message, {time:1000, icon:5, shift:6});
                }
            },
            error:function(){
                layer.msg("查询失败！", {time:1000, icon:5, shift:6});
            }
        });


    }
    /*
        0 - 草稿， 1 - 未审核， 2 - 审核完成， 3 - 发布
        */
    var statusName='';
    function onStatus(status){
        switch (status) {
            case "0":
                statusName="草稿";
                break;
            case "1":
                statusName="未审核";
                break;
            case "2":
                statusName="审核完成";
                break;
            case "3":
                statusName="发布";
                break;
        }
        return statusName;
    }
    function deleteAdvert(id,name){
        var loadingIndex=-1;
        layer.confirm("确认要删除["+name+"]用户吗？",  {icon: 3, title:'提示'}, function(cindex){
            layer.close(cindex);
            $.ajax({
                url: "${APP_PATH}/advert/doDelete.do",
                type: "post",
                data:{
                    "id":id
                },
                beforeSend:function(){
                    loadingIndex=layer.msg('删除中', {icon: 16});
                    return true;
                },
                success: function(result){
                    layer.close(loadingIndex);
                    if(result.success){
                        window.location.href="${APP_PATH}/advert/index.htm";
                    }else{
                        layer.msg(result.message, {time:1000, icon:5, shift:6});
                    }
                },
                error: function(){
                    layer.msg("删除失败！", {time:1000, icon:5, shift:6});
                }
            });
        }, function(cindex){
            layer.close(cindex);
        });

    }
    $("#allCheckbox").click(function () {
        var checkStatus=this.checked;
        $("tbody tr  input[type='checkbox']").prop("checked",checkStatus);
    });
    $("#deleteByIdsBtn").click(function () {
       var checkedBox=$("tbody tr input:checked");
        if(checkedBox.length==0){
            layer.msg("至少选中一个进行删除！", {time:1000, icon:5, shift:6});
            return false;
        }
       var ids=[];
        $.each(checkedBox,function(i,n){
            ids.push(n.id);
        });
        layer.confirm("确认要删除这些广告吗？",  {icon: 3, title:'提示'}, function(cindex) {
            layer.close(cindex);
            var loadingIndex=-1;
            $.ajax({
                url:"${APP_PATH}/advert/doDeleteByIds.do",
                type:"post",
                data:{
                    "ids":ids
                },
                traditional:true,
                beforeSend:function(){
                    loadingIndex=layer.msg('删除中', {icon: 16});
                    return true;
                },
                success:function(result){
                    layer.close(loadingIndex);
                    if (result.success){
                        window.location.href="${APP_PATH}/advert/index.htm";
                    }else{
                        layer.msg(result.message, {time:1000, icon:5, shift:6});
                    }
                },
                error:function(){
                    layer.msg("删除失败！", {time:1000, icon:5, shift:6});
                }

            });
        })

    });
</script>
</body>
</html>

