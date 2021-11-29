package zj.com.pojo;

//顾客
public class Customer {
    int id;
    String realname;//真实名
    String username;
    String password;
    String imgUrl;//头像
    String intro;//介绍
    String tel;
    String email;
    char gender;//性别
    String cid;//身份证
    String address;//通讯地址
    String regTime;//注册时间
    char state;//账户状态 '1'-激活 '0'--锁定
    char level;//会员等级  '1'-普通会员  '2'--黄金会员  '3'--钻石会员

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRegTime() {
        return regTime;
    }

    public void setRegTime(String regTime) {
        this.regTime = regTime;
    }

    public char getState() {
        return state;
    }

    public void setState(char state) {
        this.state = state;
    }

    public char getLevel() {
        return level;
    }

    public void setLevel(char level) {
        this.level = level;
    }
}
