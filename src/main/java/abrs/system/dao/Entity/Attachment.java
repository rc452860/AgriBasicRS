package abrs.system.dao.Entity;

import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;

/**
 * 附件
 */
@Document(collection = "Attachment")
public class Attachment {
    private String name= "";
    private AttachmentType type = AttachmentType.Document;
    private String url = "";
    private Date createDate = new Date();

    /**
     *
     * @return 名称
     */
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
     *
     * @return 类型
     */
    public AttachmentType getType() {
        return type;
    }

    public void setType(AttachmentType type) {
        this.type = type;
    }

    /**
     *
     * @return 地址
     */
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    /**
     *
     * @return 创建时间
     */
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public enum AttachmentType{
        Picture,
        Document,
        Video,
        Audio
    }
}
