package abrs.system.web.mobile.form;

import abrs.system.dao.Entity.CostBenefitProductivityOfPlant;

/**
 * Created by Edifi_000 on 2016-04-03.
 */
public class CostBenefitProductivityOfPlantForm {

    public CostBenefitProductivityOfPlant getCostBenefitProductivityOfPlant() {
        return costBenefitProductivityOfPlant;
    }

    public void setCostBenefitProductivityOfPlant(CostBenefitProductivityOfPlant costBenefitProductivityOfPlant) {
        this.costBenefitProductivityOfPlant = costBenefitProductivityOfPlant;
    }

    private CostBenefitProductivityOfPlant costBenefitProductivityOfPlant = new CostBenefitProductivityOfPlant();
}
