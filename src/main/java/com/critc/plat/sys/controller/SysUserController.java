package com.critc.plat.sys.controller;

import com.critc.plat.aspect.Log;
import com.critc.plat.common.exception.MyException;
import com.critc.plat.sys.model.SysRole;
import com.critc.plat.sys.model.SysUser;
import com.critc.plat.sys.service.SysRoleService;
import com.critc.plat.sys.service.SysUserService;
import com.critc.plat.util.page.PageNavigate;
import com.critc.plat.util.result.ResultEnum;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Created by wangyupeng on 2017/8/18.
 */
@Controller
@RequestMapping("/sysUser")
public class SysUserController {
    @Autowired
    private SysUserService userService;
    @Autowired
    private SysRoleService sysRoleService;

    /**
     * 用户列表
     * @param sysUser
     * @param sysRole
     * @return
     */
    @RequestMapping
    public ModelAndView listUser(SysUser sysUser, SysRole sysRole){
        ModelAndView mv = new ModelAndView();
        //添加分页
        int totalRecords = userService.count(sysUser); //总数
        PageNavigate pageNavigate = new PageNavigate("", sysUser.getPageIndex(), totalRecords);//定义分页对象,传入url、当前页、总记录数
        mv.addObject("pageNavigate", pageNavigate);// 设置分页的变量

        //查询用户列表
        List<SysUser> listUser = userService.listUser(sysUser);
        mv.addObject("listUser",listUser);

        //查询所有角色
        List<SysRole> listRole = sysRoleService.listRoleForUser();
        mv.addObject("listRole",listRole);

        mv.addObject("sysUser",sysUser);
        mv.addObject("sysRole",sysRole);

        mv.setViewName("plat/sys/user/listUser");
        return mv;
    }

    /**
     * 添加用户
     * @param sysUser
     * @return
     */
    @RequestMapping("/toAddUser")
    public ModelAndView toAddUser(SysUser sysUser){
        ModelAndView mv = new ModelAndView();
        //查询所有角色
        List<SysRole> listRole = sysRoleService.listRoleForUser();
        mv.addObject("listRole",listRole);
        mv.setViewName("plat/sys/user/addUser");
        return mv;
    }
    @RequestMapping("/addUser")
    public String addUser(SysUser sysUser){
        int n = userService.addUser(sysUser);
        return "redirect:/sysUser";
    }

    /**
     * 修改用户
     * @param userId
     * @return
     */
    @RequestMapping("/toUpdateUser")
    public ModelAndView toUpdateUser(String userId){
        ModelAndView mv = new ModelAndView();
        //根据用户ID查询用户信息
        SysUser sysUser = userService.getUserByUserId(userId);
        mv.addObject("sysUser",sysUser);

        //查询所有角色
        List<SysRole> listRole = sysRoleService.listRoleForUser();
        mv.addObject("listRole",listRole);
        mv.setViewName("plat/sys/user/updateUser");
        return mv;
    }
    @RequestMapping("/updateUser")
    public ModelAndView updateUser(SysUser sysUser,RedirectAttributes attr){
        ModelAndView mv = new ModelAndView();
        int n = userService.updateUser(sysUser);
        attr.addFlashAttribute("message", ResultEnum.UPDATE_SUCCESS);
//        return "redirect:/sysUser";
        mv.setViewName("redirect:/sysUser");
        return mv;
    }

    /**
     * 删除用户
     * @param userId
     * @return
     */
    @RequestMapping("/deleteUser")
    public String deleteUser(String userId){
        userService.deleteUser(userId);
        return "redirect:/sysUser";
    }

    /**
     * 锁定用户
     * @param userId
     * @return
     */
    @RequestMapping("/lockUser")
    public String lockUser(String userId){
        userService.lockUser(userId);
        return "redirect:/sysUser";
    }

    /**
     * 解锁用户
     * @param userId
     * @return
     */
    @RequestMapping("/unlockUser")
    public String unlockUser(String userId){
        userService.unlockUser(userId);
        return "redirect:/sysUser";
    }

    /**
     * 重置密码
     * @param userId
     * @return
     */
    @RequestMapping("/resetPassWord")
    public String resetPassWord(String userId){
        userService.resetPassWord(userId);
        return "redirect:/sysUser";
    }

    @RequestMapping("/toUpdatePassWord")
    public String toUpdatePassWord(){
        return "plat/sys/user/updatePassWord";
    }

    @RequestMapping("/updatePassWord")
    public ModelAndView updatePassWord(SysUser sysUser){
        SysUser sysUser2 = (SysUser) SecurityUtils.getSubject().getSession().getAttribute("userSession");
        ModelAndView mv = new ModelAndView();

        int n = 0;
        if(userService.checkOldPassWord(sysUser2.getUserId(),sysUser.getOldPassWord())){
            n = userService.updatePassWord(sysUser);
            mv.addObject("updatePassSuccess",n);
        }else{
            mv.addObject("oldPassError","原密码输入错误！");
        }
        mv.setViewName("plat/sys/user/updatePassWord");
        return mv;
    }

    @RequestMapping("/checkExist")
    @ResponseBody
    public String checkExist(String userName){
        SysUser sysUser = userService.getUserByUserName(userName);
        String existFlag = "false";
        if(sysUser==null){
            existFlag ="true";
        }
        return existFlag;
    }
}
