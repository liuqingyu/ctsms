<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/coal/contract/">合同列表</a></li>
		<shiro:hasPermission name="coal:contract:edit"><li><a href="${ctx}/coal/contract/form">合同添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="contract" action="${ctx}/coal/contract/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>合同类型 ： </label>
        <form:select path="contractType">
            <form:options items="${fns:getDictList('contract_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
        </form:select>
        <label>合同编号 ： </label><form:input path="contractId" htmlEscape="false" maxlength="50" class="input-medium"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<tags:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>序号</th><th>合同类型</th><th>合同编号</th><th>供方</th><%--<th>需方</th>--%><th>签订日期</th><shiro:hasPermission name="coal:contract:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="contract">
			<tr>
				<td><a href="${ctx}/coal/contract/form?id=${contract.contractSid}">${contract.contractSid}</a></td>
				<td>${fns:getDictLabel(contract.contractType,'contract_type','')}</td>
                <td>${contract.contractId}</td>
                <td>${fncoal:getSupplyName(contract.supplyId)}</td>
                <%--<td>${fncoal:getDemandName(contract.demandId)}</td>--%>
                <td><fmt:formatDate value="${contract.signDate}" pattern="yyyy-MM-dd"/></td>
				<shiro:hasPermission name="coal:contract:edit"><td>
    				<a href="${ctx}/coal/contract/form?id=${contract.contractSid}">修改</a>
					<a href="${ctx}/coal/contract/delete?id=${contract.contractSid}" onclick="return confirmx('确认要删除该合同?', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
