/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.zhongxin.ctsms.modules.coal.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.hibernate.validator.constraints.Length;

import com.zhongxin.ctsms.common.persistence.DataEntity;
import com.zhongxin.ctsms.modules.sys.entity.User;

/**
 * 閲囪喘鍚堝悓Entity
 * @author Yake
 * @version 2013-08-06
 */
@Entity
@Table(name = "coal_purchaseContract")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class PurchaseContract extends DataEntity {
	
	private static final long serialVersionUID = 1L;
	private Long id; 		// 编号
	private String name; 	// 名称

	public PurchaseContract() {
		super();
	}

	public PurchaseContract(Long id){
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


