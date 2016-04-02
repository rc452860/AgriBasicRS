package abrs.system.web.mobile.form;

import abrs.system.dao.Entity.CostBenefitOfPig;

/**
 * Created by Edifi_000 on 2016-04-03.
 */
public class CostBenefitOfPigForm {

    public CostBenefitOfPig getCostBenefitOfPig() {
        return costBenefitOfPig;
    }

    public void setCostBenefitOfPig(CostBenefitOfPig costBenefitOfPig) {
        this.costBenefitOfPig = costBenefitOfPig;
    }

    private CostBenefitOfPig costBenefitOfPig = new CostBenefitOfPig();
}
