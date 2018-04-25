package dong.service.impl;

import dong.dao.OrderHistoryDao;
import dong.model.Cart;
import dong.service.OrderHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class OrderHistoryServiceImpl implements OrderHistoryService {

    @Autowired
    private OrderHistoryDao orderHistoryDao;

    public void addOrderHistoryByCart (Cart cart) {
       orderHistoryDao.addOrderHistoryByCart(cart);
    }

}
