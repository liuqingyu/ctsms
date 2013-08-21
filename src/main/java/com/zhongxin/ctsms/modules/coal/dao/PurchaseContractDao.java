/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.zhongxin.ctsms.modules.coal.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

import com.zhongxin.ctsms.common.persistence.BaseDao;
import com.zhongxin.ctsms.common.persistence.BaseDaoImpl;
import com.zhongxin.ctsms.modules.coal.entity.PurchaseContract;

/**
 * 閲囪喘鍚堝悓DAO接口
 * @author Yake
 * @version 2013-08-06
 */
public interface PurchaseContractDao extends PurchaseContractDaoCustom, CrudRepository<PurchaseContract, Long> {

	@Modifying
	@Query("update PurchaseContract set delFlag='" + PurchaseContract.DEL_FLAG_DELETE + "' where id = ?1")
	public int deleteById(Long id);
	
}

/**
 * DAO Custome Interface
 * @author Yake
 */
interface PurchaseContractDaoCustom extends BaseDao<PurchaseContract> {

}

/**
 * DAO Custome Interface Implementation
 * @author Yake
 */
@Component
class PurchaseContractDaoImpl extends BaseDaoImpl<PurchaseContract> implements PurchaseContractDaoCustom {

}
