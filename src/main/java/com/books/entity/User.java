package com.books.entity;

import javax.persistence.*;

/**
 * 用户 entity
 * Created by admin on 2017/11/8.
 */
@Entity
@Table(name = "tb_user")
public class User {
    private int uno;
    private String uname;
    private String upwd;

    public User() {
    }

    public User(int uno, String uname, String upwd) {
        this.uno = uno;
        this.uname = uname;
        this.upwd = upwd;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getUno() {
        return uno;
    }

    public void setUno(int uno) {
        this.uno = uno;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }
}
