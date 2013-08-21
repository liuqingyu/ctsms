/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.zhongxin.ctsms.modules.coal.entity;

import com.zhongxin.ctsms.common.persistence.DataEntity;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import java.util.Date;

/**
 * 閲囪喘鍚堝悓Entity
 * @author Yake
 * @version 2013-08-06
 */
@Entity
@Table(name = "coal_price")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class CoalPrice extends DataEntity {

	private static final long serialVersionUID = 1L;
	private Long id; 		// 编号
	private String name; 	// 名称
    private Long coalPriceId;
    private Long coalTypeId;
    private String coalPriceOld;
    private String coalPrice;
    private String sts;
    private Date stsDate;

    public Date getStsDate() {
        return stsDate;
    }

    public void setStsDate(Date stsDate) {
        this.stsDate = stsDate;
    }

    public String getSts() {

        return sts;
    }

    public void setSts(String sts) {
        this.sts = sts;
    }

    public String getCoalPrice() {

        return coalPrice;
    }

    public void setCoalPrice(String coalPrice) {
        this.coalPrice = coalPrice;
    }

    public String getCoalPriceOld() {

        return coalPriceOld;
    }

    public void setCoalPriceOld(String coalPriceOld) {
        this.coalPriceOld = coalPriceOld;
    }

    public Long getCoalTypeId() {

        return coalTypeId;
    }

    public void setCoalTypeId(Long coalTypeId) {
        this.coalTypeId = coalTypeId;
    }

    public Long getCoalPriceId() {

        return coalPriceId;
    }

    public void setCoalPriceId(Long coalPriceId) {
        this.coalPriceId = coalPriceId;
    }

    public CoalPrice() {
		super();
	}

	public CoalPrice(Long id){
		this();
		this.id = id;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	//@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_coal_purchaseContract")
	//@SequenceGenerator(name = "seq_coal_purchaseContract", sequenceName = "seq_coal_purchaseContract")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Length(min=1, max=200)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}


