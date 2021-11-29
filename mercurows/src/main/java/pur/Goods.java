package pur;

public class Goods {
    int id;//商品ID
    String keywords;//商品搜索关键词
    String code;//商品内部编码
    String spec;//商品英文介绍
    String ch_spec;//商品中文介绍
    double in_price;//商品进货价
    double out_price;//商品销售价
    int stock;//商品库存
    String imgUrl;//商品图片
    Product product;//商品所属产品，如huawei p40 金色 属于huawei产品

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public String getCh_spec() {
        return ch_spec;
    }

    public void setCh_spec(String ch_spec) {
        this.ch_spec = ch_spec;
    }

    public double getIn_price() {
        return in_price;
    }

    public void setIn_price(double in_price) {
        this.in_price = in_price;
    }

    public double getOut_price() {
        return out_price;
    }

    public void setOut_price(double out_price) {
        this.out_price = out_price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", keywords='" + keywords + '\'' +
                ", code='" + code + '\'' +
                ", spec='" + spec + '\'' +
                ", ch_spec='" + ch_spec + '\'' +
                ", in_price=" + in_price +
                ", out_price=" + out_price +
                ", stock=" + stock +
                ", imgUrl='" + imgUrl + '\'' +
                ", product=" + product +
                '}';
    }
}
