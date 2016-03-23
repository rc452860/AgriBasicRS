package abrs.system.dao.Entity;

/**
 * Created by Edifi_000 on 2016-03-22.
 */

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;

/**
 * �������Ϣ
 */
@Document(collection = "RegistrationForm")
public class RegistrationForm {
    @Id
    private String id;

    private String no;//���

    private String name;//����

    private String form_type;//������ͣ����ݹ̶����ṩ��excel���Ӷ�Ϊ��ӡ�ṩģ�棩

    private Boolean multidata;//�ж��Ƿ�����ݱ�(ũ�У�����1-1��1-2��)�����ݱ�(ũ�У�����3-1��3-2��)

    private Date create_date = new Date();//����ʱ��

    private Date record_date;//���ʱ��

    private Date end_date;//��ֹʱ��

    private String record_entity;//���λ

    private String record_person_name;//����Ա����
    private String record_person_phone;//����Ա��ϵ�绰

    public RegistrationForm(){}

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
