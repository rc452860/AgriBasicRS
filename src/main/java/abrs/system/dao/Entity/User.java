package abrs.system.dao.Entity;

import abrs.system.aspect.Auth;
import abrs.system.util.AES;
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
    private String role_true = "";
    private String regionCode = "";

    private String salt = "";

    private String farmer_id;//农户id

    private String department;//部门

    private String phone;//手机

    private String qq;//QQ

    private String Email;//Email

    private String flag;//状态

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

    public String getFarmer_id() {
        return farmer_id;
    }

    public void setFarmer_id(String farmer_id) {
        this.farmer_id = farmer_id;
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

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Auth.Role getUserRole(){
        String value = AES.decrypt(getRole()).substring(6);
        return Auth.Role.valueOf(value);
    }

    public String getRole_true() {
        return role_true;
    }

    public void setRole_true(String role_true) {
        this.role_true = role_true;
    }
}
