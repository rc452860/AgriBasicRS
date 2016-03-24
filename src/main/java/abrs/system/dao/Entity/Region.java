package abrs.system.dao.Entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by Edifi_000 on 2016-03-22.
 */
/**
 * 区域单位信息（所在真村组）
 */
@Document(collection = "Region")
public class Region {
    @Id
    private String id;

    private String no;//编号

    private String name;//名称

    private String fullname;//全称

    private String fatherno;//父区域单位编号

    private String shortnoone;//短码1

    private String shortnotwo;//短码2

    private int flag;//标识

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
