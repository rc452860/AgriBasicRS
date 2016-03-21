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

import java.util.List;
import java.util.Random;

@Service
public class UserService {

    private static Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserDao userDao;

    /**
     * 增加新用户
     *
     * @param username     用户名
     * @param password     密码
     * @param institution  合作机构用户
     * @param role      角色
     * @param email        邮箱
     * @param phone        电话
     * @param team         班级
     * @param school       学校
     * @param grade        年级
     * @return 是否增加成功
     */
    public boolean addItem(String username, String password, String name, String institution,
                           Auth.Role role, String email,
                           String phone, String team, String school, String grade) {
        if (checkUserExist(username, institution))
            return false;

        User user = new User();
        user.setSalt(getRandomString(6));
        user.setUsername(username);
        user.setName(name);
        user.setPassword(MD5.GetMD5Code(user.getSalt() + password));
        user.setInstitution(institution);
        user.setRole(AES.encrypt(user.getSalt() + role.name()));
        user.setEmail(email);
        user.setPhone(phone);
        user.setTeam(team);
        user.setSchool(school);
        user.setGrade(grade);
        user.setMoney(AES.encrypt(user.getSalt() + Integer.toString(0)));
        userDao.save(user);
        logger.info("Add User: " + institution + "/" + username);
        return true;
    }

    /**
     * 检测用户是否存在，本站用户机构名为空
     *
     * @param username    用户名
     * @param institution 机构名
     * @return 用户是否存在
     */
    public boolean checkUserExist(String username, String institution) {
        Query query = new Query();
        query.addCriteria(Criteria.where("username").is(username));
        query.addCriteria(Criteria.where("institution").is(institution));
        boolean result = userDao.getCount(query) == 1;
        logger.info("Check User " + institution + "/" + username + " Exist: " + result);
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
     * 获取用户信息
     *
     * @param username    用户名
     * @param institution 机构名
     * @return 用户信息
     */
    public User getItem(String username, String institution) {
        Query query = new Query();
        query.addCriteria(Criteria.where("username").is(username));
        query.addCriteria(Criteria.where("institution").is(institution));
        User user = userDao.queryOne(query);
        logger.info("Get User: " + institution + "/" + username);
        if (user != null)
            return user;
        else
            return null;
    }

    /**
     * 获取用户信息
     *
     * @param username    用户名
     * @param password    密码
     * @param institution 机构名
     * @return 用户信息
     */
    public User getItem(String username, String password, String institution) {
        Query query = new Query();
        query.addCriteria(Criteria.where("username").is(username));
        query.addCriteria(Criteria.where("institution").is(institution));
        User user = userDao.queryOne(query);
        logger.info("Get User: " + institution + "/" + username);
        if (user != null && MD5.GetMD5Code(user.getSalt() + password).equals(user.getPassword()))
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
        return userDao.getPage(new Query(), start, size);
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
     * @param institution 机构
     * @return 重置是否成功
     */
    public boolean resetPassword(String username, String oldPassword,
                                 String newPassword, String institution) {
        Query query = new Query();
        query.addCriteria(Criteria.where("username").is(username));
        query.addCriteria(Criteria.where("institution").is(institution));
        User user = userDao.queryOne(query);
        if (user != null && MD5.GetMD5Code(user.getSalt() + oldPassword).equals(user.getPassword())) {
            Update update = new Update();
            update.set("password", MD5.GetMD5Code(user.getSalt() + newPassword));
            userDao.updateFirst(query, update);
            logger.info("Reset User Password: " + institution + "/" + username);
            return true;
        } else
            return false;
    }

    /**
     * 用户金额修改
     *
     * @param userId 用户ID
     * @param value  增减金额
     * @return 修改成功
     */
    public boolean changeMoney(String userId, int value) {
        User user = userDao.queryById(userId);
        if (user != null) {
            int money = Integer.parseInt(AES.decrypt(user.getMoney().substring(6))) + value;
            Query query = new Query();
            query.addCriteria(Criteria.where("id").is(userId));
            Update update = new Update();
            update.set("money", AES.encrypt(user.getSalt() + Integer.toString(money)));
            userDao.updateFirst(query, update);
            logger.info("Add User Money: " + userId + " " + value);
            return true;
        } else
            return false;
    }

    /**
     * 获取用户金额
     *
     * @param userId 用户ID
     * @return 用户金额
     */
    public int getMoney(String userId) {
        User user = userDao.queryById(userId);
        if (user != null) {
            return Integer.parseInt(AES.decrypt(user.getMoney()).substring(6));
        } else
            return 0;
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
}
