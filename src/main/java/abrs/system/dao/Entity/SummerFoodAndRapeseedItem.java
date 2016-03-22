package abrs.system.dao.Entity;

/**
 * Created by Edifi_000 on 2016-03-23.
 */

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * �����������Ͳ��Ѳ���Ԥ����ϸ��Ϣ
 */
@Document(collection = "SummerFoodAndRapeseedItem")
public class SummerFoodAndRapeseedItem {
    @Id
    private String id;

    //region ���������Ķ��
    private double seededarea_lastyear;//����ʵ��
    private double seededarea_thisyear;//����Ԥ��
    //�����Ƚ�
    private double seededarea_Increasedecrease_absolute;//������
    private double seededarea_Increasedecrease_relative;//�����
    //endregion

    //region ����������/Ķ��
    private double perunit_lastyear;//����ʵ��
    private double perunit_thisyear;//����Ԥ��
    //�����Ƚ�
    private double perunit_Increasedecrease_absolute;//������
    private double perunit_Increasedecrease_relative;//�����
    //endregion

    //region �ܲ������֣���
    private double total_lastyear;//����ʵ��
    private double total_thisyear;//����Ԥ��
    //�����Ƚ�
    private double total_Increasedecrease_absolute;//������
    private double total_Increasedecrease_relative;//�����
    //endregion


    public SummerFoodAndRapeseedItem(){}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getSeededarea_lastyear() {
        return seededarea_lastyear;
    }

    public void setSeededarea_lastyear(double seededarea_lastyear) {
        this.seededarea_lastyear = seededarea_lastyear;
    }

    public double getSeededarea_thisyear() {
        return seededarea_thisyear;
    }

    public void setSeededarea_thisyear(double seededarea_thisyear) {
        this.seededarea_thisyear = seededarea_thisyear;
    }

    public double getSeededarea_Increasedecrease_absolute() {
        return seededarea_Increasedecrease_absolute;
    }

    public void setSeededarea_Increasedecrease_absolute(double seededarea_Increasedecrease_absolute) {
        this.seededarea_Increasedecrease_absolute = seededarea_Increasedecrease_absolute;
    }

    public double getSeededarea_Increasedecrease_relative() {
        return seededarea_Increasedecrease_relative;
    }

    public void setSeededarea_Increasedecrease_relative(double seededarea_Increasedecrease_relative) {
        this.seededarea_Increasedecrease_relative = seededarea_Increasedecrease_relative;
    }

    public double getPerunit_lastyear() {
        return perunit_lastyear;
    }

    public void setPerunit_lastyear(double perunit_lastyear) {
        this.perunit_lastyear = perunit_lastyear;
    }

    public double getPerunit_thisyear() {
        return perunit_thisyear;
    }

    public void setPerunit_thisyear(double perunit_thisyear) {
        this.perunit_thisyear = perunit_thisyear;
    }

    public double getPerunit_Increasedecrease_absolute() {
        return perunit_Increasedecrease_absolute;
    }

    public void setPerunit_Increasedecrease_absolute(double perunit_Increasedecrease_absolute) {
        this.perunit_Increasedecrease_absolute = perunit_Increasedecrease_absolute;
    }

    public double getPerunit_Increasedecrease_relative() {
        return perunit_Increasedecrease_relative;
    }

    public void setPerunit_Increasedecrease_relative(double perunit_Increasedecrease_relative) {
        this.perunit_Increasedecrease_relative = perunit_Increasedecrease_relative;
    }

    public double getTotal_lastyear() {
        return total_lastyear;
    }

    public void setTotal_lastyear(double total_lastyear) {
        this.total_lastyear = total_lastyear;
    }

    public double getTotal_thisyear() {
        return total_thisyear;
    }

    public void setTotal_thisyear(double total_thisyear) {
        this.total_thisyear = total_thisyear;
    }

    public double getTotal_Increasedecrease_absolute() {
        return total_Increasedecrease_absolute;
    }

    public void setTotal_Increasedecrease_absolute(double total_Increasedecrease_absolute) {
        this.total_Increasedecrease_absolute = total_Increasedecrease_absolute;
    }

    public double getTotal_Increasedecrease_relative() {
        return total_Increasedecrease_relative;
    }

    public void setTotal_Increasedecrease_relative(double total_Increasedecrease_relative) {
        this.total_Increasedecrease_relative = total_Increasedecrease_relative;
    }
}
