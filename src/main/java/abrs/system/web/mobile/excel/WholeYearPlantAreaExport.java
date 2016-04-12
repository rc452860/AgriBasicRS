package abrs.system.web.mobile.excel;

/**
 * Created by Edifi_000 on 2016-04-10.
 */

import abrs.system.dao.Entity.WholeYearPlantArea;

/**
 * 全年农作物播种面积意向（预计）调查(农市（基）1-1表、1-2表.xls)
 */
public class WholeYearPlantAreaExport extends BaseExport{

    public WholeYearPlantArea[] getList_WholeYearPlantArea() {
        return list_WholeYearPlantArea;
    }

    public void setList_WholeYearPlantArea(WholeYearPlantArea[] list_WholeYearPlantArea) {
        this.list_WholeYearPlantArea = list_WholeYearPlantArea;
    }

    private WholeYearPlantArea[] list_WholeYearPlantArea;
}
