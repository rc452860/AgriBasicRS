package abrs.system.dao.Entity;

/**
 * Created by Edifi_000 on 2016-03-22.
 */

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;

/**
 * ũ��������Ϣ
 */
@Document(collection = "Farmer")
public class Farmer {
    @Id
    private String id;

    private String registration_form_id;//�������

    private int no;//���
    private String region_no; //�����������
    private String region; //���������
    private String name;//����
    private String sex;//�Ա�
    private int age;//����
    private String familypopulation;//��ͥ�˿�

    //��ϵ��ʽ
    private String contact_landline;//����
    private String contact_phone;//�ֻ�

    //�а��������Ķ)
    private double contract_total;//�ϼ�
    private double contract_total_exchange;//��ת�ϼ�
    private double contract_paddyfield;//ˮ��
    private double contract_paddyfield_exchange;//ˮ������ת
    private double contract_dryfield;//����
    private double contract_dryfield_exchange;//��������ת

    //����ũ������ֲ���
    private double plantingarea_xiaomai;//С��
    private double plantingarea_malingshu;//������
    private double plantingarea_youcaizi;//�Ͳ���
    private double plantingarea_zhongdao;//�е�
    private double plantingarea_wandao;//��
    private double plantingarea_yumi;//����
    private double plantingarea_dadou;//��
    private double plantingarea_hongshu;//����
    private double plantingarea_mianhua;//�޻�
    private double plantingarea_huasheng;//����
    private double plantingarea_zhima;//֥��
    private double plantingarea_vegetable_facility;//��ʩ�߲�
    private double plantingarea_vegetables_outdoors;//¶���߲�

    private String note;//��ע

    private int flag;//��ʶ���ڱ��ɾ����ע����״̬ 10-���ߣ�21-����ע����22-�ʸ�ȡ��

    //�Ǳ���ʾ��Ϣ
    private String house_no;//���ƺ�
    private String zip_code; //�ʱ�
    private String nation;//����
    private String education;//�Ļ��̶�
    private String political_affiliation;//������ò
    private int insurance;//�Ƿ�α���0-��1-��
    private Date create_date = new Date();//����ʱ��
    private Date record_date;//¼����Ϣ����
    private Date update_date;//�޸���Ϣ����
    private String record_person;//¼����Ա
    private String update_person;//�޸���Ա

