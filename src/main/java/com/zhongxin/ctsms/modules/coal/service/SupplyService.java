package com.zhongxin.ctsms.modules.coal.service;

import com.zhongxin.ctsms.common.persistence.Page;
import com.zhongxin.ctsms.common.service.BaseService;
import com.zhongxin.ctsms.common.utils.CacheUtils;
import com.zhongxin.ctsms.common.utils.StringUtils;
import com.zhongxin.ctsms.modules.coal.dao.SupplyDao;
import com.zhongxin.ctsms.modules.coal.entity.Supply;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-3-25
 * Time: 下午9:28
 * To change this template use File | Settings | File Templates.
 */
@Component
@Transactional(readOnly = true)
public class SupplyService extends BaseService {
    private static Logger logger = LoggerFactory.getLogger(Supply.class);

    @Autowired
    private SupplyDao supplyDao;

    public Supply get(/*Long*/String id){
        return  supplyDao.findBySupplyId(id);
    }

    /*public List<Supply> findAll(){
        return supplyDao.findAllList();
    }*/

    @Transactional(readOnly = false)
    public void save(Supply supply){
        supplyDao.save(supply);
        CacheUtils.remove("supplyList");
    }

//    @Transactional(readOnly = false)
//    public void delete(/*Long*/String id){
//        supplyDao.deleteBySupplyId(id);
//        CacheUtils.remove("supplyList");
//    }

    public Page<Supply> find(Page<Supply> supplyPage, Supply supply) {
        DetachedCriteria dc = supplyDao.createDetachedCriteria();
        if(StringUtils.isNotEmpty(supply.getSupplyName())){
            dc.add(Restrictions.like("supplyName", "%" + supply.getSupplyName() + "%"));
        }
        dc.add(Restrictions.eq(Supply.DEL_FLAG, Supply.DEL_FLAG_NORMAL));
        return  supplyDao.find(supplyPage,dc);
    }

    public List<Supply> findBySupplyNameLike(String name) {
        DetachedCriteria dc = supplyDao.createDetachedCriteria();
        if(StringUtils.isNotEmpty(name)){
            dc.add(Restrictions.like("supplyName","%" + name + "%"));
        }
        dc.add(Restrictions.eq(Supply.DEL_FLAG, Supply.DEL_FLAG_NORMAL));
        return supplyDao.find(dc);
    }
}