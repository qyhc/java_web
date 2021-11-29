package pur;

public class Property {
    int id;//
    String chin_name;//属性中文名
    String en_name;//属性英文名
    Category category;//属性所属分类

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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Property{" +
                "id=" + id +
                ", chin_name='" + chin_name + '\'' +
                ", en_name='" + en_name + '\'' +
                ", category=" + category +
                '}';
    }
}