    public Farmer(){

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRegistration_form_id() {
        return registration_form_id;
    }

    public void setRegistration_form_id(String registration_form_id) {
        this.registration_form_id = registration_form_id;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getRegion_no() {
        return region_no;
    }

    public void setRegion_no(String region_no) {
        this.region_no = region_no;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getFamilypopulation() {
        return familypopulation;
    }

    public void setFamilypopulation(String familypopulation) {
        this.familypopulation = familypopulation;
    }

    public String getContact_landline() {
        return contact_landline;
    }

    public void setContact_landline(String contact_landline) {
        this.contact_landline = contact_landline;
    }

    public String getContact_phone() {
        return contact_phone;
    }

    public void setContact_phone(String contact_phone) {
        this.contact_phone = contact_phone;
    }

    public double getContract_total() {
        return contract_total;
    }

    public void setContract_total(double contract_total) {
        this.contract_total = contract_total;
    }

    public double getContract_total_exchange() {
        return contract_total_exchange;
    }

    public void setContract_total_exchange(double contract_total_exchange) {
        this.contract_total_exchange = contract_total_exchange;
    }

    public double getContract_paddyfield() {
        return contract_paddyfield;
    }

    public void setContract_paddyfield(double contract_paddyfield) {
        this.contract_paddyfield = contract_paddyfield;
    }

    public double getContract_paddyfield_exchange() {
        return contract_paddyfield_exchange;
    }

    public void setContract_paddyfield_exchange(double contract_paddyfield_exchange) {
        this.contract_paddyfield_exchange = contract_paddyfield_exchange;
    }

    public double getContract_dryfield() {
        return contract_dryfield;
    }

    public void setContract_dryfield(double contract_dryfield) {
        this.contract_dryfield = contract_dryfield;
    }

    public double getContract_dryfield_exchange() {
        return contract_dryfield_exchange;
    }

    public void setContract_dryfield_exchange(double contract_dryfield_exchange) {
        this.contract_dryfield_exchange = contract_dryfield_exchange;
    }

    public double getPlantingarea_xiaomai() {
        return plantingarea_xiaomai;
    }

    public void setPlantingarea_xiaomai(double plantingarea_xiaomai) {
        this.plantingarea_xiaomai = plantingarea_xiaomai;
    }

    public double getPlantingarea_malingshu() {
        return plantingarea_malingshu;
    }

    public void setPlantingarea_malingshu(double plantingarea_malingshu) {
        this.plantingarea_malingshu = plantingarea_malingshu;
    }

    public double getPlantingarea_youcaizi() {
        return plantingarea_youcaizi;
    }

    public void setPlantingarea_youcaizi(double plantingarea_youcaizi) {
        this.plantingarea_youcaizi = plantingarea_youcaizi;
    }

    public double getPlantingarea_zhongdao() {
        return plantingarea_zhongdao;
    }

    public void setPlantingarea_zhongdao(double plantingarea_zhongdao) {
        this.plantingarea_zhongdao = plantingarea_zhongdao;
    }

    public double getPlantingarea_wandao() {
        return plantingarea_wandao;
    }

    public void setPlantingarea_wandao(double plantingarea_wandao) {
        this.plantingarea_wandao = plantingarea_wandao;
    }

    public double getPlantingarea_yumi() {
        return plantingarea_yumi;
    }

    public void setPlantingarea_yumi(double plantingarea_yumi) {
        this.plantingarea_yumi = plantingarea_yumi;
    }

    public double getPlantingarea_dadou() {
        return plantingarea_dadou;
    }

    public void setPlantingarea_dadou(double plantingarea_dadou) {
        this.plantingarea_dadou = plantingarea_dadou;
    }

    public double getPlantingarea_hongshu() {
        return plantingarea_hongshu;
    }

    public void setPlantingarea_hongshu(double plantingarea_hongshu) {
        this.plantingarea_hongshu = plantingarea_hongshu;
    }

    public double getPlantingarea_mianhua() {
        return plantingarea_mianhua;
    }

    public void setPlantingarea_mianhua(double plantingarea_mianhua) {
        this.plantingarea_mianhua = plantingarea_mianhua;
    }

    public double getPlantingarea_huasheng() {
        return plantingarea_huasheng;
    }

    public void setPlantingarea_huasheng(double plantingarea_huasheng) {
        this.plantingarea_huasheng = plantingarea_huasheng;
    }

    public double getPlantingarea_zhima() {
        return plantingarea_zhima;
    }

    public void setPlantingarea_zhima(double plantingarea_zhima) {
        this.plantingarea_zhima = plantingarea_zhima;
    }

    public double getPlantingarea_vegetable_facility() {
        return plantingarea_vegetable_facility;
    }

    public void setPlantingarea_vegetable_facility(double plantingarea_vegetable_facility) {
        this.plantingarea_vegetable_facility = plantingarea_vegetable_facility;
    }

    public double getPlantingarea_vegetables_outdoors() {
        return plantingarea_vegetables_outdoors;
    }

    public void setPlantingarea_vegetables_outdoors(double plantingarea_vegetables_outdoors) {
        this.plantingarea_vegetables_outdoors = plantingarea_vegetables_outdoors;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public String getHouse_no() {
        return house_no;
    }

    public void setHouse_no(String house_no) {
        this.house_no = house_no;
    }

    public String getZip_code() {
        return zip_code;
    }

    public void setZip_code(String zip_code) {
        this.zip_code = zip_code;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getPolitical_affiliation() {
        return political_affiliation;
    }

    public void setPolitical_affiliation(String political_affiliation) {
        this.political_affiliation = political_affiliation;
    }

    public int getInsurance() {
        return insurance;
    }

    public void setInsurance(int insurance) {
        this.insurance = insurance;
    }

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

    public Date getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(Date update_date) {
        this.update_date = update_date;
    }

    public String getRecord_person() {
        return record_person;
    }

    public void setRecord_person(String record_person) {
        this.record_person = record_person;
    }

    public String getUpdate_person() {
        return update_person;
    }

    public void setUpdate_person(String update_person) {
        this.update_person = update_person;
    }
}
