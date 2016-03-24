package abrs.system.dao.Entity;

/**
 * Created by Edifi_000 on 2016-03-22.
 */

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * ȫ��ũ���ﲥ���������Ԥ�ƣ�����(��һ��ϸ���RegistrationForm��ѯ�ɻ��ܱ�)
 */
@Document(collection = "WholeYearPlantArea")
public class WholeYearPlantArea {
    @Id
    private String id;

    private String farmer_id;//ũ��id

    private int form_tag;//��Ϊ0Ϊ������� ��Ϊ1Ԥ�Ƶ���

    private double plant_total;//ũ���������

    //region ��ʳ
    private double food_total;//��ʳ�ϼ�
    private double food_summerl;//���У�����

    //����
    private double food_grain;//���� �ϼƣ�food_grain_daogu_zaodao+food_grain_daogu_zhongdao+food_grain_daogu_wandao+food_grain_xiaomai+food_grain_yumi+food_grain_guzi+food_grain_gaoliang+food_grain_other��
    private double food_grain_daogu;//���ȣ�food_grain_daogu_zaodao+food_grain_daogu_zhongdao+food_grain_daogu_wandao��
    private double food_grain_daogu_zaodao;//�絾
    private double food_grain_daogu_zhongdao;//�е�
    private double food_grain_daogu_wandao;//˫����
    private double food_grain_xiaomai;//С��
    private double food_grain_yumi;//����
    private double food_grain_guzi;//����
    private double food_grain_gaoliang;//����
    private double food_grain_other;//����
    //endregion

    //region ����
    private double food_legume;//���� �ϼ�
    private double food_legume_dadou;//���У���(������food_legume)
    //endregion

    //region ��������
    private double food_potato;//���� �ϼ�
    private double food_potato_malingshu;// ���У�������(������food_potato)
    //endregion

    //region ��������
    private double oilplant_total;//�������� �ϼ�(��С��food_oilplant_huasheng+food_oilplant_youcaizi+food_oilplant_zhima)
    private double oilplant_huasheng;//���У�����
    private double oilplant_youcaizi;//�Ͳ���
    private double oilplant_zhima;//֥��
    //endregion

    //region �޻�
    private double cotton_total;//�޻�
    //endregion

    //region ����
    private double rawjute_total;//����
    private double rawjute_hongma;//���У����ƺ���
    //endregion

    //region ����ϼ�
    private double sugar_total;//����
    private double sugar_ganzhe;//����
    private double sugar_tiancai;//���
    //endregion

    //region ��Ҷ
    private double tobacco_total;//��Ҷ
    private double tobacco_kaoyan;//���У�����
    //endregion

    //region �߲�
    private double vegetables_total;//�߲�
    //endregion

    //region �Ϲ���
    private double fruit_total;//�Ϲ�
    //endregion

    //region ��������
    private double otherplant_total;//��������
    private double otherplant_qingsiliaol;//���У�������
    //endregion

    public WholeYearPlantArea(){}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getForm_tag() {
        return form_tag;
    }

    public void setForm_tag(int form_tag) {
        this.form_tag = form_tag;
    }

    public double getPlant_total() {
        return plant_total;
    }

    public void setPlant_total(double plant_total) {
        this.plant_total = plant_total;
    }

    public double getFood_total() {
        return food_total;
    }

    public void setFood_total(double food_total) {
        this.food_total = food_total;
    }

    public double getFood_summerl() {
        return food_summerl;
    }

    public void setFood_summerl(double food_summerl) {
        this.food_summerl = food_summerl;
    }

    public double getFood_grain() {
        return food_grain;
    }

    public void setFood_grain(double food_grain) {
        this.food_grain = food_grain;
    }

    public double getFood_grain_daogu() {
        return food_grain_daogu;
    }

    public void setFood_grain_daogu(double food_grain_daogu) {
        this.food_grain_daogu = food_grain_daogu;
    }

    public double getFood_grain_daogu_zaodao() {
        return food_grain_daogu_zaodao;
    }

    public void setFood_grain_daogu_zaodao(double food_grain_daogu_zaodao) {
        this.food_grain_daogu_zaodao = food_grain_daogu_zaodao;
    }

    public double getFood_grain_daogu_zhongdao() {
        return food_grain_daogu_zhongdao;
    }

    public void setFood_grain_daogu_zhongdao(double food_grain_daogu_zhongdao) {
        this.food_grain_daogu_zhongdao = food_grain_daogu_zhongdao;
    }

    public double getFood_grain_daogu_wandao() {
        return food_grain_daogu_wandao;
    }

    public void setFood_grain_daogu_wandao(double food_grain_daogu_wandao) {
        this.food_grain_daogu_wandao = food_grain_daogu_wandao;
    }

    public double getFood_grain_xiaomai() {
        return food_grain_xiaomai;
    }

