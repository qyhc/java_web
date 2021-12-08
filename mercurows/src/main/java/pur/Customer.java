package pur;

import java.io.Serializable;
import java.sql.Timestamp;

//顾客
public class Customer implements Serializable{
    int id;
    String realname;//真实名
    String username;
    String pass;
    String imgUrl;//头像
    String intro;//介绍
    String tel;
    String email;
    String gender;//性别
    String cardID;//身份证
    String detail_address;//通讯地址
    String regTime;//注册时间
    String state;//账户状态 '1'-激活 '0'--锁定
    String level;//会员等级  '1'-普通会员  '2'--黄金会员  '3'--钻石会员
    Region region;//客户所在区ID

    public Customer() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCardID() {
        return cardID;
    }

    public void setCardID(String cardID) {
        this.cardID = cardID;
    }

    public String getDetail_address() {
        return detail_address;
    }

    public void setDetail_address(String detail_address) {
        this.detail_address = detail_address;
    }

    public String getRegTime() {
        return regTime;
    }

    public void setRegTime(String regTime) {
        this.regTime = regTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public Region getRegion() {
        return region;
    }

    @Override
    public String toString() {
        return "Customer [cardID=" + cardID + ", detail_address=" + detail_address + ", email=" + email + ", gender="
                + gender + ", id=" + id + ", imgUrl=" + imgUrl + ", intro=" + intro + ", level=" + level + ", pass="
                + pass + ", realname=" + realname + ", regTime=" + regTime + ", region=" + region + ", state=" + state
                + ", tel=" + tel + ", username=" + username + "]";
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

}
