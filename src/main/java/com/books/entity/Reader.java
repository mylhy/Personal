package com.books.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * 读者 entity
 * Created by admin on 2017/11/9.
 */
@Entity
@Table(name = "tb_reader")
public class Reader {
    private int rno;
    private String rname;
    private String rsex;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date rbirthdate;
    private String rproofnum;//身份证号
    private String rtel;//联系方式
    private int rmoney;//押金
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date rintime;//办证日期
    private int rtype;//读者状态【1：正常，2:已退款，3：黑名单】

    public Reader() {
    }

    public Reader(int rno, String rname, String rsex, Date rbirthdate, String rproofnum, String rtel, int rmoney, Date rintime, int rtype) {
        this.rno = rno;
        this.rname = rname;
        this.rsex = rsex;
        this.rbirthdate = rbirthdate;
        this.rproofnum = rproofnum;
        this.rtel = rtel;
        this.rmoney = rmoney;
        this.rintime = rintime;
        this.rtype = rtype;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getRno() {
        return rno;
    }

    public void setRno(int rno) {
        this.rno = rno;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public String getRsex() {
        return rsex;
    }

    public void setRsex(String rsex) {
        this.rsex = rsex;
    }

    public Date getRbirthdate() {
        return rbirthdate;
    }

    public void setRbirthdate(Date rbirthdate) {
        this.rbirthdate = rbirthdate;
    }

    public String getRproofnum() {
        return rproofnum;
    }

    public void setRproofnum(String rproofnum) {
        this.rproofnum = rproofnum;
    }

    public String getRtel() {
        return rtel;
    }

    public void setRtel(String rtel) {
        this.rtel = rtel;
    }

    public int getRmoney() {
        return rmoney;
    }

    public void setRmoney(int rmoney) {
        this.rmoney = rmoney;
    }

    public Date getRintime() {
        return rintime;
    }

    public void setRintime(Date rintime) {
        this.rintime = rintime;
    }

    public int getRtype() {
        return rtype;
    }

    public void setRtype(int rtype) {
        this.rtype = rtype;
    }
}
