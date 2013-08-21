package com.zhongxin.ctsms.modules.coal.entity;

import com.zhongxin.ctsms.common.persistence.DataEntity;
import org.hibernate.annotations.*;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;
import org.hibernate.annotations.Cache;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-3-24
 * Time: 下午9:36
 * To change this template use File | Settings | File Templates.
 */
@Table(name = "t_coal_demand")
@DynamicInsert
@DynamicUpdate
@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Demand extends DataEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    private Long demandId;
    private String demandName;
    private String demandType;
    private String createdBy;
//    private Date updateDate;
    private String rsrvStr1;
    private String rsrvStr2;
    private String rsrvStr3;
    private String sts;
    private Date stsDate;
//    private String remarks;

    public Demand(){

    }

    public Demand(Long id) {
        this();
        this.demandId = id;
    }
    @Column(name = "DEMAND_ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getDemandId() {
        return demandId;
    }

    public void setDemandId(Long demandId) {
        this.demandId = demandId;
    }

    @Column(name = "DEMAND_NAME")
    @Basic
    public String getDemandName() {
        return demandName;
    }

    public void setDemandName(String demandName) {
        this.demandName = demandName;
    }

    public String getDemandType() {
        return demandType;
    }

    public void setDemandType(String demandType) {
        this.demandType = demandType;
    }

   /* public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
*/
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

    public String getSts() {
        return sts;
    }

    public void setSts(String sts) {
        this.sts = sts;
    }

    public Date getStsDate() {
        return stsDate;
    }

    public void setStsDate(Date stsDate) {
        this.stsDate = stsDate;
    }

    /*public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }*/

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }
}
