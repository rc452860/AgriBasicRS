package abrs.system.web.mobile.form;

import abrs.system.dao.Entity.ProductsAndMeansFarmerPrice;

/**
 * Created by EdifierWill on 2016/4/3.
 */
public class ProductsAndMeansFarmerPriceForm {

    public ProductsAndMeansFarmerPrice getProductsAndMeansFarmerPrice() {
        return productsAndMeansFarmerPrice;
    }

    public void setProductsAndMeansFarmerPrice(ProductsAndMeansFarmerPrice productsAndMeansFarmerPrice) {
        this.productsAndMeansFarmerPrice = productsAndMeansFarmerPrice;
    }

    private ProductsAndMeansFarmerPrice productsAndMeansFarmerPrice = new ProductsAndMeansFarmerPrice();
}
