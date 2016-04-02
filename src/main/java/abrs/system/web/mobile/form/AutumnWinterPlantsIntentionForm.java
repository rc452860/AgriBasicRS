package abrs.system.web.mobile.form;

import abrs.system.dao.Entity.AutumnWinterPlantsIntention;

/**
 * Created by Edifi_000 on 2016-04-02.
 */
public class AutumnWinterPlantsIntentionForm {

    public AutumnWinterPlantsIntention getAutumnWinterPlantsIntention() {
        return autumnWinterPlantsIntention;
    }

    public void setAutumnWinterPlantsIntention(AutumnWinterPlantsIntention autumnWinterPlantsIntention) {
        this.autumnWinterPlantsIntention = autumnWinterPlantsIntention;
    }

    private AutumnWinterPlantsIntention autumnWinterPlantsIntention = new AutumnWinterPlantsIntention();
}
