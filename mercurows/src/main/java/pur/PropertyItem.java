package pur;

public class PropertyItem {
    int id;//
    String chin_name;//属性项中文名
    String en_name;//属性项英文名
    Property property;//属性项所属属性

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

    public Property getProperty() {
        return property;
    }

    public void setProperty(Property property) {
        this.property = property;
    }

    @Override
    public String toString() {
        return "PropertyItem{" +
                "id=" + id +
                ", chin_name='" + chin_name + '\'' +
                ", en_name='" + en_name + '\'' +
                ", property=" + property +
                '}';
    }
}
