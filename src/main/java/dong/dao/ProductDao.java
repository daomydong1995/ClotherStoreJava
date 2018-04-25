package dong.dao;

import dong.model.Product;

import java.util.List;

public interface ProductDao {

    Product getProductById(int id);

    List<Product> getProductList();

    void addProduct(Product product);

    void editProduct(Product product);

    void deleteProduct(Product product);
}
