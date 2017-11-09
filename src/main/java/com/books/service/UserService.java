package com.books.service;

import com.books.dao.UserDao;
import com.books.entity.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 用户 service 类
 * Created by admin on 2017/11/6.
 */
@Service("userService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserService {
    //声明dao 方法
    @Resource(name = "userDao")
    private UserDao userDao;

    /*添加用户*/
    public boolean addUser(User user){
        return userDao.addUser(user);
    }

    /*用户登录 */
    public User doLogin(User user){
        List<User> list=userDao.findList("from User where uname="+user.getUname());
        if (list.size()>0){
            for (User u:list){
                if (u.getUname().equals(user.getUname())&&u.getUpwd().equals(user.getUpwd())){
                    return u;
                }
            }
        }
        return null;
    }



    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
