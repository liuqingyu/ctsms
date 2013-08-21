/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.zhongxin.ctsms.modules.coal.service;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.zhongxin.ctsms.common.persistence.Page;
import com.zhongxin.ctsms.common.service.BaseService;
import com.zhongxin.ctsms.modules.coal.entity.PurchaseContract;
import com.zhongxin.ctsms.modules.coal.dao.PurchaseContractDao;

/**
 * 閲囪喘鍚堝悓Service
 * @author Yake
 * @version 2013-08-06
 */
@Component
@Transactional(readOnly = true)
public class PurchaseContractService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger logger = LoggerFactory.getLogger(PurchaseContractService.class);
	
	@Autowired
	private PurchaseContractDao purchaseContractDao;
	
	public PurchaseContract get(Long id) {
		return purchaseContractDao.findOne(id);
	}
	
	public Page<PurchaseContract> find(Page<PurchaseContract> page, PurchaseContract purchaseContract) {
		DetachedCriteria dc = purchaseContractDao.createDetachedCriteria();
		if (StringUtils.isNotEmpty(purchaseContract.getName())){
			dc.add(Restrictions.like("name", "%"+purchaseContract.getName()+"%"));
		}
		dc.add(Restrictions.eq(PurchaseContract.DEL_FLAG, PurchaseContract.DEL_FLAG_NORMAL));
		dc.addOrder(Order.desc("id"));
		return purchaseContractDao.find(page, dc);
	}
	
	@Transactional(readOnly = false)
	public void save(PurchaseContract purchaseContract) {
		purchaseContractDao.save(purchaseContract);
	}
	
	@Transactional(readOnly = false)
	public void delete(Long id) {
		purchaseContractDao.deleteById(id);
	}
	
}
