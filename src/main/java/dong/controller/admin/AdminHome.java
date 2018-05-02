package dong.controller.admin;

import dong.model.CustomReponse.ModelReponse;
import dong.model.Customer;
import dong.model.Product;
import dong.service.CustomerService;
import dong.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@Controller
@RequestMapping("/admin")
public class AdminHome {
    private static final int PAGE_SIZE = 5;
    @Autowired
    private ProductService productService;

    @Autowired
    private CustomerService customerService;

    @RequestMapping()
    public String adminPage() {
        return "admin/home";
    }

    @RequestMapping(value = "/productInventory",method = RequestMethod.GET)
    public String productInventory(Model model) {
        Product product = new Product();
        product.setProductCategory("instrument");
        product.setProductCondition("new");
        product.setProductStatus("active");
        model.addAttribute("product", product);
        return "admin/productInventory";
    }
    @RequestMapping(value = "/productList",method = RequestMethod.GET)
    public @ResponseBody ModelReponse getListJson(@RequestParam("page") int page){
        List<Product> products = productService.findAll(page-1,PAGE_SIZE);
        return new ModelReponse(products,productService.getProductList().size());
    }

    @RequestMapping("/customer")
    public String customerManagement(Model model) {
        List<Customer> customerList = customerService.getAllCustomers();
        model.addAttribute(customerList);

        return "customerManagement";
    }
}
