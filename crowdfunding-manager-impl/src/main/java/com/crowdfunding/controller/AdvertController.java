package com.crowdfunding.controller;

import com.crowdfunding.bean.Advertisement;
import com.crowdfunding.bean.User;
import com.crowdfunding.service.AdvertisementService;
import com.crowdfunding.util.Const;
import com.crowdfunding.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@RequestMapping("/advert")
@Controller
public class AdvertController extends BaseController {
    @Autowired
    private AdvertisementService advertisementService;
    @RequestMapping("/index")
    public String toIndex(){
        return "advert/index";
    }
    @ResponseBody
    @RequestMapping("/doIndex")
    public Object doIndex(@RequestParam(defaultValue ="1",value = "pageno",required = false) Integer pageno, @RequestParam(defaultValue ="8",value = "pagesize",required = false) Integer pagesize, String queryText){
        start();
        Map<String,Object> map=new HashMap<>();
        map.put("pageno",pageno);
        map.put("pagesize",pagesize);
        map.put("queryText",queryText);
        try{
            Page<Advertisement>page=advertisementService.queryAdvertsByPage(map);
            param("page",page);
            success(true);
        }catch(Exception e){
            success(false);
            message("查询出错！");
        }
        return end();
    }
    @ResponseBody
    @RequestMapping("/doDelete")
    public Object doDelete(Integer id){
        start();
        try{
            int count=advertisementService.deleteById(id);
            success(count==1);
        }catch (Exception e){
            success(false);
            message("删除出错！");
        }
        return end();
    }
    @ResponseBody
    @RequestMapping("/doDeleteByIds")
    public Object doDeleteByIds(Integer[]ids){
        start();
        try{
            int count=advertisementService.deleteByIds(ids);
            success(count==ids.length);
        }catch (Exception e){
            success(false);
            message("批量删除出错！");
        }
        return end();
    }
    @RequestMapping("/toAdd")
    public String toAdd(){
        return "advert/add";
    }
    @ResponseBody
    @RequestMapping("/doAdd")
    public Object doAdd(Advertisement advert, HttpSession session, HttpServletRequest request){
        start();
        try{
            MultipartHttpServletRequest multipartHttpServletRequest=(MultipartHttpServletRequest)request;
            MultipartFile multipartFile=multipartHttpServletRequest.getFile("advpic");
            String name=multipartFile.getOriginalFilename();
            String ext=name.substring(name.lastIndexOf("."));//获取后缀
            String iconpath= UUID.randomUUID().toString()+ext;//随机名称
            ServletContext servletContext=session.getServletContext();//获取上下文
            String realPath=servletContext.getRealPath("/picture");//获取的绝对路径是在项目编译后的路径，是在target或者classes下，不是项目自己指定的"//picture//adv"
//            String myRealPath="E:\\ideaProject\\crowdfunding\\crowdfunding-main\\src\\main\\webapp\\picture";//指定文件上传物理路径
//            String path=myRealPath+"\\adv\\"+iconpath;
            String path=realPath+"\\adv\\"+iconpath;
            multipartFile.transferTo(new File(path));
            User user=(User)session.getAttribute(Const.LOGIN_USER);
            advert.setIconpath(iconpath);
            advert.setStatus("1");
            advert.setUserid(user.getId());
            int count = advertisementService.addAdvert(advert);
            success(count==1);
        }catch (Exception e){
            success(false);
            message("新增广告失败！");
        }
        return end();
    }
}
