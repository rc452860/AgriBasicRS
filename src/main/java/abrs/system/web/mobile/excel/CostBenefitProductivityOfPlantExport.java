package abrs.system.web.mobile.excel;

/**
 * Created by Edifi_000 on 2016-04-10.
 */

import abrs.system.dao.Entity.CostBenefitProductivityOfPlant;

/**
 * 种植业产品生产成本、收益与劳动生产率导出实体(农作物生产成本、收益与劳动生产率调查表(新）.xls)
 */
public class CostBenefitProductivityOfPlantExport extends BaseExport{

    private final String TemplateFileName = "农作物生产成本、收益与劳动生产率调查表(新）.xls";

    public String getTemplateFileName()
    {
        return this.TemplateFileName;
    }

    public CostBenefitProductivityOfPlant[] getList_CostBenefitProductivityOfPlant() {
        return list_CostBenefitProductivityOfPlant;
    }

    public void setList_CostBenefitProductivityOfPlant(CostBenefitProductivityOfPlant[] list_CostBenefitProductivityOfPlant) {
        this.list_CostBenefitProductivityOfPlant = list_CostBenefitProductivityOfPlant;
    }

    CostBenefitProductivityOfPlant[] list_CostBenefitProductivityOfPlant;
}
