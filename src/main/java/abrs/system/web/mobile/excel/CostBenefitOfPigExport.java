package abrs.system.web.mobile.excel;

/**
 * Created by Edifi_000 on 2016-04-10.
 */

import abrs.system.dao.Entity.CostBenefitOfPig;

/**
 * 出栏肥猪生产成本、收益调查表
 */
public class CostBenefitOfPigExport extends BaseExport{

    public CostBenefitOfPig[] getList_CostBenefitOfPig() {
        return list_CostBenefitOfPig;
    }

    public void setList_CostBenefitOfPig(CostBenefitOfPig[] list_CostBenefitOfPig) {
        this.list_CostBenefitOfPig = list_CostBenefitOfPig;
    }

    CostBenefitOfPig[] list_CostBenefitOfPig;
}
