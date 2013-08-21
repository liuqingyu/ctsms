/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.zhongxin.ctsms.modules.coal.entity;

import com.zhongxin.ctsms.common.persistence.DataEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
//import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.lang.String;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 合同Entity
 *
 * @author Blue Devil
 * @version 2013-07-01
 */
@Entity
@Table(name = "t_contract_info")
@DynamicInsert @DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Contract extends DataEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long contractSid; // 主键ID
    private String contractId; // 合同编号
    private String contractOId; //
    private String processInstanceId; // 流程实例ID
    private String contractType; // 合同类型
    private String supplyId; // 供方编码
    private String settlmentType; //
    private String lossType; //
    private String lossWeight; //
    private String invoiceType; //
    private String taxFlag; //
    private String sendAddr; //
    private String staffId; //
    private String feeSts; //费用状态
    private Integer feeItemId; // 费用流水
    private String sts; // 状态
    private Date stsDate; //状态时间

    private Date signDate; //签订日期
    private String rsrvStr1; //
    private String rsrvStr2; //
    private String rsrvStr3; //
    private String rsrvStr4; //
    private String rsrvStr5; //
    private Date startDate; //开始时间
    private Date endDate; //结束时间

    public String getContractOId() {
        return contractOId;
    }

    public void setContractOId(String contractOId) {
        this.contractOId = contractOId;
    }

    public Contract() {

        super();
        this.sts = "0";
        this.stsDate = new Date();
    }

    public Contract(Long id) {
        this();
        this.contractSid = id;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getContractSid() {
        return contractSid;
    }

    public void setContractSid(Long contractSid) {
        this.contractSid = contractSid;
    }

    @NotNull
    public String getContractId() {
        return contractId;
    }

    public void setContractId(String contractId) {
        this.contractId = contractId;
    }

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }

    @NotNull
    public String getContractType() {
        return contractType;
    }

    public void setContractType(String contractType) {
        this.contractType = contractType;
    }

    public String getSupplyId() {
        return supplyId;
    }

    public void setSupplyId(String supplyId) {
        this.supplyId = supplyId;
    }

    public String getSettlmentType() {
        return settlmentType;
    }

    public void setSettlmentType(String settlmentType) {
        this.settlmentType = settlmentType;
    }

    public String getLossType() {
        return lossType;
    }

    public void setLossType(String lossType) {
        this.lossType = lossType;
    }

    public String getLossWeight() {
        return lossWeight;
    }

    public void setLossWeight(String lossWeight) {
        this.lossWeight = lossWeight;
    }

    public String getInvoiceType() {
        return invoiceType;
    }

    public String getSendAddr() {
        return sendAddr;
    }

    public void setSendAddr(String sendAddr) {
        this.sendAddr = sendAddr;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public void setInvoiceType(String invoiceType) {
        this.invoiceType = invoiceType;
    }

    public String getFeeSts() {
        return feeSts;
    }

    public void setFeeSts(String feeSts) {
        this.feeSts = feeSts;
    }

    public Integer getFeeItemId() {
        return feeItemId;
    }

    public void setFeeItemId(Integer feeItemId) {
        this.feeItemId = feeItemId;
    }

    @NotNull
    public String getSts() {
        return sts;
    }

    public void setSts(String sts) {
        this.sts = sts;
    }

    @NotNull
    public Date getStsDate() {
        return stsDate;
    }

    public void setStsDate(Date stsDate) {
        this.stsDate = stsDate;
    }

    @NotNull(message = "签订日期不能为空")
    public Date getSignDate() {
        return signDate;
    }

    public void setSignDate(Date signDate) {
        this.signDate = signDate;
    }

    public String getRsrvStr1() {
        return rsrvStr1;
    }

    public void setRsrvStr1(String rsrvStr1) {
        this.rsrvStr1 = rsrvStr1;
    }

    public String getRsrvStr2() {
        return rsrvStr2;
    }

    public void setRsrvStr2(String rsrvStr2) {
        this.rsrvStr2 = rsrvStr2;
    }

    public String getRsrvStr3() {
        return rsrvStr3;
    }

    public void setRsrvStr3(String rsrvStr3) {
        this.rsrvStr3 = rsrvStr3;
    }

    public String getRsrvStr4() {
        return rsrvStr4;
    }

    public void setRsrvStr4(String rsrvStr4) {
        this.rsrvStr4 = rsrvStr4;
    }

    public String getRsrvStr5() {
        return rsrvStr5;
    }

    public void setRsrvStr5(String rsrvStr5) {
        this.rsrvStr5 = rsrvStr5;
    }

    @NotNull(message = "合同开始时间不能为空")
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    @NotNull(message = "合同到期时间不能为空")
    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getTaxFlag() {
        return taxFlag;
    }

    public void setTaxFlag(String taxFlag) {
        this.taxFlag = taxFlag;
    }

}


