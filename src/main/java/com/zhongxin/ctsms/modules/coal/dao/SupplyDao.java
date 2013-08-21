package com.zhongxin.ctsms.modules.coal.dao;

import com.zhongxin.ctsms.common.persistence.BaseDao;
import com.zhongxin.ctsms.common.persistence.BaseDaoImpl;
import com.zhongxin.ctsms.modules.coal.entity.Supply;
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
 * Time: 下午10:11
 * To change this template use File | Settings | File Templates.
 */
public interface SupplyDao extends SupplyDaoCustom, CrudRepository<Supply,/*Long*/String> {
    public Supply findBySupplyId(/*Long*/String id);

//    @Query("from Supply where delFlag='" + Supply.DEL_FLAG_NORMAL + "'")
//    public List<Supply> findAllList();
//
    /*@Modifying
    @Query("update Supply set delFlag='" + Supply.DEL_FLAG_DELETE + "' where supplyId = ?1")
    public void deleteBySupplyId(Long id);*/

    List<Object[]> findBySupplyNameContaining(String name);

}

interface SupplyDaoCustom extends BaseDao<Supply> {

}

@Component
class SupplyDaoImpl extends BaseDaoImpl<Supply> {

}
