package com.books.web;

import com.books.entity.User;
import com.books.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 用户 Action
 * Created by admin on 2017/11/8.
 */
@Controller
@RequestMapping("/userAction")
public class UserAction {
    //声明user
    private User user;
    //声明 service 方法
    @Resource(name = "userService")
    private UserService userService;

    @RequestMapping("/doLogin")
    public String doLogin(User user){
        user=userService.doLogin(user);
        if(user!=null){
            return "pages/main";
        }
        return "redirect:/index.html";
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
