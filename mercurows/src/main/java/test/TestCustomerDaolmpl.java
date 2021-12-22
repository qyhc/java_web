package test;

import dao.impl.CustomerDaoImpl;
import pur.Customer;
import pur.Region;

public class TestCustomerDaolmpl {
    public static void main(String[] st) {
        Customer cu = new Customer();
        cu.setUsername("mercurows");
        cu.setPass("666");
        cu.setTel("1234567");
        Region re = new Region();
        re.setId(90002);
        cu.setRegion_id(re);
        System.out.print(new CustomerDaoImpl().add(cu));
    }
}
