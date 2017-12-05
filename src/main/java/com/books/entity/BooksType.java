package com.books.entity;

import javax.persistence.*;

/**
 * 书本类型
 * Created by admin on 2017/11/13.
 */
@Entity
@Table(name = "tb_bookstype")
public class BooksType {
    private int tno;
    private String tname;

    public BooksType() {
    }

    public BooksType(int tno, String tname) {
        this.tno = tno;
        this.tname = tname;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getTno() {
        return tno;
    }

    public void setTno(int tno) {
        this.tno = tno;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }
}
