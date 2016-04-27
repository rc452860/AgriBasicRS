package abrs.system.web.mobile.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Pattern;

public class LoginForm {
    @Pattern(regexp = "^[a-zA-Z_]\\w*$", message = "用户名格式不合法")
    @Size(min=5, max=20, message="请输入用户名和密码")
    private String username;

    @Size(min=5, max=20, message="请输入用户名和密码")
    private String password;

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
}
