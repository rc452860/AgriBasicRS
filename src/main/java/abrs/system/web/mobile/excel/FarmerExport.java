package abrs.system.web.mobile.excel;

import abrs.system.dao.Entity.Farmer;

/**
 * Created by Edifi_000 on 2016-04-10.
 */
/**
 * 农户基本信息导出实体(襄州区基点农户基本信息汇总表修改后.xls)
 */
public class FarmerExport extends BaseExport {

    private final String TemplateFileName = "襄州区基点农户基本信息汇总表修改后.xls";

    public String getTemplateFileName()
    {
        return this.TemplateFileName;
    }

    public Farmer[] getList_Farmer() {
        return list_Farmer;
    }

    public void setList_Farmer(Farmer[] list_Farmer) {
        this.list_Farmer = list_Farmer;
    }

    private Farmer[] list_Farmer;
}
