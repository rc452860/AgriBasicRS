package abrs.system.dao.Entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by Edifi_000 on 2016-03-22.
 */
/**
 * ����λ��Ϣ����������飩
 */
@Document(collection = "Region")
public class Region {
    @Id
    private String id;

    private String no;//���

    private String name;//����

    private String fullname;//ȫ��

    private String fatherno;//������λ���

    private String shortnoone;//����1

    private String shortnotwo;//����2

    private int flag;//��ʶ

    public Region(){}

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

    public String getFullname() {
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
    }
}
