package dong.service;

import dong.model.Product;

import java.util.List;


public interface ProductService {

    Product getProductById(int id);

    List<Product> getProductList();
    List<Product> findAll(Integer offset, Integer maxResults);

    void addProduct(Product product);

    void editProduct(Product product);

    void deleteProduct(Product product);
}
