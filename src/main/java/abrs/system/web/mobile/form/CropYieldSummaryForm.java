package abrs.system.web.mobile.form;

import abrs.system.dao.Entity.CropYieldSummary;

/**
 * Created by Edifi_000 on 2016-04-04.
 */
public class CropYieldSummaryForm {

    public CropYieldSummary getCropYieldSummary() {
        return cropYieldSummary;
    }

    public void setCropYieldSummary(CropYieldSummary cropYieldSummary) {
        this.cropYieldSummary = cropYieldSummary;
    }

    private CropYieldSummary cropYieldSummary = new CropYieldSummary();
}
