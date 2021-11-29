package pur;


//公司或商家
public class Company {
    int id;//公司编号
    String name;//公司名称
    String tel;//公司联系电话
    String email;//公司邮箱
    String chief;//公司负责人
    String detail_address;//公司地址
    Region region;//公司所在区ID

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getChief() {
        return chief;
    }

    public void setChief(String chief) {
        this.chief = chief;
    }

    public String getDetail_address() {
        return detail_address;
    }

    public void setDetail_address(String detail_address) {
        this.detail_address = detail_address;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }
}
