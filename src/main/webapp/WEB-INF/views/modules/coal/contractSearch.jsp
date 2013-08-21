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
		<li><a href="${ctx}/coal/contract/search">合同查询</a></li>
		<%--<li class="active"><a href="${ctx}/coal/contract/form?contractSid=${contract.contractSid}">合同<shiro:hasPermission name="coal:contract:edit">${not empty contract.contractSid?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="coal:contract:edit">查看</shiro:lacksPermission></a></li>--%>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="contract" action="${ctx}/coal/contract/save" method="post" enctype="multipart/form-data" class="form-horizontal">
		<form:hidden path="contractSid"/>
		<tags:message content="${message}"/>
		
		<div style="background-color:blue">
			<tr>
				<td>
					<label class="control-label">请选择</label>
					<%--<div class="controls">--%>
						<%--<form:select path="查询方案">--%>
							<%--<form:options items="$(fns:getDictList('contract_type'))" itemLabel="label" itemValue="value" htmlEscape="false"/>--%>
						<%--</form:select>--%>
					<%--</div>--%>
				</td>
				<td>
					<%--<div class="control-group">--%>
                        <%--<label class="control-label">请输入查询方案内容 ：</label>--%>
                        <%--<div class="controls">--%>
                            <%--<form:input path="contractId" htmlEscape="false" maxlength="100" class="required"/>--%>
                        <%--</div>--%>
                    </div>
				</td>
				<td>
					<label class="control-label">合同类型</label>
					<%--<div class="controls">--%>
						<%--<form:select path="查询方案">--%>
							<%--<form:options items="$(fns:getDictList('contract_type'))" itemLabel="label" itemValue="value" htmlEscape="false"/>--%>
						<%--</form:select>--%>
					<%--</div>--%>
				</td>
				<td>
					<label class="control-label">执行中</label>
					<%--<div class="controls">--%>
						<%--<form:select path="查询方案">--%>
							<%--<form:options items="$(fns:getDictList('contract_type'))" itemLabel="label" itemValue="value" htmlEscape="false"/>--%>
						<%--</form:select>--%>
					<%--</div>--%>
				</td>
				<td>
					<label class="control-label">物料名称</label>
					<%--<div class="controls">--%>
						<%--<form:select path="查询方案">--%>
							<%--<form:options items="$(fns:getDictList('contract_type'))" itemLabel="label" itemValue="value" htmlEscape="false"/>--%>
						<%--</form:select>--%>
					<%--</div>--%>
				</td>
				<td>
                    <div class="control-group">
                        <label class="control-label">签订日期范围</label>
                        <div class="controls">
                            <input id="signDate" name="signDate" type="text" readonly="readonly" class="Wdate input-medium"
                                   value="<fmt:formatDate value="${contract.signDate}" pattern="yyyy-MM-dd"/>"
                                   onClick="WdatePicker()" class="required"/>
                        </div>
                    </div>
                </td>
				<td>
                    <div class="control-group">
                        <label class="control-label">至</label>
                        <div class="controls">
                            <input id="signDate" name="signDate" type="text" readonly="readonly" class="Wdate input-medium"
                                   value="<fmt:formatDate value="${contract.signDate}" pattern="yyyy-MM-dd"/>"
                                   onClick="WdatePicker()" class="required"/>
                        </div>
                    </div>
                </td>
			</tr>
			<tr>
				<td>
					<shiro:hasPermission name="coal:contract:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;</shiro:hasPermission>
				</td>
				<td>
					<shiro:hasPermission name="coal:contract:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="其它操作"/>&nbsp;</shiro:hasPermission>
				</td>
			</tr>
		</div>
		
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th>序号</th>
					<th><input type="checkbox" name="Bike"></th>
					<shiro:hasPermission name="coal:contract:edit"><th>操作</th></shiro:hasPermission>
					<th>签订日期</th>
					<th>查看煤价</th>
					<th>供方名称</th>
					<th>需方名称</th>
					<th>物料名称</th>
					<th>规格型号</th>
					<th>物料价格</th>
					<th>付款余款</th>
					<th>运煤吨数</th>
					<th>剩余吨数</th>
					<th>发货地点</th>
					<th>业务员</th>
					<th>审核状态</th>					
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="contract">
				<tr>
					<td><a href="${ctx}/coal/contract/form?id=${contract.contractSid}">${contract.contractSid}</a></td>
					<td><input type="checkbox" name="Bike"></td>
					<shiro:hasPermission name="coal:contract:edit"><td>
						<a href="$(ctx)/coal/contract/form?id=$(contract.xiangci)">查看详细</a>
						<a href="${ctx}/coal/contract/form?id=${contract.contractSid}">修改</a>
						<a href="${ctx}/coal/contract/delete?id=${contract.contractSid}" onclick="return confirmx('确认要删除该合同?', this.href)">删除</a>
					</td></shiro:hasPermission>
					<td><fmt:formatDate value="${contract.signDate}" pattern="yyyy-MM-dd"/></td>
					<td><a href="#"><u>查看煤价</u></a></td>
					<td>me(contract.supplyId)</td>
					<td>getDemandName(contract.demandId)</td>
					<td>物料名称</td>
					<td>规格型号</td>
					<td>物料价格</td>
					<td>付款余款</td>
					<td>运煤吨数</td>
					<td>剩余吨数</td>
					<td>:发货地点</td>
					<td>:业务员</td>
					<td>审核状态 == "已审核" ? 已审核 ：<div style="color:red">未审核</div></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
        
		<div class="form-actions">
			<shiro:hasPermission name="coal:contract:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
