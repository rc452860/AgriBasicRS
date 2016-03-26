package abrs.system.dao.Entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by Edifi_000 on 2016-03-24.
 */
/**
 * �ﶬ���ﲥ������������
 */
@Document(collection = "AutumnWinterPlantsIntention")
public class AutumnWinterPlantsIntention {
    @Id
    private String id;

    private String farmer_id;//ũ��id
    private double plant_total;//���������

    //region ��ʳ
    private double food_total;//��ʳ�ϼ�

    //����
    private double food_grain;//����
    private double food_grain_dongxiaomai;//���У���С��

    //����
    private double food_legume;//���� �ϼ�

    //����
    private double food_potato;//���� �ϼ�
    //endregion

    //region ��������
    private double oilplant_total;//�������� �ϼ�(��С��food_oilplant_youcaizi)
    private double oilplant_youcaizi;//���У��Ͳ���
    //endregion

    //region �߲�
    private double vegetables_total;//�߲�
    //endregion

    //region ��������
    private double otherplant_total;//��������
    private double otherplant_qingsiliaol;//���У�������
    //endregion

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFarmer_id() {
        return farmer_id;
    }

    public void setFarmer_id(String farmer_id) {
        this.farmer_id = farmer_id;
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

    public double getFood_grain() {
        return food_grain;
    }

    public void setFood_grain(double food_grain) {
        this.food_grain = food_grain;
    }

    public double getFood_grain_dongxiaomai() {
        return food_grain_dongxiaomai;
    }

    public void setFood_grain_dongxiaomai(double food_grain_dongxiaomai) {
        this.food_grain_dongxiaomai = food_grain_dongxiaomai;
    }

    public double getFood_legume() {
        return food_legume;
    }

    public void setFood_legume(double food_legume) {
        this.food_legume = food_legume;
    }

    public double getFood_potato() {
        return food_potato;
    }

    public void setFood_potato(double food_potato) {
        this.food_potato = food_potato;
    }

    public double getOilplant_total() {
        return oilplant_total;
    }

    public void setOilplant_total(double oilplant_total) {
        this.oilplant_total = oilplant_total;
    }

    public double getOilplant_youcaizi() {
        return oilplant_youcaizi;
    }

    public void setOilplant_youcaizi(double oilplant_youcaizi) {
        this.oilplant_youcaizi = oilplant_youcaizi;
    }

    public double getVegetables_total() {
        return vegetables_total;
    }

    public void setVegetables_total(double vegetables_total) {
        this.vegetables_total = vegetables_total;
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
