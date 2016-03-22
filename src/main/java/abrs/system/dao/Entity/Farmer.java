package abrs.system.dao.Entity;

/**
 * Created by Edifi_000 on 2016-03-22.
 */

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 用户信息
 */
@Document(collection = "Farmer")
public class Farmer {
    @Id
    private String id;

    private String registration_form_id;//调查表编号

    private int no;//序号
    private String townvillage; //所在镇村组
    private String name;//姓名
    private String sex;//性别
    private int age;//年龄
    private String familypopulation;//家庭人口

    //联系方式
    private String contact_landline;//座机
    private String contact_phone;//手机

    //承包地面积（亩)
    private double contract_total;//合计
    private double contract_total_exchange;//流转合计
    private double contract_paddyfield;//水田
    private double contract_paddyfield_exchange;//水田中流转
    private double contract_dryfield;//旱地
    private double contract_dryfield_exchange;//旱地中流转

    //常年农作物种植面积
    private double plantingarea_xiaomai;//小麦
    private double plantingarea_malingshu;//马铃薯
    private double plantingarea_youcaizi;//油菜籽
    private double plantingarea_zhongdao;//中稻
    private double plantingarea_wandao;//晚稻
    private double plantingarea_yumi;//玉米
    private double plantingarea_dadou;//大豆
    private double plantingarea_hongshu;//红薯
    private double plantingarea_mianhua;//棉花
    private double plantingarea_huasheng;//花生
    private double plantingarea_zhima;//芝麻
    private double plantingarea_vegetable_facility;//设施蔬菜
    private double plantingarea_vegetables_outdoors;//露天蔬菜

    private String note;//备注

    private int flag;//标识用于标记删除、注销等状态

    public Farmer(){

    }

    public String getId() {
        return id;
    }

    public String getRegistration_form_id() {
        return registration_form_id;
    }

    public int getNo() {
        return no;
    }

    public String getTownvillage() {
        return townvillage;
    }

    public String getName() {
        return name;
    }

    public String getSex() {
        return sex;
    }

    public int getAge() {
        return age;
    }

    public String getFamilypopulation() {
        return familypopulation;
    }

    public String getContact_landline() {
        return contact_landline;
    }

    public String getContact_phone() {
        return contact_phone;
    }

    public double getContract_total() {
        return contract_total;
    }

    public double getContract_total_exchange() {
        return contract_total_exchange;
    }

    public double getContract_paddyfield() {
        return contract_paddyfield;
    }

    public double getContract_paddyfield_exchange() {
        return contract_paddyfield_exchange;
    }

    public double getContract_dryfield() {
        return contract_dryfield;
    }

    public double getContract_dryfield_exchange() {
        return contract_dryfield_exchange;
    }

    public double getPlantingarea_xiaomai() {
        return plantingarea_xiaomai;
    }

    public double getPlantingarea_malingshu() {
        return plantingarea_malingshu;
    }

    public double getPlantingarea_youcaizi() {
        return plantingarea_youcaizi;
    }

    public double getPlantingarea_zhongdao() {
        return plantingarea_zhongdao;
    }

    public double getPlantingarea_wandao() {
        return plantingarea_wandao;
    }

    public double getPlantingarea_yumi() {
        return plantingarea_yumi;
    }

    public double getPlantingarea_dadou() {
        return plantingarea_dadou;
    }

    public double getPlantingarea_hongshu() {
        return plantingarea_hongshu;
    }

    public double getPlantingarea_mianhua() {
        return plantingarea_mianhua;
    }

    public double getPlantingarea_huasheng() {
        return plantingarea_huasheng;
    }

    public double getPlantingarea_zhima() {
        return plantingarea_zhima;
    }

    public double getPlantingarea_vegetable_facility() {
        return plantingarea_vegetable_facility;
    }

    public double getPlantingarea_vegetables_outdoors() {
        return plantingarea_vegetables_outdoors;
    }

    public String getNote() {
        return note;
    }

    public int getFlag() {
        return flag;
    }


    public void setId(String id) {
        this.id = id;
    }

    public void setRegistration_form_id(String registration_form_id)
    {
        this.registration_form_id = registration_form_id;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public void setTownvillage(String townvillage) {
        this.townvillage = townvillage;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setFamilypopulation(String familypopulation) {
        this.familypopulation = familypopulation;
    }

    public void setContact_landline(String contact_landline) {
        this.contact_landline = contact_landline;
    }

    public void setContact_phone(String contact_phone) {
        this.contact_phone = contact_phone;
    }

    public void setContract_total(double contract_total) {
        this.contract_total = contract_total;
    }

    public void setContract_total_exchange(double contract_total_exchange) {
        this.contract_total_exchange = contract_total_exchange;
    }

    public void setContract_paddyfield(double contract_paddyfield) {
        this.contract_paddyfield = contract_paddyfield;
    }

    public void setContract_paddyfield_exchange(double contract_paddyfield_exchange) {
        this.contract_paddyfield_exchange = contract_paddyfield_exchange;
    }

    public void setContract_dryfield(double contract_dryfield) {
        this.contract_dryfield = contract_dryfield;
    }

    public void setContract_dryfield_exchange(double contract_dryfield_exchange) {
        this.contract_dryfield_exchange = contract_dryfield_exchange;
    }

    public void setPlantingarea_xiaomai(double plantingarea_xiaomai) {
        this.plantingarea_xiaomai = plantingarea_xiaomai;
    }

    public void setPlantingarea_malingshu(double plantingarea_malingshu) {
        this.plantingarea_malingshu = plantingarea_malingshu;
    }

    public void setPlantingarea_youcaizi(double plantingarea_youcaizi) {
        this.plantingarea_youcaizi = plantingarea_youcaizi;
    }

    public void setPlantingarea_zhongdao(double plantingarea_zhongdao) {
        this.plantingarea_zhongdao = plantingarea_zhongdao;
    }

    public void setPlantingarea_wandao(double plantingarea_wandao) {
        this.plantingarea_wandao = plantingarea_wandao;
    }

    public void setPlantingarea_yumi(double plantingarea_yumi) {
        this.plantingarea_yumi = plantingarea_yumi;
    }

    public void setPlantingarea_dadou(double plantingarea_dadou) {
        this.plantingarea_dadou = plantingarea_dadou;
    }

    public void setPlantingarea_hongshu(double plantingarea_hongshu) {
        this.plantingarea_hongshu = plantingarea_hongshu;
    }

    public void setPlantingarea_mianhua(double plantingarea_mianhua) {
        this.plantingarea_mianhua = plantingarea_mianhua;
    }

    public void setPlantingarea_huasheng(double plantingarea_huasheng) {
        this.plantingarea_huasheng = plantingarea_huasheng;
    }

    public void setPlantingarea_zhima(double plantingarea_zhima) {
        this.plantingarea_zhima = plantingarea_zhima;
    }

    public void setPlantingarea_vegetable_facility(double plantingarea_vegetable_facility) {
        this.plantingarea_vegetable_facility = plantingarea_vegetable_facility;
    }

    public void setPlantingarea_vegetables_outdoors(double plantingarea_vegetables_outdoors) {
        this.plantingarea_vegetables_outdoors = plantingarea_vegetables_outdoors;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }


}
