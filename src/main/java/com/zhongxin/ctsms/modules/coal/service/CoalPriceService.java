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
import com.zhongxin.ctsms.modules.coal.entity.CoalPrice;
import com.zhongxin.ctsms.modules.coal.dao.CoalPriceDao;

/**
 * 鐓や环Service
 * @author Yake
 * @version 2013-08-18
 */
@Component
@Transactional(readOnly = true)
public class CoalPriceService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger logger = LoggerFactory.getLogger(CoalPriceService.class);
	
	@Autowired
	private CoalPriceDao coalPriceDao;
	
	public CoalPrice get(Long id) {
		return coalPriceDao.findOne(id);
	}
	
	public Page<CoalPrice> find(Page<CoalPrice> page, CoalPrice coalPrice) {
		DetachedCriteria dc = coalPriceDao.createDetachedCriteria();
		if (StringUtils.isNotEmpty(coalPrice.getName())){
			dc.add(Restrictions.like("name", "%"+coalPrice.getName()+"%"));
		}
		dc.add(Restrictions.eq(CoalPrice.DEL_FLAG, CoalPrice.DEL_FLAG_NORMAL));
		dc.addOrder(Order.desc("id"));
		return coalPriceDao.find(page, dc);
	}
	
	@Transactional(readOnly = false)
	public void save(CoalPrice coalPrice) {
		coalPriceDao.save(coalPrice);
	}
	
	@Transactional(readOnly = false)
	public void delete(Long id) {
		coalPriceDao.deleteById(id);
	}
	
}
