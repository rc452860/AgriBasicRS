package abrs.system.web.mobile.excel;

import abrs.system.dao.Entity.RegistrationForm;

import java.util.Map;

/**
 * Created by Edifi_000 on 2016-04-09.
 */
public class BaseExport {

    private RegistrationForm registrationForm;

    public String getClassName()
    {
        return this.getClass().getName();
    }

    private String realPath;

    public String getRealPath() {
        return realPath;
    }

    public void setRealPath(String realPath) {
        this.realPath = realPath;
    }

    private String TemplateFileName;

    public String getTemplateFileName()
    {
        return this.TemplateFileName;
    }

    private int increaseType;

    public void setIncreaseType(int increaseType) {
        this.increaseType = increaseType;
    }

    public int getIncreaseType() {
        return increaseType;
    }

    private int increaseCount;

    public void setIncreaseCount(int increaseCount) {
        this.increaseCount = increaseCount;
    }

    public int getIncreaseCount() {
        return increaseCount;
    }

    public byte[] Export(){

        EntiyToMapHelper helper = new EntiyToMapHelper(this);
        Map<String,String> dicStringInfo = helper.GetStringInfoMap();
        Map<String,Double> dicDoubleInfo = helper.GetDoubleInfoMap();

        ExcelOP excel = new ExcelOP();

        try{
            return excel.GetExcel(excel.PrepareWorkBookForDic(this.getRealPath(), this.getTemplateFileName(), this.getIncreaseType(), this.getIncreaseCount()), dicStringInfo, dicDoubleInfo);
        }
        catch (Exception ex){
            System.out.print(ex.toString());
        }

        return null;
    }
}
