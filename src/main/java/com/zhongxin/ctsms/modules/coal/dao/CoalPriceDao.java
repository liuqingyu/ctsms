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
import com.zhongxin.ctsms.modules.coal.entity.CoalPrice;

/**
 * 鐓や环DAO接口
 * @author Yake
 * @version 2013-08-18
 */
public interface CoalPriceDao extends CoalPriceDaoCustom, CrudRepository<CoalPrice, Long> {

	@Modifying
	@Query("update CoalPrice set delFlag='" + CoalPrice.DEL_FLAG_DELETE + "' where id = ?1")
	public int deleteById(Long id);
	
}

/**
 * DAO Custome Interface
 * @author Yake
 */
interface CoalPriceDaoCustom extends BaseDao<CoalPrice> {

}

/**
 * DAO Custome Interface Implementation
 * @author Yake
 */
@Component
class CoalPriceDaoImpl extends BaseDaoImpl<CoalPrice> implements CoalPriceDaoCustom {

}
