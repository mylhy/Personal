package com.books.service;

import com.books.dao.UtilDao;
import com.books.entity.Reader;
import com.books.util.PageBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 读者 service
 * Created by admin on 2017/11/9.
 */
@Service("readerService")
@Transactional(propagation = Propagation.REQUIRED)
public class ReaderService {
    @Resource
    private UtilDao utilDao;

    /*添加读者*/
    public boolean addReader(Reader reader){
        return utilDao.addObject(reader);
    }
    /*查询所有读者*/
    public PageBean findReaderList(PageBean bean){
        String hql="from Reader ORDER BY rtype,rintime DESC";
        //获取当前页数据
        bean.setRes(utilDao.pageObjectList(hql,bean));
        //总数据
        bean.setAllNum(utilDao.findObjectList(hql).size());
        return bean;
    }
    /*查询指定读者*/
    public Reader getReaderById(Reader reader){
        return (Reader) utilDao.getObjectById(Reader.class,reader.getRno());
    }
    /*修改读者*/
    public boolean updateReader(Reader reader){
        return utilDao.updateObject(reader);
    }

    public void setUtilDao(UtilDao utilDao) {
        this.utilDao = utilDao;
    }
}