    public void setFood_grain_xiaomai(double food_grain_xiaomai) {
        this.food_grain_xiaomai = food_grain_xiaomai;
    }

    public double getFood_grain_yumi() {
        return food_grain_yumi;
    }

    public void setFood_grain_yumi(double food_grain_yumi) {
        this.food_grain_yumi = food_grain_yumi;
    }

    public double getFood_grain_guzi() {
        return food_grain_guzi;
    }

    public void setFood_grain_guzi(double food_grain_guzi) {
        this.food_grain_guzi = food_grain_guzi;
    }

    public double getFood_grain_gaoliang() {
        return food_grain_gaoliang;
    }

    public void setFood_grain_gaoliang(double food_grain_gaoliang) {
        this.food_grain_gaoliang = food_grain_gaoliang;
    }

    public double getFood_grain_other() {
        return food_grain_other;
    }

    public void setFood_grain_other(double food_grain_other) {
        this.food_grain_other = food_grain_other;
    }

    public double getFood_legume() {
        return food_legume;
    }

    public void setFood_legume(double food_legume) {
        this.food_legume = food_legume;
    }

    public double getFood_legume_dadou() {
        return food_legume_dadou;
    }

    public void setFood_legume_dadou(double food_legume_dadou) {
        this.food_legume_dadou = food_legume_dadou;
    }

    public double getFood_potato() {
        return food_potato;
    }

    public void setFood_potato(double food_potato) {
        this.food_potato = food_potato;
    }

    public double getFood_potato_malingshu() {
        return food_potato_malingshu;
    }

    public void setFood_potato_malingshu(double food_potato_malingshu) {
        this.food_potato_malingshu = food_potato_malingshu;
    }

    public double getOilplant_total() {
        return oilplant_total;
    }

    public void setOilplant_total(double oilplant_total) {
        this.oilplant_total = oilplant_total;
    }

    public double getOilplant_huasheng() {
        return oilplant_huasheng;
    }

    public void setOilplant_huasheng(double oilplant_huasheng) {
        this.oilplant_huasheng = oilplant_huasheng;
    }

    public double getOilplant_youcaizi() {
        return oilplant_youcaizi;
    }

    public void setOilplant_youcaizi(double oilplant_youcaizi) {
        this.oilplant_youcaizi = oilplant_youcaizi;
    }

    public double getOilplant_zhima() {
        return oilplant_zhima;
    }

    public void setOilplant_zhima(double oilplant_zhima) {
        this.oilplant_zhima = oilplant_zhima;
    }

    public double getCotton_total() {
        return cotton_total;
    }

    public void setCotton_total(double cotton_total) {
        this.cotton_total = cotton_total;
    }

    public double getRawjute_total() {
        return rawjute_total;
    }

    public void setRawjute_total(double rawjute_total) {
        this.rawjute_total = rawjute_total;
    }

    public double getRawjute_hongma() {
        return rawjute_hongma;
    }

    public void setRawjute_hongma(double rawjute_hongma) {
        this.rawjute_hongma = rawjute_hongma;
    }

    public double getSugar_total() {
        return sugar_total;
    }

    public void setSugar_total(double sugar_total) {
        this.sugar_total = sugar_total;
    }

    public double getSugar_ganzhe() {
        return sugar_ganzhe;
    }

    public void setSugar_ganzhe(double sugar_ganzhe) {
        this.sugar_ganzhe = sugar_ganzhe;
    }

    public double getSugar_tiancai() {
        return sugar_tiancai;
    }

    public void setSugar_tiancai(double sugar_tiancai) {
        this.sugar_tiancai = sugar_tiancai;
    }

    public double getTobacco_total() {
        return tobacco_total;
    }

    public void setTobacco_total(double tobacco_total) {
        this.tobacco_total = tobacco_total;
    }

    public double getTobacco_kaoyan() {
        return tobacco_kaoyan;
    }

    public void setTobacco_kaoyan(double tobacco_kaoyan) {
        this.tobacco_kaoyan = tobacco_kaoyan;
    }

    public double getVegetables_total() {
        return vegetables_total;
    }

    public void setVegetables_total(double vegetables_total) {
        this.vegetables_total = vegetables_total;
    }

    public double getFruit_total() {
        return fruit_total;
    }

    public void setFruit_total(double fruit_total) {
        this.fruit_total = fruit_total;
    }

    public double getOtherplant_total() {
        return otherplant_total;
    }

    public void setOtherplant_total(double otherplant_total) {
        this.otherplant_total = otherplant_total;
    }

    public double getOtherplant_qingsiliaol() {
        return otherplant_qingsiliaol;
    }

    public void setOtherplant_qingsiliaol(double otherplant_qingsiliaol) {
        this.otherplant_qingsiliaol = otherplant_qingsiliaol;
    }
}
