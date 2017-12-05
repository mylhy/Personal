package com.books.service;

import com.books.dao.UtilDao;
import com.books.entity.Books;
import com.books.util.PageBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 *  图书服务类
 * Created by admin on 2017/11/20.
 */
@Service("booksService")
@Transactional(propagation = Propagation.REQUIRED)
public class BooksService {
    //声明基础dao 的方法
    @Resource
    private UtilDao utilDao;

    /*添加*/
    public boolean addBooks(Books books){
        return utilDao.addObject(books);
    }
    /*查询*/
    public List findBooksList(){
        return utilDao.findObjectList("from Books b inner join b.btype t");
    }
    /*分页查询*/
    public PageBean pageBookspage(PageBean pageBean){
        String hql="from Books b inner join b.btype t";
        //封闭当前页的数据
        pageBean.setRes(utilDao.pageObjectList(hql,pageBean));
        //总数据大小
        pageBean.setAllNum(utilDao.findObjectList(hql).size());
        return pageBean;
    }
    /*id查询*/
    public Books getBooksById(Books books){
        return (Books) utilDao.getObjectById(Books.class,books.getBno());
    }
    /*修改*/
    public boolean updateBooks(Books books){
        return utilDao.updateObject(books);
    }
    /*删除*/
    public boolean deleteBooks(Books books){
        return utilDao.updateObject(books);
    }


    public void setUtilDao(UtilDao utilDao) {
        this.utilDao = utilDao;
    }
}
