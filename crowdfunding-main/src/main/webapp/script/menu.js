function showMenu() {
	//获取项目路径
	var pathname = window.location.pathname;
	var contextPath = "${APP_PATH}";
	//截取获得当前访问controller路径
	var path = pathname.substring(contextPath.length)
	var alink = $(".list-group a[href*='" + path + "']");
	alink.css("color", "red");
	alink.parent().parent().parent().removeClass("tree-closed")
	alink.parent().parent().show();
}