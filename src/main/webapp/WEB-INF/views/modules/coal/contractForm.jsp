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
		<li><a href="${ctx}/coal/contract/form">煤矿合同录入</a></li>
		<%--<li class="active"><a href="${ctx}/coal/contract/form?contractSid=${contract.contractSid}">合同<shiro:hasPermission name="coal:contract:edit">${not empty contract.contractSid?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="coal:contract:edit">查看</shiro:lacksPermission></a></li>--%>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="contract" action="${ctx}/coal/contract/save" method="post" enctype="multipart/form-data" class="form-horizontal">
		<form:hidden path="contractSid"/>
		<tags:message content="${message}"/>
        <table>
            <tr>
                <td colspan="2">
                    <div class="control-group">
                        <label class="control-label">合同类型 ：</label>
                        <div class="controls">
                            <form:select path="contractType">
                                <form:options items="${fns:getDictList('contract_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                            </form:select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="control-group">
                        <label class="control-label">合同编号 ：</label>
                        <div class="controls">
                            <form:input path="contractId" htmlEscape="false" maxlength="100" class="required"/>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">签订日期 ：</label>
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
                    <div class="control-group">
                        <label class="control-label">供方名称 ：</label>
                        <div class="controls">
                            <tags:commonselect id="supplyId" name="supplyId" value="${contract.supplyId}" labelName="supplyName" labelValue="Provider of mine"
                                               title="供方" url="${ctx}/coal/supply/findByName"/>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">需方名称 ：</label>
                        <div class="controls">
                            <%--<tags:commonselect id="demandId" name="demandId" value="12345678&lt;%&ndash;${contract.demandId}&ndash;%&gt;" labelName="demandName" labelValue="12345678&lt;%&ndash;${fncoal:getDemandName(contract.demandId)}&ndash;%&gt;"--%>
                                               <%--title="需方" url="${ctx}/coal/demand/findByName"/>--%>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <%--<td>
                    <div class="control-group">
                        <label class="control-label">煤种 ：</label>
                        <div class="controls">
                            <form:select path="coalType">
                                <form:options items="${fns:getDictList('coal_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                            </form:select>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">质量(热卡) ：</label>
                        <div class="controls">
                            <form:input path="calorie" htmlEscape="false" maxlength="100" class="required number"/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="control-group">
                        <label class="control-label">数量(吨) ：</label>
                        <div class="controls">
                            <form:input path="number" htmlEscape="false" maxlength="100" class="required number"/>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">金额(元) ：</label>
                        <div class="controls">
                            <form:input path="amount" htmlEscape="false" maxlength="100" class="required number"/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="control-group">
                        <label class="control-label">执行单价 ：</label>
                        <div class="controls">
                            <form:input path="price" htmlEscape="false" maxlength="100" class="required number"/>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">交货地点 ：</label>
                        <div class="controls">
                            <form:input path="deliveryPlace" htmlEscape="false" maxlength="100" class="required"/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="control-group">
                        <label class="control-label">是否含税 ：</label>
                        <div class="controls">
                            <form:select path="taxFlag">
                                <form:options items="${fns:getDictList('tax_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                            </form:select>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">结算方式 ：</label>
                        <div class="controls">
                            <form:select path="payMode">
                                <form:options items="${fns:getDictList('pay_mode')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                            </form:select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="control-group">
                        <label class="control-label">运输类型 ：</label>
                        <div class="controls">
                            <form:select path="transType">
                                <form:options items="${fns:getDictList('trans_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                            </form:select>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">结算类型 ：</label>
                        <div class="controls">
                            <form:select path="payType">
                                <form:options items="${fns:getDictList('pay_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                            </form:select>
                        </div>
                    </div>
                </td>--%>
            </tr>
            <%--<tr>
                <td>
                    <div class="control-group">
                        <label class="control-label">合同生效时间 ：</label>
                        <div class="controls">
                            <input id="startDate" name="startDate" type="text" readonly="readonly" class="Wdate input-medium"
                                   value="<fmt:formatDate value="${contract.startDate}" pattern="yyyy-MM-dd"/>"
                                   onClick="WdatePicker()" class="required"/>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">合同到期时间 ：</label>
                        <div class="controls">
                            <input id="endDate" name="endDate" type="text" readonly="readonly" class="Wdate input-medium"
                                   value="<fmt:formatDate value="${contract.endDate}" pattern="yyyy-MM-dd"/>"
                                   onClick="WdatePicker()" class="required"/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="control-group">
                        <label class="control-label">备注 ：</label>
                        <div class="controls">
                            <form:textarea path="remarks" htmlEscape="false" maxlength="100" class="input-block-level"/>
                        </div>
                    </div>
                </td>
            </tr>--%>
            <%--<c:if test ="${not empty contract.files}">
                <tr>
                    <td  colspan="3">
                        <div class="control-group">
                            <label class="control-label">项目文件:</label>
                            <div class="controls">
                                <ul style="list-style-type: none;margin-left:0;">
                                    <c:forEach items="${contract.files}" var="file">
                                        <li id ="file${file.id}">
                                            <a href='${ctx}/coal/contract/delFile?id=<c:out value="${file.id}"/>&prjId=${contract.contractSid}'/><span class="btn">删 除</span></a>&nbsp;&nbsp;
                                            <a href='${ctx}/coal/file/download?url=<c:out value="${file.fileUrl}"/>&fileName="${file.fileName}"'>${file.fileName}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>

                    </td>
                </tr>
            </c:if>--%>
            <%--<tr>
                <td  colspan="2">
                    <div class="control-group">
                        <label class="control-label">上传文件:</label>
                        <div class="controls">
                            <table>
                                <tr>
                                    <td> <input type="button" name="files" onclick="add(count++)" value="添加文件"/> <strong style="color: blue">温馨提示：上传文件的总大小不能超过 20M！</strong></td>
                                </tr>
                                <tr>
                                    <table id="fileUploadTable">
                                    </table>
                                </tr>
                            </table>
                        </div>
                    </div>
                    </div>

                </td>
            </tr>--%>
        </table>
		<div class="form-actions">
			<shiro:hasPermission name="coal:contract:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
