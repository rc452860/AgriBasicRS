package abrs.system.web.mobile.form;

import abrs.system.dao.Entity.User;

import java.lang.reflect.Field;

public class UserForm {

    private String id;

    private String name = "";
    private String username = "";
    private String password = "";
    private String role = "";
    private String regionCode = "";

    public User GetUser(){
        User user = new User();
        try{
            Field[] fields = this.getClass().getDeclaredFields();
            for (Field item : fields){
                item.setAccessible(true);
                Field userField = user.getClass().getDeclaredField(item.getName());
                userField.setAccessible(true);
                userField.set(user,item.get(this));
            }
        }catch (Exception e){
            user = null;
            e.printStackTrace();
        }
        return user;
    }

    public static UserForm GetUserForm(User user){
        UserForm userForm = new UserForm();
        try{
            Field[] fields = user.getClass().getDeclaredFields();
            for (Field item : fields){
                item.setAccessible(true);
                Field userFormField = userForm.getClass().getDeclaredField(item.getName());
                userFormField.setAccessible(true);
                userFormField.setAccessible(true);
                userFormField.set(userForm,item.get(user));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return userForm;
    }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getRegionCode() {
        return regionCode;
    }

    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode;
    }
}
