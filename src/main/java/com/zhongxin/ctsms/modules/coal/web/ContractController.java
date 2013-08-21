/**
 * There are <a href="https://github.com/thinkgem/jeesite">JeeSite</a> code generation
 */
package com.zhongxin.ctsms.modules.coal.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhongxin.ctsms.common.utils.FileOperateUtil;
import com.zhongxin.ctsms.modules.coal.entity.PFile;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zhongxin.ctsms.common.config.Global;
import com.zhongxin.ctsms.common.persistence.Page;
import com.zhongxin.ctsms.common.web.BaseController;
import com.zhongxin.ctsms.modules.sys.entity.User;
import com.zhongxin.ctsms.modules.sys.utils.UserUtils;
import com.zhongxin.ctsms.modules.coal.entity.Contract;
import com.zhongxin.ctsms.modules.coal.service.ContractService;

import java.util.List;

/**
 * 合同Controller
 * @author Blue Devil
 * @version 2013-07-01
 */
@Controller
@RequestMapping(value = "${adminPath}/coal/contract")
public class ContractController extends BaseController {

	@Autowired
	private ContractService contractService;

    @ModelAttribute("contract")
	public Contract get(@RequestParam(required=false) Long id) {
		if (id != null){
			return contractService.get(id);
		}else{
			return new Contract();
		}
	}
	
	@RequiresPermissions("coal:contract:view")
	@RequestMapping(value = {"list", ""})
	public String list(Contract contract, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
			//contract.setUser(user);
		}
        Page<Contract> page = contractService.find(new Page<Contract>(request, response), contract); 
        model.addAttribute("page", page);
		return "modules/coal/contractList";
	}

	@RequiresPermissions("coal:contract:view")
	@RequestMapping(value = "form")
	public String form(Contract contract, Model model) {
		model.addAttribute("contract", contract);
		return "modules/coal/contractForm";
	}

    @RequiresPermissions("coal:contract:view")
    @RequestMapping(value = "purchaseForm")
    public String purchaseForm(Contract contract, Model model) {
        model.addAttribute("contract", contract);
        return "modules/coal/purchaseForm";
    }

    @RequiresPermissions("coal:contract:view")
    @RequestMapping(value = "saleContract")
    public String saleContract(Contract contract, Model model) {
        model.addAttribute("contract", contract);
        return "modules/coal/saleContract";
    }

    @RequiresPermissions("coal:contract:view")
    @RequestMapping(value = "search")
    public String contractSearch(Contract contract, Model model) {
        model.addAttribute("contract", contract);
        return "modules/coal/contractSearch";
    }

    @RequiresPermissions("coal:contract:edit")
    @RequestMapping(value = "detailsLook")
    public String detailsLook(Contract contract, Model model) {
        model.addAttribute("contract", contract);
        return "modules/coal/detailsLook";
    }

    @RequiresPermissions("coal:contract:edit")
    @RequestMapping(value = "synchronize")
    public String synchronize(Contract contract, Model model) {
        model.addAttribute("contract", contract);
        return "modules/coal/contractSynchronize";
    }

    @RequiresPermissions("coal:contract:view")
    @RequestMapping(value = "coalPriceLook")
    public String coalPriceLook(Contract contract, Model model) {
        model.addAttribute("contract", contract);
        return "modules/coal/coalPriceLook";
    }

	@RequiresPermissions("coal:contract:edit")
	@RequestMapping(value = "save")
	public String save(Contract contract, Model model, HttpServletRequest request,RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, contract)){
			return form(contract, model);
		}

        // 处理文件上传
//        if (contract.getFileData() != null) {
//            String pathDir = "/upload/" + contract.getContractId() + "/";
//            List<PFile> files = null;
//            try {
//                files = FileOperateUtil.upload(request, contract.getFileData(), pathDir);
//                for(PFile f : files){
//                    f.setContract(contract);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
//            }
//            contract.setFiles(files);
//        }
		contractService.save(contract);
		addMessage(redirectAttributes, "保存合同'" + contract.getContractId() + "'成功");
		return "redirect:"+Global.getAdminPath()+"/coal/contract/?repage";
	}
	
	@RequiresPermissions("coal:contract:edit")
	@RequestMapping(value = "delete")
	public String delete(Long id, RedirectAttributes redirectAttributes) {
//		contractService.delete(id);
		addMessage(redirectAttributes, "删除合同成功");
		return "redirect:"+Global.getAdminPath()+"/coal/contract/?repage";
	}

    @RequiresPermissions("coal:contract:edit")
    @RequestMapping(value = "delFile")
    public String delFile(Contract contract, Model model,String id, String prjId) {
        contractService.delPFileById(Long.valueOf(id));
        contract = contractService.get(Long.valueOf(prjId));
//        for(PFile pFile : contract.getFiles()){
//            if(Long.valueOf(id) == pFile.getId()){
//                contract.getFiles().remove(pFile);
//            }
//        }
        model.addAttribute("contract", contract);
        return "modules/coal/contractForm";
    }

    /**
     * 通过名字获取
     */
    /*@RequiresPermissions("coal:contract:view")
    @ResponseBody
    @RequestMapping(value = "findByName")
    public String findByName(String name, Model model) {
//        List<Supply> list = supplyService.findBySupplyNameLike(name);
//        return JsonMapper.nonDefaultMapper().toJson(list);
        return "Mine";
    }*/
}
