package com.books.web;

import com.books.entity.Reader;
import com.books.service.ReaderService;
import com.books.util.PageBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * 读者action
 * Created by admin on 2017/11/9.
 */
@Controller
@RequestMapping("/readerAction")
public class ReaderAction {
    private PageBean pageBean;//分页信息
    //声明 service
    @Resource(name = "readerService")
    private ReaderService readerService;

    /*添加读者*/
    @RequestMapping("/addReader")
    public String addReader(Reader reader, Model model){
        reader.setRtype(1);
        if (readerService.addReader(reader)){
            model.addAttribute("res",1);
        }else{
            model.addAttribute("res",2);
        }
        return "redirect:/pages/addReader.jsp";
    }
    /*查询读者*/
    @RequestMapping("/findReaderList")
    @ResponseBody
    public PageBean findReaderList(PageBean pageBean){
        return readerService.findReaderList(pageBean);
    }
    /*修改读者信息*/
    @RequestMapping("/updateReader")
    @ResponseBody
    public String updateReader(Reader reader){
        if(readerService.updateReader(reader)){
            return "1";
        }
        return "2";
    }

    public PageBean getPageBean() {
        return pageBean;
    }

    public void setPageBean(PageBean pageBean) {
        this.pageBean = pageBean;
    }

    public void setReaderService(ReaderService readerService) {
        this.readerService = readerService;
    }
}
