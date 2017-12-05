package com.books.web;

import com.books.entity.BooksType;
import com.books.service.BooksTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * 图书类型 action
 * Created by admin on 2017/11/13.
 */
@Controller
@RequestMapping("/booksTypeAction")
public class BooksTypeAction {
    //声明 service
    @Resource(name = "booksTypeService")
    private BooksTypeService booksTypeService;

    /*添加图书类型*/
    @RequestMapping("/addBooksType")
    public String addReader(BooksType booksType, Model model){
        if(booksType.getTname()!=null&&booksType.getTname().length()>0){
            if (booksTypeService.addBooksType(booksType)){
                model.addAttribute("res",1);
            }else{
                model.addAttribute("res",2);
            }
        }else{
            model.addAttribute("res",3);
        }
        return "redirect:/pages/addBookType.jsp";
    }
    /*分页查询所有图书类型*/
    @RequestMapping("/pageBooksType")
    public String pageBooksType(Model model){
        model.addAttribute("pageBooksType",booksTypeService.findBooksTypeList());
        return "pages/showBooksType";
    }

    /*查询所有图书类型*/
    @RequestMapping("/findBooksType")
    public String findBooksTypeList(Model model){
        model.addAttribute("findBooksType", booksTypeService.findBooksTypeList());
        return "pages/showBooksType";
    }

    /*修改*/
    @RequestMapping("/updateBooksType")
    @ResponseBody
    public String getBooksTypeById(BooksType booksType){
        if(booksTypeService.updateBooksType(booksType)){
            return "1";
        }
        return "2";
    }


    public void setBooksTypeService(BooksTypeService booksTypeService) {
        this.booksTypeService = booksTypeService;
    }
}
