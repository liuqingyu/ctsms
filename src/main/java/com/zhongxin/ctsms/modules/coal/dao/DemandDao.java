package com.zhongxin.ctsms.modules.coal.dao;

import com.zhongxin.ctsms.common.persistence.BaseDao;
import com.zhongxin.ctsms.common.persistence.BaseDaoImpl;
import com.zhongxin.ctsms.common.utils.DateUtils;
import com.zhongxin.ctsms.modules.coal.entity.Demand;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-3-24
 * Time: 下午10:09
 * To change this template use File | Settings | File Templates.
 */
public interface DemandDao extends DemandDaoCustom, CrudRepository<Demand,Long> {

    public Demand findByDemandId(Long id);

//    @Query("from Demand where delFlag='" + Demand.DEL_FLAG_NORMAL + "'")
//    public List<Demand> findAllList();
//
//    @Modifying
//    @Query("update Demand set delFlag='" + Demand.DEL_FLAG_DELETE + "' where demandId = ?1")
//    public void deleteById(Long id);

    List<Object[]> findByDemandNameContaining(String name);
}

interface DemandDaoCustom extends BaseDao<Demand>{

}

@Component
class DemandDaoImpl extends BaseDaoImpl<Demand>{

}