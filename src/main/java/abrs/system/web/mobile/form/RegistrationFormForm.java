package abrs.system.web.mobile.form;

import abrs.system.dao.Entity.RegistrationForm;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.lang.reflect.Field;
import java.util.Date;

/**
 * Created by Edifi_000 on 2016-03-29.
 */
public class RegistrationFormForm {
    private String id;

    private String no;//编号

    private String name;//名称

    private String region_id;//区域单位编号

    private String form_type;//表格类型（根据固定的提供的excel表，从而为打印提供模版）

    private Boolean multidata;//判断是否多数据表(农市（基）1-1表、1-2表)或单数据表(农市（基）3-1表、3-2表)

    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")  //取日期时使用
    @DateTimeFormat(pattern = "yyyy-MM-dd")//存日期时使用
    private Date create_date = new Date();//创建时间

    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")  //取日期时使用
    @DateTimeFormat(pattern = "yyyy-MM-dd")//存日期时使用
    private Date record_date;//填表时间

    @JsonFormat(pattern = "yyyy-MM-dd",timezone="GMT+8")  //取日期时使用
    @DateTimeFormat(pattern = "yyyy-MM-dd")//存日期时使用
    private Date end_date;//截止时间

    private String record_entity;//填报单位

    private String record_person_name;//调查员姓名
    private String record_person_phone;//调查员联系电话

    public RegistrationForm getEntity() throws NoSuchFieldException, IllegalAccessException {
        RegistrationForm entity = new RegistrationForm();
        Field[] formFileds = this.getClass().getDeclaredFields();
        Class  entityClass = entity.getClass();
        for (Field field : formFileds){
            field.setAccessible(true);
            Field entityField = entityClass.getDeclaredField(field.getName());
            entityField.setAccessible(true);
            entityField.set(entity,field.get(this));
        }
        return entity;
    }


    public static RegistrationFormForm EntityToForm(RegistrationForm entity) throws NoSuchFieldException, IllegalAccessException {
        RegistrationFormForm form = new RegistrationFormForm();
        Field[] formFields = form.getClass().getDeclaredFields();

        for (Field field : formFields){
            field.setAccessible(true);
            Field farmerField = entity.getClass().getDeclaredField(field.getName());
            field.setAccessible(true);
            farmerField.setAccessible(true);
            field.set(form,farmerField.get(entity));
        }
        return form;
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

    public String getRegion_id() {
        return region_id;
    }

    public void setRegion_id(String region_id) {
        this.region_id = region_id;
    }

    public String getForm_type() {
        return form_type;
    }

    public void setForm_type(String form_type) {
        this.form_type = form_type;
    }

    public Boolean getMultidata() {
        return multidata;
    }

    public void setMultidata(Boolean multidata) { this.multidata = multidata; }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getRecord_date() {
        return record_date;
    }

    public void setRecord_date(Date record_date) {
        this.record_date = record_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public String getRecord_entity() {
        return record_entity;
    }

    public void setRecord_entity(String record_entity) {
        this.record_entity = record_entity;
    }

    public String getRecord_person_name() {
        return record_person_name;
    }

    public void setRecord_person_name(String record_person_name) {
        this.record_person_name = record_person_name;
    }

    public String getRecord_person_phone() {
        return record_person_phone;
    }

    public void setRecord_person_phone(String record_person_phone) {
        this.record_person_phone = record_person_phone;
    }
}
