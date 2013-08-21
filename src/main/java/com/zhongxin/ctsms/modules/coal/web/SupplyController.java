package com.zhongxin.ctsms.modules.coal.web;

import com.zhongxin.ctsms.common.config.Global;
import com.zhongxin.ctsms.common.mapper.JsonMapper;
import com.zhongxin.ctsms.common.persistence.Page;
import com.zhongxin.ctsms.common.web.BaseController;
import com.zhongxin.ctsms.modules.coal.entity.Supply;
import com.zhongxin.ctsms.modules.coal.service.SupplyService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: lqyu_773
 * Date: 13-3-25
 * Time: 下午10:32
 * To change this template use File | Settings | File Templates.
 */
@Controller
@RequestMapping(value = "${adminPath}/coal/supply")
public class SupplyController extends BaseController{
    @Autowired
    private SupplyService supplyService;

    @ModelAttribute("supply")
    public Supply get(@RequestParam(required = false) /*Long*/String id){
        if(id != null){
            return supplyService.get(id);
        }else {
            return new Supply();
        }
    }

    @RequiresPermissions("coal:supply:view")
    @RequestMapping(value = {"list", ""})
    public String list(Supply supply,HttpServletRequest request, HttpServletResponse response,Model model){
        Page<Supply> page = supplyService.find(new Page<Supply>(request,response),supply);
        model.addAttribute("page",page);
        return "modules/coal/supplyList";
    }

    @RequiresPermissions("coal:supply:view")
    @RequestMapping(value = "form")
    public String form(Supply supply, Model model) {
        model.addAttribute("supply", supply);
        return "modules/coal/supplyForm";
    }

    @RequiresPermissions("coal:supply:edit")
    @RequestMapping(value = "save")//@Valid
    public String save(Supply supply, RedirectAttributes redirectAttributes) {
        if (beanValidator(redirectAttributes, supply)){
            supplyService.save(supply);
            addMessage(redirectAttributes, "保存供方信息'" + supply.getSupplyName() + "'成功");
        }
        return "redirect:"+Global.getAdminPath()+"/coal/supply/?repage";
    }

    /*@RequiresPermissions("coal:supply:edit")
    @RequestMapping(value = "delete")
    public String delete(Long id, RedirectAttributes redirectAttributes) {
        supplyService.delete(id);
        addMessage(redirectAttributes, "删除供方信息成功");
        return "redirect:"+ Global.getAdminPath()+"/coal/supply/?repage";
    }*/

    /**
     * 通过名字获取
     */
    @RequiresPermissions("coal:supply:view")
    @ResponseBody
    @RequestMapping(value = "findByName")
    public String findByName(String name, Model model) {
        List<Supply> list = supplyService.findBySupplyNameLike(name);
        return JsonMapper.nonDefaultMapper().toJson(list);
    }
}
