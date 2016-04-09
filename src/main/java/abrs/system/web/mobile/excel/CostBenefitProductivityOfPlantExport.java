package abrs.system.web.mobile.excel;

/**
 * Created by Edifi_000 on 2016-04-10.
 */

import abrs.system.dao.Entity.CostBenefitProductivityOfPlant;

/**
 * 种植业产品生产成本、收益与劳动生产率
 */
public class CostBenefitProductivityOfPlantExport extends BaseExport{

    public CostBenefitProductivityOfPlant[] getList_CostBenefitProductivityOfPlant() {
        return list_CostBenefitProductivityOfPlant;
    }

    public void setList_CostBenefitProductivityOfPlant(CostBenefitProductivityOfPlant[] list_CostBenefitProductivityOfPlant) {
        this.list_CostBenefitProductivityOfPlant = list_CostBenefitProductivityOfPlant;
    }

    CostBenefitProductivityOfPlant[] list_CostBenefitProductivityOfPlant;
}
