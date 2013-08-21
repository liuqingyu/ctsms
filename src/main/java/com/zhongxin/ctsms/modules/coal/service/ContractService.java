/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.zhongxin.ctsms.modules.coal.service;

import com.zhongxin.ctsms.modules.coal.dao.PFileDao;
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
import com.zhongxin.ctsms.modules.coal.entity.Contract;
import com.zhongxin.ctsms.modules.coal.dao.ContractDao;

/**
 * 合同Service
 * @author Blue Devil
 * @version 2013-07-01
 */
@Component
@Transactional(readOnly = true)
public class ContractService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger logger = LoggerFactory.getLogger(ContractService.class);
	
	@Autowired
	private ContractDao contractDao;

    @Autowired
    private PFileDao pFileDao;

	public Contract get(Long id) {
		return contractDao.findOne(id);
	}
	
	public Page<Contract> find(Page<Contract> page, Contract contract) {
		DetachedCriteria dc = contractDao.createDetachedCriteria();
		if (StringUtils.isNotEmpty(contract.getContractId())){
			dc.add(Restrictions.like("contractId", "%"+contract.getContractId()+"%"));
		}
        if (StringUtils.isNotEmpty(contract.getContractType())){
            dc.add(Restrictions.eq("contractType",contract.getContractType()));
        }
		dc.add(Restrictions.eq(Contract.DEL_FLAG, Contract.DEL_FLAG_NORMAL));
		//dc.addOrder(Order.desc("contractSid"));
		return contractDao.find(page, dc);
	}
	
	@Transactional(readOnly = false)
	public void save(Contract contract) {
		contractDao.save(contract);
	}
	
	/*@Transactional(readOnly = false)
	public void delete(Long id) {
		contractDao.deleteById(id);
	}*/

    /*
     * 文件删除
     */
    @Transactional(readOnly = false)
    public void delPFileById(Long id) {
        pFileDao.clear();
        pFileDao.deleteById(id);
    }
}
