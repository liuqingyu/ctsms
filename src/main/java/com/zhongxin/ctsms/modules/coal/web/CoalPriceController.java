/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.zhongxin.ctsms.modules.coal.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zhongxin.ctsms.common.config.Global;
import com.zhongxin.ctsms.common.persistence.Page;
import com.zhongxin.ctsms.common.web.BaseController;
import com.zhongxin.ctsms.modules.sys.entity.User;
import com.zhongxin.ctsms.modules.sys.utils.UserUtils;
import com.zhongxin.ctsms.modules.coal.entity.CoalPrice;
import com.zhongxin.ctsms.modules.coal.service.CoalPriceService;

/**
 * 煤价查看Controller
 * @author Yake
 * @version 2013-08-18
 */
@Controller
@RequestMapping(value = "${adminPath}/coal/coalPrice")
public class CoalPriceController extends BaseController {

	@Autowired
	private CoalPriceService coalPriceService;
	
	@ModelAttribute
	public CoalPrice get(@RequestParam(required=false) Long id) {
		if (id != null){
			return coalPriceService.get(id);
		}else{
			return new CoalPrice();
		}
	}
	
	@RequiresPermissions("coal:coalPrice:view")
	@RequestMapping(value = {"list", ""})
	public String list(CoalPrice coalPrice, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
//		if (!user.isAdmin()){
//			coalPrice.setUser(user);
//		}
        Page<CoalPrice> page = coalPriceService.find(new Page<CoalPrice>(request, response), coalPrice); 
        model.addAttribute("page", page);
		return "modules/coal/coalPriceList";
	}

	@RequiresPermissions("coal:coalPrice:view")
	@RequestMapping(value = "form")
	public String form(CoalPrice coalPrice, Model model) {
		model.addAttribute("coalPrice", coalPrice);
		return "modules/coal/coalPriceForm";
	}

    @RequiresPermissions("coal:coalPrice:view")
    @RequestMapping(value = "look")
    public String  look(CoalPrice coalPrice, Model model) {
        model.addAttribute("coalPrice", coalPrice);
        return "modules/coal/coalPriceLook";
    }

	@RequiresPermissions("coal:coalPrice:edit")
	@RequestMapping(value = "save")
	public String save(CoalPrice coalPrice, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, coalPrice)){
			return form(coalPrice, model);
		}
		coalPriceService.save(coalPrice);
		addMessage(redirectAttributes, "保存煤价'" + coalPrice.getName() + "'成功");
		return "redirect:"+Global.getAdminPath()+"/modules/coal/coalPrice/?repage";
	}
	
	@RequiresPermissions("coal:coalPrice:edit")
	@RequestMapping(value = "delete")
	public String delete(Long id, RedirectAttributes redirectAttributes) {
		coalPriceService.delete(id);
		addMessage(redirectAttributes, "删除煤价成功");
		return "redirect:"+Global.getAdminPath()+"/modules/coal/coalPrice/?repage";
	}

}
