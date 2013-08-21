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
import com.zhongxin.ctsms.modules.coal.entity.PurchaseContract;
import com.zhongxin.ctsms.modules.coal.service.PurchaseContractService;

/**
 * 閲囪喘鍚堝悓Controller
 * @author Yake
 * @version 2013-08-06
 */
@Controller
@RequestMapping(value = "${adminPath}/coal/purchaseContract")
public class PurchaseContractController extends BaseController {

	@Autowired
	private PurchaseContractService purchaseContractService;
	
	@ModelAttribute
	public PurchaseContract get(@RequestParam(required=false) Long id) {
		if (id != null){
			return purchaseContractService.get(id);
		}else{
			return new PurchaseContract();
		}
	}
	
	@RequiresPermissions("coal:purchaseContract:view")
	@RequestMapping(value = {"list", ""})
	public String list(PurchaseContract purchaseContract, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
//			purchaseContract.setUser(user);
		}
        Page<PurchaseContract> page = purchaseContractService.find(new Page<PurchaseContract>(request, response), purchaseContract); 
        model.addAttribute("page", page);
		return "modules/coal/purchaseContractList";
	}

	@RequiresPermissions("coal:purchaseContract:view")
	@RequestMapping(value = "form")
	public String form(PurchaseContract purchaseContract, Model model) {
		model.addAttribute("purchaseContract", purchaseContract);
		return "modules/coal/purchaseContractForm";
	}

	@RequiresPermissions("coal:purchaseContract:edit")
	@RequestMapping(value = "save")
	public String save(PurchaseContract purchaseContract, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, purchaseContract)){
			return form(purchaseContract, model);
		}
		purchaseContractService.save(purchaseContract);
		addMessage(redirectAttributes, "保存閲囪喘鍚堝悓'" + purchaseContract.getName() + "'成功");
		return "redirect:"+Global.getAdminPath()+"/modules/coal/purchaseContract/?repage";
	}
	
	@RequiresPermissions("coal:purchaseContract:edit")
	@RequestMapping(value = "delete")
	public String delete(Long id, RedirectAttributes redirectAttributes) {
		purchaseContractService.delete(id);
		addMessage(redirectAttributes, "删除閲囪喘鍚堝悓成功");
		return "redirect:"+Global.getAdminPath()+"/modules/coal/purchaseContract/?repage";
	}

}
