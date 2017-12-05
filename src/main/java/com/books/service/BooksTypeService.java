package com.books.service;

import com.books.dao.UtilDao;
import com.books.entity.BooksType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 图书类型 service
 * Created by admin on 2017/11/13.
 */
@Service("booksTypeService")
@Transactional(propagation = Propagation.REQUIRED)
public class BooksTypeService {
    /*声明dao */
    @Resource
    private UtilDao utilDao;

    /*添加书本类型*/
    public boolean addBooksType(BooksType booksType){
        return utilDao.addObject(booksType);
    }

    /*id查询*/
    public BooksType getBooksById(BooksType booksType){
        return (BooksType) utilDao.getObjectById(BooksType.class,booksType.getTno());
    }
    /*修改*/
    public boolean updateBooksType(BooksType booksType){
        return utilDao.updateObject(booksType);
    }

    /*查询所有图书类型*/
    public List findBooksTypeList(){
        return utilDao.findObjectList("from BooksType");
    }

    public void setUtilDao(UtilDao utilDao) {
        this.utilDao = utilDao;
    }
}
