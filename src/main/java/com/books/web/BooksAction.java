package com.books.web;

import com.books.entity.Books;
import com.books.service.BooksService;
import com.books.service.BooksTypeService;
import com.books.util.PageBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

/**
 * 图书类
 * Created by admin on 2017/11/20.
 */
@Controller
@RequestMapping("/books")
public class BooksAction {
    //声明图书类型访问方法
    @Resource(name = "booksTypeService")
    private BooksTypeService booksTypeService;
    //声明图书访问方法
    @Resource(name = "booksService")
    private BooksService booksService;

    //去到添加图书页面
    @RequestMapping("/toAddBooks")
    public String toAddBooks(Model model){
        List list=booksTypeService.findBooksTypeList();
        if(list!=null){
            model.addAttribute("booksType",list);
            return "pages/addBook";
        }
        return "redirect:/pages/main.jsp";
    }

    /*添加图书*/
    @RequestMapping("/addBooks")
    public String addBooks(Books books,Model model){
        if(books.getBname()!=null){
            if(booksService.addBooks(books)){
                model.addAttribute("res",1);
            }else{
                model.addAttribute("res",2);
            }
        }
        return "redirect:/books/toAddBooks";
    }
    /*查询所有图书*/
    @RequestMapping("/pageBooksList")
    @ResponseBody
    public PageBean pageBooksList(PageBean pageBean){
        return booksService.pageBookspage(pageBean);
    }

    /*去到修改页面*/
    @RequestMapping("/toUpdateBooks")
    public String toUpdateBooks(Books books,Model model){
        //先查询所有图书类型
        //再查询当前要修改的书
        if (books.getBno()!=0){
            model.addAttribute("bookType",booksTypeService.findBooksTypeList());
            model.addAttribute("book",booksService.getBooksById(books));
            return "pages/updateBooks";
        }
        return "redirect:/pages/showBooks.jsp";
    }
    /*执行修改操作*/
    @RequestMapping("/doUpdateBooks")
    public void doUpdateBooks(Books books, HttpServletRequest request, HttpServletResponse response, PrintWriter out){
        response.setContentType("text/html;charset=utf-8");
        if (books.getBno()!=0){
            if (booksService.updateBooks(books)){
                out.print("<script>alert('修改成功');location.href='"+request.getContextPath()+"/pages/showBooks.jsp'</script>");
            }
        }
        out.print("<script>alert('修改失败');window.history.back();</script>");
    }


    public void setBooksTypeService(BooksTypeService booksTypeService) {
        this.booksTypeService = booksTypeService;
    }

    public void setBooksService(BooksService booksService) {
        this.booksService = booksService;
    }
}
