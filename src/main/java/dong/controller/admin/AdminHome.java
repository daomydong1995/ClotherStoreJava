package dong.controller.admin;

import dong.model.Customer;
import dong.model.Product;
import dong.service.CustomerService;
import dong.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
@Controller
@RequestMapping("/admin")
public class AdminHome {

    @Autowired
    private ProductService productService;

    @Autowired
    private CustomerService customerService;

    @RequestMapping()
    public String adminPage() {
        return "admin/home";
    }

    @RequestMapping("/productInventory")
    public String productInventory(Model model,Integer offset,Integer maxResults) {
        List<Product> products = productService.findAll(offset,maxResults);
        model.addAttribute("products", products);
        model.addAttribute("count", products.size());
        model.addAttribute("offset", offset);
        return "admin/productInventory";
    }

    @RequestMapping("/customer")
    public String customerManagement(Model model) {
        List<Customer> customerList = customerService.getAllCustomers();
        model.addAttribute(customerList);

        return "customerManagement";
    }
}
