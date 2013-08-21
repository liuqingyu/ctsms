package com.zhongxin.ctsms.modules.coal.utils;

import com.zhongxin.ctsms.common.utils.SpringContextHolder;
import com.zhongxin.ctsms.modules.coal.dao.DemandDao;
import com.zhongxin.ctsms.modules.coal.dao.SupplyDao;
import com.zhongxin.ctsms.modules.coal.entity.Demand;
import com.zhongxin.ctsms.modules.coal.entity.Supply;
import org.springframework.stereotype.Component;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-3-30
 * Time: 上午10:46
 * To change this template use File | Settings | File Templates.
 */
@Component
public class ContractUtils {
    private static DemandDao demandDao = SpringContextHolder.getBean(DemandDao.class);
    private static SupplyDao supplyDao = SpringContextHolder.getBean(SupplyDao.class);

    public static String getDemandName(Long Id){
        String name = "";
        Demand demand = demandDao.findByDemandId(Id);
        if(demand != null){
            name = demand.getDemandName();
        }
        return name;
    }

    public static String getSupplyName(/*Long*/String Id){
        String name = "";
        Supply supply = supplyDao.findBySupplyId(Id);
        if(supply != null){
            name = supply.getSupplyName();
        }
        return name;
    }
}
