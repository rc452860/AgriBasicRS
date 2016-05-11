package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.Region;
import abrs.system.dao.Entity.User;
import abrs.system.dao.RegionDao;
import abrs.system.web.context.SessionContext;
import org.docx4j.wml.P;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Edifi_000 on 2016-03-24.
 */

@Service
public class RegionService {
    private static Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private RegionDao regionDao;
    @Autowired
    HttpSession session;

    public boolean addItem(Region region)
    {
        regionDao.save(region);
        logger.info("Add Region");
        return true;
    }

    public boolean addItems(List<Region> regions){
        regionDao.insertAll(regions);
        logger.info("Add Regions");
        return true;
    }


    public boolean addItem(String no,String name, String fullname/*,String fatherno,
                           String shortnoone,String shortnotwo,
                           int flag*/)
    {
        Region region = new Region();
        region.setNo(no);
        region.setName(name);/*
        region.setFullname(fullname);
        region.setFatherno(fatherno);
        region.setShortnoone(shortnoone);
        region.setShortnotwo(shortnotwo);*/
        regionDao.save(region);
        logger.info("Add Region: " + no + "/" + name);
        return true;
    }

    public Region getItem(String id)
    {
        return regionDao.queryById(id);
    }

    public Region getItemByNo(String no)
    {
        Query query = new Query();
        query.addCriteria(Criteria.where("no").is(no));
        Region region = regionDao.queryOne(query);
        return region;
    }

    public long getCount() {
        return regionDao.getCount(new Query());
    }

    public boolean updateItem(Region region)
    {
        regionDao.save(region);
        logger.info("Update Region");
        return true;
    }

    public void remove(String id)
    {
        regionDao.deleteById(id);
    }

    public void removeMulit(String[] ids){
        regionDao.deleteByIdMulit(ids);
    }

    public List<Region> getItems(int start, int size){
        return regionDao.getPage(new Query(), start, size);
    }

    public List<Region> getRoot() {
        User user = (User)session.getAttribute(SessionContext.CURRENT_USER);

        Query query = new Query();
        Auth.Role role = (Auth.Role) session.getAttribute(SessionContext.CURRENT_USER_ROLE);

        query.addCriteria(Criteria.where("no").is(user.getRegionCode()));
        List<Region>  result = regionDao.queryList(query);
        if((result==null||result.size()==0)&&role == Auth.Role.SUPERADMIN){
            query=new Query();
            query.addCriteria(Criteria.where("no").regex("[0-9]{2}0{13}"));
            result = regionDao.queryList(query);
        }
        return result;
    }

    public List<Region> getChild(String id) {
        Pattern pattern = this.getChildsPattern(id);
        Query query = new Query();
        query.addCriteria(Criteria.where("no").regex(pattern));
        return regionDao.queryList(query);
    }

    public Region getParent(String id){
        Pattern pattern = this.getParentPattern(id);
        Query query = new Query();
        query.addCriteria(Criteria.where("no").is(id));
        return regionDao.queryOne(query);

    }

    public Region getByCode(String code) {
        Query query = new Query();
        query.addCriteria(Criteria.where("no").is(code));
        return regionDao.queryOne(query);
    }

    private String[] regexs = {
            "([0-9]{2})0{13}",
            "([0-9]{4})0{11}",
            "([0-9]{6})0{9}",
            "([0-9]{9})0{6}",
            "([0-9]{12})0{3}",
            "([0-9]{15})",
    };
    private String[] next = {
            "${precode}[0-9]{2}0{11}",
            "${precode}[0-9]{2}0{9}",
            "${precode}[0-9]{3}0{6}",
            "${precode}[0-9]{3}0{3}",
            "${precode}[0-9]{3}",
    };
    public Pattern getChildsPattern(String code){

        int i = 0;
        Pattern pattern = null;
        String precode;
        for (;i<regexs.length;i++){
            pattern = Pattern.compile(regexs[i]);
            if (pattern.matcher(code).find())
                break;
        }
        if (i<regexs.length-1 && pattern != null){
            Matcher matcher = pattern.matcher(code);
            if (matcher.matches()) {
                precode = matcher.group(1);
                precode = precode.equals("00")?"[0-9]{2}":precode;
                pattern = Pattern.compile(next[i].replace("${precode}",precode));
            }
        }
        return pattern;
    }
    public Pattern getDescendantsPattern(String code){

        int i = 0;
        Pattern pattern = null;
        String precode;
        for (;i<regexs.length;i++){
            pattern = Pattern.compile(regexs[i]);
            if (pattern.matcher(code).find())
                break;
        }
        if (i<regexs.length-1 && pattern != null){
            Matcher matcher = pattern.matcher(code);
            if (matcher.matches()) {
                precode = matcher.group(1);
                if (!precode.equals("00"))
                    pattern = Pattern.compile("^"+precode);
                else
                    pattern = Pattern.compile("^[0-9]{2}");

            }
        }
        return pattern;
    }

    public Pattern getParentPattern(String code){

        int[] next = {
                2,4,6,9,11,13
        };
        int i = 0;
        Pattern pattern = null;
        String precode;
        for (;i<regexs.length;i++){
            pattern = Pattern.compile(regexs[i]);
            if (pattern.matcher(code).find())
                break;
        }
        if (i>1 && pattern != null){
            Matcher matcher = pattern.matcher(code);
            if (matcher.matches()) {
                code = code.substring(0,next[i-1]);
                while(code.length()<15){
                    code+='0';
                }
            }
        }
        return pattern;
    }
}
