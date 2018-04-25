package dong.dao;

import dong.model.Customer;

import java.util.List;

public interface CustomerDao {

    void addCustomer(Customer customer);

    Customer getCustomerById(int customerId);

    Customer getCustomerByUsername(String username);

    List<Customer> getAllCustomers();
}
