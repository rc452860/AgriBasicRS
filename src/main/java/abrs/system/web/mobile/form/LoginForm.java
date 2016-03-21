package abrs.system.web.mobile.form;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Pattern;

public class LoginForm {
    @NotNull(message = "用户名不能为空")
    @Size(min=5, max=20, message="用户名长度必须在5-20之间")
    @Pattern(regexp = "^[a-zA-Z_]\\w*$", message = "用户名格式不合法")
    private String username;

    @NotNull(message = "密码不能为空")
    @Size(min=5, max=20, message="密码长度必须在5-20之间")
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
