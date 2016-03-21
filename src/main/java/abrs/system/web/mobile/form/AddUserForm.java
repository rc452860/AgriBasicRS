package abrs.system.web.mobile.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class AddUserForm {

    @NotNull(message = "用户名不能为空")
    @Size(min=5, max=20, message="用户名长度必须在5-20之间")
    @Pattern(regexp = "^[a-zA-Z_]\\w*$", message = "用户名格式不合法")
    private String username;

    @NotNull(message = "密码不能为空")
    @Size(min=5, max=20, message="密码长度必须在5-20之间")
    private String password;

    @Size(min=1, max=20, message="姓名长度必须在1-20之间")
    private String name;

    @Size(min=0, max=20, message="机构名称过长")
    private String institution;

    @Size(min=0, max=30, message="邮箱地址过长")
    private String email;

    @Size(min=0, max=20, message="电话号码过长")
    private String phone;

    @Size(min=0, max=20, message="班级名称过长")
    private String team;

    @Size(min=0, max=30, message="学校名称过长")
    private String school;

    @Size(min=0, max=20, message="年级名称过长")
    private String grade;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
