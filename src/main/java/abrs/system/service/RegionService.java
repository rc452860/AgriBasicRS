package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.Region;
import abrs.system.dao.RegionDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Edifi_000 on 2016-03-24.
 */

@Service
public class RegionService {
    private static Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private RegionDao regionDao;

    public boolean addItem(Region region)
    {
        regionDao.save(region);
        logger.info("Add Region");
        return true;
    }

    public boolean addItem(String no,String name, String fullname,String fatherno,
                           String shortnoone,String shortnotwo,
                           int flag)
    {
        Region region = new Region();
        region.setNo(no);
        region.setName(name);
        region.setFullname(fullname);
        region.setFatherno(fatherno);
        region.setShortnoone(shortnoone);
        region.setShortnotwo(shortnotwo);
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
}
