package abrs.system.web.mobile.form;

import abrs.system.dao.Entity.ProductsAndMeansMarketPrice;

/**
 * Created by Edifi_000 on 2016-04-04.
 */
public class ProductsAndMeansMarketPriceForm {

    public ProductsAndMeansMarketPrice getProductsAndMeansMarketPrice() {
        return productsAndMeansMarketPrice;
    }

    public void setProductsAndMeansMarketPrice(ProductsAndMeansMarketPrice productsAndMeansMarketPrice) {
        this.productsAndMeansMarketPrice = productsAndMeansMarketPrice;
    }

    private ProductsAndMeansMarketPrice productsAndMeansMarketPrice = new ProductsAndMeansMarketPrice();
}
