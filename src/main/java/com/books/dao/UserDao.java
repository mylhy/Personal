package com.books.dao;

import com.books.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户 dao 层
 * Created by admin on 2017/11/6.
 */
@Repository("userDao")
public class UserDao extends BaseDao {
    /*添加用户*/
    public boolean addUser(User user){
        try {
            getSession().save(user);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    /*查询所有用户*/
    public List findList(String hql){
        return getSession().createQuery(hql).list();
    }
}
