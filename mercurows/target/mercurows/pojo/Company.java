package zj.com.pojo;

//公司或商家
public class Company {
    int id;//公司编号
    String name;//公司名称
    String tel;
    String email;
    String chief;//公司负责人
    String address;//公司地址

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
