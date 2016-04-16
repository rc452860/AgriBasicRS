package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.User;
import abrs.system.dao.UserDao;
import abrs.system.util.AES;
import abrs.system.util.MD5;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Random;
import java.util.regex.Pattern;

@Service
public class UserService {

    private static Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserDao userDao;

    /**
     * 增加新用户
     *
     * @return 是否增加成功
     */
    public boolean addItem(User user) {
        if (checkUserExist(user.getUsername()))
            return false;


        user.setSalt(getRandomString(6));
        user.setPassword(this.getUserPasswordMd5(user.getSalt(), user.getPassword()));
        user.setRole(this.getUserRoleEncrypt(user.getSalt(),user.getRole()));
        userDao.save(user);
        logger.info("Add User: " +  "/" + user.getUsername());
        return true;
    }

    /**
     * 获得用户的真实角色
     * @param salt 盐值
     * @param rolename 角色名
     * @return 角色信息
     */
    public Auth.Role getUserRole(String salt,String rolename){
        String name = AES.decrypt(salt+rolename);
        return Auth.Role.valueOf(name);
    }

    /**
     * 加密用户角色信息
     * @param salt 盐值
     * @param rolename 色名
     * @return 加密结果
     */
    public String getUserRoleEncrypt(String salt,String rolename){
        return AES.encrypt(salt+rolename);
    }
    /***
     * 获得用户密码MD5值
     * @param salt
     * @param password
     * @return
     */
    public String getUserPasswordMd5(String salt,String password){
        return (MD5.GetMD5Code(salt + password));
    }
    /**
     * 检测用户是否存在，本站用户机构名为空
     *
     * @param username    用户名
     * @return 用户是否存在
     */
    public boolean checkUserExist(String username) {
        Query query = new Query();
        query.addCriteria(Criteria.where("username").is(username));
        boolean result = userDao.getCount(query) == 1;
        logger.info("Check User " +  "/" + username + " Exist: " + result);
        return result;
    }

    /**
     * 根据ID查询用户
     * @param id 用户ID
     * @return 用户信息
     */
    public User getItem(String id)
    {
        return userDao.queryById(id);
    }

    /**
     * 根据账号密码查找用户
     * @param username
     * @param userpassword
     * @return 用户信息
     */
    public User getItem(String username,String userpassword)
    {
        Query query = new Query();
        query.addCriteria(Criteria.where("username").is(username));
        User user = userDao.queryOne(query);
        if (user.getPassword().equals( this.getUserPasswordMd5(user.getSalt(),userpassword)))
            return user;
        else
            return null;
    }

    /**
     * 按页返回所有用户信息
     *
     * @param start 序号
     * @param size 每页数量
     * @return 用户列表
     */
    public List<User> getItems(int start, int size){
        Query query = new Query();
        query.addCriteria(Criteria.where("username").nin("admin"));
        return userDao.getPage(query, start, size);
    }

    /**
     * 返回用户数量
     * @return 用户数量
     */
    public long getCount() {
        return userDao.getCount(new Query());
    }

    /**
     * 重置用户密码
     *
     * @param username    用户名
     * @param oldPassword 旧密码
     * @param newPassword 新密码
     * @return 重置是否成功
     */
    public boolean resetPassword(String username, String oldPassword,
                                 String newPassword) {
        Query query = new Query();
        query.addCriteria(Criteria.where("username").is(username));
        User user = userDao.queryOne(query);
        if (user != null && MD5.GetMD5Code(user.getSalt() + oldPassword).equals(user.getPassword())) {
            Update update = new Update();
            update.set("password", MD5.GetMD5Code(user.getSalt() + newPassword));
            userDao.updateFirst(query, update);
            logger.info("Reset User Password: " +  "/" + username);
            return true;
        } else
            return false;
    }


    /**
     * 获取角色
     *
     * @param userId 用户ID
     * @return 角色信息
     */
    public Auth.Role getUserRole(String userId) {
        User user = userDao.queryById(userId);
        if (user != null) {
            String value = AES.decrypt(user.getRole()).substring(6);
            return Auth.Role.valueOf(value);
        } else
            return Auth.Role.NONE;
    }

    /**
     * 修改角色
     *
     * @param userId 用户ID
     * @param role 用户角色
     */
    public boolean setUserRole(String userId, Auth.Role role) {
        User user = userDao.queryById(userId);
        if (user != null) {
            Query query = new Query();
            query.addCriteria(Criteria.where("id").is(userId));
            Update update = new Update();
            update.set("role", AES.encrypt(user.getSalt() + role.toString()));
            userDao.updateFirst(query, update);
            logger.info("Set User Role: " + userId + " " + role.name());
            return true;
        } else
            return false;
    }

    /**
     * 生成随机字符串
     *
     * @param length 字符串长度
     * @return 随机字符串
     */
    private String getRandomString(int length) { //length表示生成字符串的长度
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    public void remove(String id) {
        userDao.deleteById(id);
    }

    public void removeMulit(String[] ids) {
        userDao.deleteByIdMulit(ids);
    }

    /***
     * 更新用户资料
     * @param user
     */
    public void update(User user) {
        try{
            User old = userDao.queryById(user.getId());
            Field[] fields = User.class.getDeclaredFields();
            Pattern filter = Pattern.compile("(id|username|salt|role)");//更新过滤字段
            for (Field item : fields){
                item.setAccessible(true);
                if (item.get(user)!=null && !item.get(user).toString().equals("")&&!filter.matcher(item.getName()).find())
                    item.set(old,item.get(user));
                if (item.getName().equals("password")&&!item.get(user).toString().equals("******")){
                    old.setPassword(this.getUserPasswordMd5(old.getSalt(), user.getPassword()));
                }
            }
            userDao.save(old);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
