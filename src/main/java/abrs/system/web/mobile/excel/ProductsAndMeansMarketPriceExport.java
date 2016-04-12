package abrs.system.web.mobile.excel;

/**
 * Created by Edifi_000 on 2016-04-10.
 */

import abrs.system.dao.Entity.ProductsAndMeansMarketPrice;

/**
 * 主要农产品和农业生产资料价格监测旬报表导出实体(市场价格)(2016主要产品价格监测表.xls)
 */
public class ProductsAndMeansMarketPriceExport {

    public ProductsAndMeansMarketPrice[] getList_ProductsAndMeansMarketPrice() {
        return list_ProductsAndMeansMarketPrice;
    }

    public void setList_ProductsAndMeansMarketPrice(ProductsAndMeansMarketPrice[] list_ProductsAndMeansMarketPrice) {
        this.list_ProductsAndMeansMarketPrice = list_ProductsAndMeansMarketPrice;
    }

    private ProductsAndMeansMarketPrice[] list_ProductsAndMeansMarketPrice;
}
