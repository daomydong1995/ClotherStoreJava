package dong.service.impl;

import dong.dao.CustomerDao;
import dong.model.Customer;
import dong.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    public void addCustomer (Customer customer) {
        customerDao.addCustomer(customer);
    }

    public Customer getCustomerById (int customerId) {
        return customerDao.getCustomerById(customerId);
    }

    public Customer getCustomerByUsername (String username) {
        return customerDao.getCustomerByUsername(username);
    }

    public List<Customer> getAllCustomers() {
        return customerDao.getAllCustomers();
    }

}
