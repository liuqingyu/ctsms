<%--//example....
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
//end example--%>

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
		<li><a href="${ctx}/coal/detailsLook">查看详细</a></li>
		<%--<li class="active"><a href="${ctx}/coal/contract/form?contractSid=${contract.contractSid}">合同<shiro:hasPermission name="coal:contract:edit">${not empty contract.contractSid?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="coal:contract:edit">查看</shiro:lacksPermission></a></li>--%>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="contract" action="${ctx}/coal/contract/save" method="post" enctype="multipart/form-data" class="form-horizontal">
		<form:hidden path="contractSid"/>
		<tags:message content="${message}"/>
        <table>
            <tr>
                <td colspan="2">
                    <div class="control-group">
                        <label class="control-label">合同编号 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">合同类型 ：</label>
						<u>${contract.contractType}</u>
                    </div>
                </td>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">签订日期 ：</label>
						<u>${contract.signDate}</u>
                    </div>
                </td>
			</tr>
			
			<tr>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">对方合同编号 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">供方名称 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">需方名称 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
			</tr>

			<tr>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">货款结算依据 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">货款路耗类型 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">货款路耗标准 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
			</tr>
			
			<tr>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">开票信息 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">是否含税 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">货款付款方式 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
			</tr>
			
			<tr>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">交货地点 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">运费付款方式 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">业务员 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
			</tr>
			
			<tr>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">备注 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
			</tr>

			<tr>
				<td colspan="2">
                    <div class="control-group">
                        <label class="control-label">附件 ：</label>
						<u>${contract.contractId}</u>
                    </div>
                </td>
			</tr>
        </table>
		<div class="control-group">
			<table id="contentTable0" class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>序号</th>
						<th>煤种名称</th>
						<th>发热量</th>
						<th>开票煤价</th>
						<th>合同煤价</th>
						<th>签订吨数</th>
						<th>签订金额</th>
						<th>启用时间</th>
						<th>状态</th>
						<th> </th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${page.list}" var="contract">
					<tr>
						<td><a href="${ctx}/coal/contract/form?id=${contract.contractSid}">${contract.contractSid}</a></td>
						<td>煤种名称</td>
						<td>发热量</td>
						<td>getSupplyName(开票煤价)</td>
						<td>getDemandName(合同煤价)</td>
						<td>签订吨数</td>
						<td>签订金额</td>
						<td>启用时间</td>
						<td>状态</td>
						<td> </td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		<form>
			<fieldset>
				<legend>化验指标</legend>
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th>序号</th>
								<th>化验项</th>
								<th>浮动方式</th>
								<th>下限值</th>
								<th>上限值</th>
								<th>浮动基数</th>
								<th>扣罚种类</th>
								<th>扣罚值</th>
								<th>扣罚值类型</th>
								<th>单位</th>
								<th>结算化验数据来源</th>
								<th>化验结果取值位数</th>
								<th>化验结果取值方式</th>
								<th>无化验结果取值方式</th>					
								<th>是否为子项</th>
								<th>父项号</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${page.list}" var="contract">
							<tr>
								<td><a href="#">contract.contractSid</a></td>
								<td><a href="#"><u>化验项</u></a></td>
								<td>getSupplyName(contract.浮动方式)</td>
								<td>getDemandName(contract.下限值)</td>
								<td>fncoal:上限值</td>
								<td>fncoal:浮动基数</td>
								<td>fncoal:扣罚种类</td>
								<td>fncoal:扣罚值</td>
								<td>fncoal:扣罚值类型</td>
								<td>fncoal:单位</td>
								<td>fncoal:结算化验数据来源</td>
								<td>化验结果取值位数</td>
								<td>化验结果取值方式</td>
								<td>无化验结果取值方式</td>					
								<td>是否为子项</td>
								<td>父项号</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
			</fieldset>
		</form>
		
		
		<div class="form-actions">
			<shiro:hasPermission name="coal:contract:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="关闭"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
