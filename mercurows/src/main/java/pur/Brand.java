package pur;

public class Brand {
    int id;//
    String chin_name;//品牌中文名
    String en_name;//品牌英文名
    String intro;//品牌介绍
    String logo;//品牌LOGO
    Category category;//品牌所属分类

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getChin_name() {
        return chin_name;
    }

    public void setChin_name(String chin_name) {
        this.chin_name = chin_name;
    }

    public String getEn_name() {
        return en_name;
    }

    public void setEn_name(String en_name) {
        this.en_name = en_name;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
        System.out.print("Y");
    }
}
