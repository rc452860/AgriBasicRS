package abrs.system.web.mobile.excel;

import abrs.system.dao.Entity.Farmer;

/**
 * Created by Edifi_000 on 2016-04-10.
 */
public class FarmerExport extends BaseExport {

    public Farmer[] getList_Farmer() {
        return list_Farmer;
    }

    public void setList_Farmer(Farmer[] list_Farmer) {
        this.list_Farmer = list_Farmer;
    }

    private Farmer[] list_Farmer;
}
