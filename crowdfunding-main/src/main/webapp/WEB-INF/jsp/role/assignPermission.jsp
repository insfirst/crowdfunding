<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/main.css">
    <link rel="stylesheet" href="${APP_PATH}/css/doc.min.css">
    <link rel="stylesheet" href="${APP_PATH}/ztree/zTreeStyle.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 角色维护</a></div>
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
                <div class="panel-heading"><i class="glyphicon glyphicon-th-list"></i> 权限分配列表<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                <div class="panel-body">
                    <button id="assignPermissionBtn" class="btn btn-success">分配许可</button>
                    <br><br>
                    <ul id="treeDemo" class="ztree"></ul>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">帮助</h4>
            </div>
            <div class="modal-body">
                <div class="bs-callout bs-callout-info">
                    <h4>没有默认类</h4>
                    <p>警告框没有默认类，只有基类和修饰类。默认的灰色警告框并没有多少意义。所以您要使用一种有意义的警告类。目前提供了成功、消息、警告或危险。</p>
                </div>
                <div class="bs-callout bs-callout-info">
                    <h4>没有默认类</h4>
                    <p>警告框没有默认类，只有基类和修饰类。默认的灰色警告框并没有多少意义。所以您要使用一种有意义的警告类。目前提供了成功、消息、警告或危险。</p>
                </div>
            </div>
            <!--
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
            -->
        </div>
    </div>
</div>
<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/script/docs.min.js"></script>
<script src="${APP_PATH}/ztree/jquery.ztree.all-3.5.min.js"></script>
<script src="${APP_PATH }/jquery/layer/layer.js"></script>
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

        var setting = {
            check : {
                enable : true
            },
            view: {
                selectedMulti: false,
                addDiyDom: function(treeId, treeNode){
                    var icoObj = $("#" + treeNode.tId + "_ico"); // tId = permissionTree_1, $("#permissionTree_1_ico")
                    var aObj = $("#" + treeNode.tId + "_a"); // tId = permissionTree_1, ==> $("#permissionTree_1_a")
                    aObj.removeAttr("target");//删除target属性
                    aObj.attr("href", "javascript:void(0);");//取消当前链接事件
                    if ( treeNode.icon ) {
                        icoObj.removeClass("button ico_docu ico_open").addClass(treeNode.icon).css("background","");
                    }
                },
            },
            async: {
                enable: true,
                url:"${APP_PATH}/role/loadDataAsync.do?roleid=${param.roleid}",
                autoParam:["id", "name=n", "level=lv"]
            },
            callback: {
                onClick : function(event, treeId, json) {

                }
            }
        };
        $.fn.zTree.init($("#treeDemo"), setting); //异步访问数据

        // var d = [{"id":1,"pid":0,"seqno":0,"name":"系统权限菜单","url":null,"icon":"fa fa-sitemap","open":true,"checked":false,"children":[{"id":2,"pid":1,"seqno":0,"name":"控制面板","url":"dashboard.htm","icon":"fa fa-desktop","open":true,"checked":false,"children":[]},{"id":6,"pid":1,"seqno":1,"name":"消息管理","url":"message/index.htm","icon":"fa fa-weixin","open":true,"checked":false,"children":[]},{"id":7,"pid":1,"seqno":1,"name":"权限管理","url":"","icon":"fa fa-cogs","open":true,"checked":false,"children":[{"id":8,"pid":7,"seqno":1,"name":"用户管理","url":"user/index.htm","icon":"fa fa-user","open":true,"checked":false,"children":[]},{"id":9,"pid":7,"seqno":1,"name":"角色管理","url":"role/index.htm","icon":"fa fa-graduation-cap","open":true,"checked":false,"children":[]},{"id":10,"pid":7,"seqno":1,"name":"许可管理","url":"permission/index.htm","icon":"fa fa-check-square-o","open":true,"checked":false,"children":[]}]},{"id":11,"pid":1,"seqno":1,"name":"资质管理","url":"","icon":"fa fa-certificate","open":true,"checked":false,"children":[{"id":12,"pid":11,"seqno":1,"name":"分类管理","url":"cert/type.htm","icon":"fa fa-th-list","open":true,"checked":false,"children":[]},{"id":13,"pid":11,"seqno":1,"name":"资质管理","url":"cert/index.htm","icon":"fa fa-certificate","open":true,"checked":false,"children":[]}]},{"id":15,"pid":1,"seqno":1,"name":"流程管理","url":"process/index.htm","icon":"fa fa-random","open":true,"checked":false,"children":[]},{"id":16,"pid":1,"seqno":1,"name":"审核管理","url":"","icon":"fa fa-check-square","open":true,"checked":false,"children":[{"id":17,"pid":16,"seqno":1,"name":"实名认证人工审核","url":"process/cert.htm","icon":"fa fa-check-circle-o","open":true,"checked":false,"children":[]}]}]}];
        // $.fn.zTree.init($("#treeDemo"), setting, d);
    });
    $("#assignPermissionBtn").click(function () {
        alert(1);
        var jsonObj={
            roleid:${param.roleid}
        };
        var treeObj=$.fn.zTree.getZTreeObj("treeDemo");
        var checkedNodes=treeObj.getCheckedNodes(true);
        $.each(checkedNodes,function (i,n) {
            jsonObj["ids["+i+"]"]=n.id;
        });
        if(checkedNodes.length==0){
            layer.msg("请选择分配许可，至少分配一个许可！",{time:1000,icon:5,shift:6});
        }else{
            var loadingIndex=-1;
            $.ajax({
                type:"post",
                url:"${APP_PATH}/role/doAssignPermission.do",
                data:jsonObj,
                beforeSend:function () {
                    loadingIndex=layer.msg("正在分配许可...",{icon:16});
                    return true;
                },
                success:function (result) {
                    layer.close(loadingIndex);
                    if(result.success){
                        layer.msg("分配成功！",{time:1000,icon:6});
                    }else{
                        layer.msg("分配出错",{time:1000,icon:5,shift:6});
                    }
                },
                error:function () {
                    layer.msg("分配许可失败",{time:1000,icon:5,shift:6});

                }

            });
        }
    });
</script>
</body>
</html>
