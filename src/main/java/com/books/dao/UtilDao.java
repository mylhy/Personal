package com.books.dao;

import com.books.util.PageBean;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

/**
 * 公共dao 操作方法
 * Created by admin on 2017/11/10.
 */
@Repository
public class UtilDao extends BaseDao {

    /*添加*/
    public boolean addObject(Object obj){
        try {
            getSession().save(obj);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    /*修改*/
    public boolean updateObject(Object obj){
        try {
            getSession().update(obj);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    /*删除*/
    public boolean deleteObject(Object obj){
        try {
            getSession().delete(obj);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }


    /*根据hql语句返回list集合*/
    public List findObjectList(String hql){
        try {
            return getSession().createQuery(hql).list();
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    /*根据hql语句进行分页*/
    public List pageObjectList(String hql,PageBean bean){
        Query query=getSession().createQuery(hql);
        //页面数据数量
        query.setFirstResult((bean.getCpage()-1)*bean.getShowNum());//当前页
        query.setMaxResults(bean.getShowNum());//每页显示多少
        List list=query.list();
        return list;
    }
    //根据ID查询单个对象的方法
    public Object getObjectById(Class cls,Serializable id){
        try {
            return getSession().get(cls,id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

}
