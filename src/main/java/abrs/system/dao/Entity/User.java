package abrs.system.dao.Entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.ArrayList;
import java.util.List;

/**
 * 用户信息
 */
@Document(collection = "User")
public class User {
    @Id
    private String id;

    private String name = "";
    @Indexed(unique = true)
    private String username = "";
    private String password = "";
    private String role = "";
    private String regionCode = "";

    private String salt = "";

    public String getRegionCode() {
        return regionCode;
    }

    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode;
    }



    public User() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return 用户名
     */
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return 密码，md5加密
     */
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    /**
     *
     * @return 角色，md5加密
     */
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    /**
     *
     * @return 加盐加密
     */
    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }





    /**
     *
     * @return 姓名
     */
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
