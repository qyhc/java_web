package pur;

public class Orders {
    int id;//订单编号
    double totalSum;//订单总金额
    double carriage;//运费
    double realSum;//实付总金额
    int totalNum;//总数量
    String receiverAddress;//收件地址
    String receiverName;//收件人姓名
    String receiverTel;//收件人电话
    String state;//订单状态
    String orderTime;//下单时间
    String payTime;//支付时间
    Customer customer;//客户
    String payType;//支付来源

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getTotalSum() {
        return totalSum;
    }

    public void setTotalSum(double totalSum) {
        this.totalSum = totalSum;
    }

    public double getCarriage() {
        return carriage;
    }

    public void setCarriage(double carriage) {
        this.carriage = carriage;
    }

    public double getRealSum() {
        return realSum;
    }

    public void setRealSum(double realSum) {
        this.realSum = realSum;
    }

    public int getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public String getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverTel() {
        return receiverTel;
    }

    public void setReceiverTel(String receiverTel) {
        this.receiverTel = receiverTel;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getPayTime() {
        return payTime;
    }

    public void setPayTime(String payTime) {
        this.payTime = payTime;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType;
    }


    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", totalSum=" + totalSum +
                ", carriage=" + carriage +
                ", realSum=" + realSum +
                ", totalNum=" + totalNum +
                ", receiverAddress='" + receiverAddress + '\'' +
                ", receiverName='" + receiverName + '\'' +
                ", receiverTel='" + receiverTel + '\'' +
                ", state='" + state + '\'' +
                ", orderTime=" + orderTime +
                ", payTime=" + payTime +
                ", customer=" + customer +
                ", payType='" + payType + '\'' +
                '}';
    }
}
