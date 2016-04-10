package abrs.system.web.mobile.excel;

/**
 * Created by Edifi_000 on 2016-04-10.
 */

import abrs.system.dao.Entity.ProductsAndMeansFarmerPrice;

/**
 * 主要农产品和农业生产资料价格监测旬报表(农民售价)(2016主要产品价格监测表.xls)
 */

public class ProductsAndMeansFarmerPriceExport extends BaseExport{


    public ProductsAndMeansFarmerPrice[] getList_ProductsAndMeansFarmerPrice() {
        return list_ProductsAndMeansFarmerPrice;
    }

    public void setList_ProductsAndMeansFarmerPrice(ProductsAndMeansFarmerPrice[] list_ProductsAndMeansFarmerPrice) {
        this.list_ProductsAndMeansFarmerPrice = list_ProductsAndMeansFarmerPrice;
    }

    private ProductsAndMeansFarmerPrice[] list_ProductsAndMeansFarmerPrice;//长度为4
}
