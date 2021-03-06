/**
 * There are <a href="https://github.com/zhongxin/ctsms">JeeSite</a> code generation
 */
package com.zhongxin.ctsms.modules.oa.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.zhongxin.ctsms.common.config.Global;
import com.zhongxin.ctsms.common.mapper.JsonMapper;
import com.zhongxin.ctsms.common.persistence.Page;
import com.zhongxin.ctsms.common.web.BaseController;
import com.zhongxin.ctsms.modules.oa.entity.Leave;
import com.zhongxin.ctsms.modules.oa.service.LeaveService;
import com.zhongxin.ctsms.modules.sys.utils.UserUtils;

/**
 * 请假Controller
 * @author liuj
 * @version 2013-04-05
 */
@Controller
@RequestMapping(value = "${adminPath}/oa/leave")
public class LeaveController extends BaseController {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	protected LeaveService leaveService;

	@Autowired
	protected RuntimeService runtimeService;

	@Autowired
	protected TaskService taskService;

	@RequiresPermissions("oa:leave:view")
	@RequestMapping(value = {"form"})
	public String form(Leave leave, Model model) {
		model.addAttribute("leave", leave);
		return "modules/oa/leaveForm";
	}

	/**
	 * 启动请假流程
	 * @param leave	
	 */
	@RequiresPermissions("oa:leave:edit")
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(Leave leave, RedirectAttributes redirectAttributes) {
		try {
			Map<String, Object> variables = new HashMap<String, Object>();
			System.out.println(leave.getStartTime());
			ProcessInstance processInstance = leaveService.save(leave, variables);
			addMessage(redirectAttributes, "流程已启动，流程ID：" + processInstance.getId());
		} catch (Exception e) {
			logger.error("启动请假流程失败：", e);
			addMessage(redirectAttributes, "系统内部错误！");
		}
		return "redirect:"+Global.getAdminPath()+"/oa/leave/form";
	}

	/**
	 * 任务列表
	 * @param leave	
	 */
	@RequiresPermissions("oa:leave:view")
	@RequestMapping(value = {"list/task",""})
	public ModelAndView taskList(HttpSession session) {
		ModelAndView mav = new ModelAndView("modules/oa/leaveTask");
		String userId = ObjectUtils.toString(UserUtils.getUser().getId());
		List<Leave> results = leaveService.findTodoTasks(userId);
		mav.addObject("leaves", results);
		return mav;
	}

	/**
	 * 读取所有流程
	 * @return
	 */
	@RequiresPermissions("oa:leave:view")
	@RequestMapping(value = {"list"})
	public String list(Leave leave, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<Leave> page = leaveService.find(new Page<Leave>(request, response), leave); 
        model.addAttribute("page", page);
		return "modules/oa/leaveList";
	}
	
	
	/**
	 * 读取详细数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "detail/{id}")
	@ResponseBody
	public String getLeave(@PathVariable("id") Long id) {
		Leave leave = leaveService.findOne(id);
		return JsonMapper.getInstance().toJson(leave);
	}


	/**
	 * 读取详细数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "detail-with-vars/{id}/{taskId}")
	@ResponseBody
	public String getLeaveWithVars(@PathVariable("id") Long id, @PathVariable("taskId") String taskId) {
		Leave leave = leaveService.findOne(id);
		Map<String, Object> variables = taskService.getVariables(taskId);
		leave.setVariables(variables);
		return JsonMapper.getInstance().toJson(leave);
	}



}
