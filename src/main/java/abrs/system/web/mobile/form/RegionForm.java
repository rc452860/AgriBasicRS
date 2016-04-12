package abrs.system.web.mobile.form;

import abrs.system.dao.Entity.Region;
import java.lang.reflect.Field;

/**
 * Created by Edifi_000 on 2016-03-29.
 */
public class RegionForm {

    private String id;

    private String no;//编号

    private String name;//名称

   /* private String fullname;//全称

    private String fatherno;//父区域单位编号

    private String shortnoone;//短码1

    private String shortnotwo;//短码2

    private int flag;//标识*/

    public Region getRegion() throws NoSuchFieldException, IllegalAccessException {
        Region region = new Region();
        Field[] formFileds = this.getClass().getDeclaredFields();
        Class  entityClass = region.getClass();
        for (Field field : formFileds){
            field.setAccessible(true);
            Field entityField = entityClass.getDeclaredField(field.getName());
            entityField.setAccessible(true);
            entityField.set(region,field.get(this));
        }
        return region;
    }


    public static RegionForm RegionToForm(Region region) throws NoSuchFieldException, IllegalAccessException {
        RegionForm regionForm = new RegionForm();
        Field[] formFields = regionForm.getClass().getDeclaredFields();

        for (Field field : formFields){
            field.setAccessible(true);
            Field farmerField = region.getClass().getDeclaredField(field.getName());
            field.setAccessible(true);
            farmerField.setAccessible(true);
            field.set(regionForm,farmerField.get(region));
        }
        return regionForm;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

   /* public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getFatherno() {
        return fatherno;
    }

    public void setFatherno(String fatherno) {
        this.fatherno = fatherno;
    }

    public String getShortnoone() {
        return shortnoone;
    }

    public void setShortnoone(String shortnoone) {
        this.shortnoone = shortnoone;
    }

    public String getShortnotwo() {
        return shortnotwo;
    }

    public void setShortnotwo(String shortnotwo) {
        this.shortnotwo = shortnotwo;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }*/
}
