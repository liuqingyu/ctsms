<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML>
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
        <li><a href="${ctx}/coal/contract/saleContract">销售合同录入</a></li>
        <%--<li class="active"><a href="${ctx}/coal/contract/purchaseForm?contractSid=${contract.contractSid}">采购合同<shiro:hasPermission name="coal:contract:edit">${not empty contract.contractSid?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="coal:contract:edit">查看</shiro:lacksPermission></a></li>--%>
    </ul><br/>
    <form:form id="inputForm" modelAttribute="contract" action="${ctx}/coal/contract/save" method="post" enctype="multipart/form-data" class="form-horizontal">
    <form:hidden path="contractSid"/>
    <tags:message content="${message}"/>

    <form>
        <fieldset>
            <legend>基本信息</legend>
            <tr>
                <td colspan="1">
                    <div class="control-group">
                        <label class="control-label"><span style="color:#ff0000">*</span>合同编号：</label>
                        <div class="controls">
                            <input type="text" />
                        </div>
                    </div>
                </td>
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
                <td colspan="2">
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
                        <label class="control-label">对方合同号 ：</label>
                        <div class="controls">
                            <input id="contractOId" name="contractOId" type="text" readonly="readonly" <%--class="Wdate input-medium"--%>
                                   value="${contract.contractOId}" onClick="WdatePicker()" class="required"/>
                        </div>
                    </div>
                </td>
                <td colspan="2">
                    <div class="control-group">
                        <label class="control-label"><span style="color:#ff0000">*</span>供方名称 ：</label>
                        <div class="controls">
                            <input id="supplyId" name="supplyId" type="text" readonly="readonly" <%--class="Wdate input-medium"--%>
                                   value="${contract.supplyId}" onClick="WdatePicker()" class="required"/>
                        </div>
                    </div>
                </td>
                <td colspan="2">
                    <div class="control-group">
                        <label class="control-label"><span style="color:#ff0000">*</span>需方名称 ：</label>
                        <div class="controls">
                            <input id="contractOId" name="contractOId" type="text" readonly="readonly" <%--class="Wdate input-medium"--%>
                                   value="${contract.contractOId}" onClick="WdatePicker()" class="required"/>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <%--<td colspan="2">--%>
                    <%--<div class="control-group">--%>
                        <%--<label class="control-label">货款结算依据 ：</label>--%>
                        <%--<div class="controls">--%>
                            <%--<form:select path="hasPaied">--%>
                                <%--<form:options items="${fns:getDictList('has_paied')}" itemLabel="label" itemValue="value" htmlEscape="false"/>--%>
                            <%--</form:select>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</td>--%>
                <td colspan="2">
                    <div class="control-group">
                        <label class="control-label">货款路耗类型 ：</label>
                        <div class="controls">
                            <form:select path="lossType">
                                <form:options items="${fns:getDictList('loss_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                            </form:select>
                        </div>
                    </div>
                </td>
                <td colspan="1">
                    <div class="control-group">
                        <label class="control-label"><span style="color:#ff0000">*</span>货款路耗标准：</label>
                        <div class="controls">
                            <input type="text" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="control-group">
                        <label class="control-label">开票信息 ：</label>
                        <div class="controls">
                            <form:select path="invoiceType">
                                <form:options items="${fns:getDictList('invoice_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                            </form:select>
                        </div>
                    </div>
                </td>
                <td colspan="2">
                    <div class="control-group">
                        <label class="control-label">是否含税 ：</label>
                        <div class="controls">
                            <form:select path="taxFlag">
                                <form:options items="${fns:getDictList('tax_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                            </form:select>
                        </div>
                    </div>
                </td>
                <%--<td colspan="2">--%>
                    <%--<div class="control-group">--%>
                        <%--<label class="control-label">货款付款方式 ：</label>--%>
                        <%--<div class="controls">--%>
                            <%--<form:select path="payMode0">--%>
                                <%--<form:options items="${fns:getDictList('pay_mode0')}" itemLabel="label" itemValue="value" htmlEscape="false"/>--%>
                            <%--</form:select>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</td>--%>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="control-group">
                        <label class="control-label">发货地点 ：</label>
                        <div class="controls">
                            <input id="contractOId" name="contractOId" type="text" readonly="readonly" class="Wdate input-medium"
                                   value="<fmt:formatDate value="${contract.contractOId}" pattern="yyyy-MM-dd"/>"
                            onClick="WdatePicker()" class="required"/>
                        </div>
                    </div>
                </td>
                <%--<td colspan="2">--%>
                    <%--<div class="control-group">--%>
                        <%--<label class="control-label">运费付款方式 ：</label>--%>
                        <%--<div class="controls">--%>
                            <%--<form:select path="payMode">--%>
                                <%--<form:options items="${fns:getDictList('pay_mode')}" itemLabel="label" itemValue="value" htmlEscape="false"/>--%>
                            <%--</form:select>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</td>--%>
                <td colspan="2">
                    <div class="control-group">
                        <label class="control-label">业务员 ：</label>
                        <div class="controls">
                            <form:select path="staffId">
                                <form:options items="${fns:getDictList('staff_id')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                            </form:select>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="control-group">
                        <label class="control-label">备注 ：</label>
                        <div class="controls">
                            <input id="remarks" name="remarks" type="text" readonly="readonly" width="300" height="100" <%--class="Wdate input-medium"--%>
                                   value="${contract.remarks}" onClick="WdatePicker()" class="required"/>
                        </div>
                    </div>
                </td>
            </tr>
        </fieldset>
    </form>

    <form>
        <fieldset>
            <legend>价格信息</legend>
            <table id="contentTable" class="table table-striped table-bordered table-condensed">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>*煤种名称</th>
                        <th>发热量</th>
                        <th>开票煤价</th>
                        <th>*合同煤价</th>
                        <%--<th>扣损率</th>--%>
                        <th>签订吨数</th>
                        <th>签订金额</th>
                        <th>状态</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="stats">
                    <tr>
                        <td><a href="javascript:" onclick="$('#categoryId').val('${stats.categoryParentId}');$('#categoryName').val('${stats.categoryParentName}');$('#searchForm').submit();return false;">${stats.categoryParentName}</a></td>
                        <td><a href="javascript:" onclick="$('#categoryId').val('${stats.categoryId}');$('#categoryName').val('${stats.categoryName}');$('#searchForm').submit();return false;">${stats.categoryName}</a></td>
                        <td>${stats.cnt}</td>
                        <td>${stats.hits}</td>
                        <td><fmt:formatDate value="${stats.updateDate}" type="both"/></td>
                        <td><a href="javascript:" onclick="$('#officeId').val('${stats.officeId}');$('#officeName').val('${stats.officeName}');$('#searchForm').submit();return false;">${stats.officeName}</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table></tr>
        </fieldset>
    </form>

    <form>
        <fieldset>
            <legend>化验信息</legend>
            <input type="checkbox" name="Bike">启用化验指标
        </fieldset>
    </form>


    <form>
        <fieldset>
            <legend>上传信息</legend>
            <tr>
                文件路径：<input type="text" name="filePath"> <input type="button" name="browserfile" value="浏览...">文件名：<input type="text" name="fileName"><input type="button" name="browserfile" value="新增文件">
            </tr>
        </fieldset>
    </form>
    </form:form>
</body>
</html>