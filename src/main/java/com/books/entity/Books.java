package com.books.entity;

import javax.persistence.*;

/**
 * 书本基础信息表
 * Created by admin on 2017/11/16.
 */
@Entity
@Table(name = "tb_books")
public class Books {
    private int bno;
    private String bid;
    private String bname;
    private String bauthor;     //作者
    private double bprice;      //价格
    private String bpress;      //出版社
    private String bpdate;      //出版日期
    private String bremarks;    //备注

    private String bstate;  //书本状态类型：[1:在架，2:借出,3：破损，4:下架]

    /*图书类型*/
    private BooksType btype;

    public Books() {
    }

    public Books(int bno, String bid, String bname, String bauthor, double bprice, String bpress, String bpdate, String bremarks, String bstate) {
        this.bno = bno;
        this.bid = bid;
        this.bname = bname;
        this.bauthor = bauthor;
        this.bprice = bprice;
        this.bpress = bpress;
        this.bpdate = bpdate;
        this.bremarks = bremarks;
        this.bstate = bstate;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getBauthor() {
        return bauthor;
    }

    public void setBauthor(String bauthor) {
        this.bauthor = bauthor;
    }

    public double getBprice() {
        return bprice;
    }

    public void setBprice(double bprice) {
        this.bprice = bprice;
    }

    public String getBpress() {
        return bpress;
    }

    public void setBpress(String bpress) {
        this.bpress = bpress;
    }

    public String getBpdate() {
        return bpdate;
    }

    public void setBpdate(String bpdate) {
        this.bpdate = bpdate;
    }

    public String getBremarks() {
        return bremarks;
    }

    public void setBremarks(String bremarks) {
        this.bremarks = bremarks;
    }

    public String getBstate() {
        return bstate;
    }

    public void setBstate(String bstate) {
        this.bstate = bstate;
    }

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "btype")
    public BooksType getBtype() {
        return btype;
    }

    public void setBtype(BooksType btype) {
        this.btype = btype;
    }
}
