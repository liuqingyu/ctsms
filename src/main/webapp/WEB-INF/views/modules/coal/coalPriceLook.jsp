//example....
<%--
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript"> 
$(document).ready(function(){
$(".flip").click(function(){
    $(".panel").slideToggle("slow");
  });
});
</script>
 
<style type="text/css"> 
div.panel,p.flip
{
margin:0px;
padding:5px;
text-align:center;
background:#e5eecc;
border:solid 1px #c3c3c3;
}
div.panel
{
height:120px;
display:none;
}
</style>
</head>
 
<body>
 
<div class="panel">
<p>W3School - 领先的 Web 技术教程站点</p>
<p>在 W3School，你可以找到你所需要的所有网站建设教程。</p>
</div>
 
<p class="flip">请点击这里</p>
 
</body>
--%>
//end example

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误,请更正!");
					if (element.is(":checkbox")||element.is(":radio")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
        var count = 0;
        function add(type) {
            $("table#fileUploadTable").append("<tr id ='fileData" + type + "'><td><input class='btn' type='button' value='删 除' onclick='return remove(" + type + ");'/><input type='file' value='' name ='fileData[" + type + "]' class = 'required validatfile'/></td></tr>");
        }
        function remove(type) {
            $("#fileData" + type).remove();
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/coal/coalPriceLook"> 查看煤价</a></li>
		<%--<li class="active"><a href="${ctx}/coal/contract/form?contractSid=${contract.contractSid}">合同<shiro:hasPermission name="coal:contract:edit">${not empty contract.contractSid?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="coal:contract:edit">查看</shiro:lacksPermission></a></li>--%>
	</ul><br/>
	<%--<form:form id="inputForm" modelAttribute="contract" action="${ctx}/coal/contract/save" method="post" enctype="multipart/form-data" class="form-horizontal">--%>
    <form:form id="inputForm" modelAttribute="coalPrice" action="${ctx}/coal/coalPrice/save" method="post" class="form-horizontal">
        <form:hidden path="coalPriceId"/>
		<tags:message content="${message}"/>
		<div class="control-group">
			<table id="contentTable" class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>物料名称</th>
						<th>规格型号</th>
						<th>当前价格</th>
						<th>生效日期</th>
						<th>执行状态</th>						
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="contract">
					<tr>
						<%--<td><a href="${ctx}/coal/contract/form?id=${contract.contractSid}">${contract.contractSid}</a></td>--%>
						<td>${coalPrice.name}<%--煤种名称--%></td>
						<td>${coalPrice.coalTypeId}<%--规格型号--%></td>
						<td>${coalPrice.coalPrice}<%--当前价格--%></td>
						<td>${coalPrice.stsDate}<%--生效日期--%></td>
						<td>${coalPrice.sts}<%--执行状态--%></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>		
		
		<div class="form-actions">
			<shiro:hasPermission name="coal:contract:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="关闭"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
