package com.zht.projectinfo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zht.projectinfo.pojo.Projectinfo;
import com.zht.projectinfo.service.ProService;
import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author shkstart
 * @create 2020-10-06 16:18
 */
@Controller
public class ProController {

    @Resource
    ProService proService;

    @RequestMapping("/")
    public String sel(Model model, HttpServletRequest request){

        String status = request.getParameter("status");
        int statusint = 3;
        if(status != null && !status.equals("")){
            statusint = Integer.parseInt(status);
        }

        int Num=1;
        String pageNum=request.getParameter("pageNum");
        if(pageNum!=null){
            Num=Integer.parseInt(pageNum);
        }
        int pageSize=3;
        PageHelper.orderBy("id desc");
        PageHelper.startPage(Num,pageSize);


        List<Projectinfo> projectinfos = proService.selAll(statusint);
        PageInfo<Projectinfo> pageInfo=new PageInfo<>(projectinfos);
        model.addAttribute("pageInfo",pageInfo);
        return "index";
    }

    @RequestMapping("/selById/{id}")
    public String selById(@PathVariable Long id,Model model){
        Projectinfo projectinfo = proService.selById(id);
        model.addAttribute("projectinto",projectinfo);
        return "upd";
    }

    @RequestMapping("/upd")
    public String upd(HttpSession session,Projectinfo projectinfo){
        int upd = proService.upd(projectinfo);
        if(upd>0){
            session.setAttribute("msg","更新成功");
        }else{
            session.setAttribute("msg","更新失败");
        }
        return "redirect:/";
    }

}
