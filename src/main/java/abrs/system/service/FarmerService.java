package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.Farmer;
import abrs.system.dao.FarmerDao;
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
public class FarmerService {
    private static Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private FarmerDao farmerDao;

    public boolean addItem(Farmer farmer)
    {
        farmerDao.save(farmer);
        logger.info("Add Farmer");
        return true;
    }

    public Farmer getItem(String id)
    {
        return farmerDao.queryById(id);
    }

    public Farmer getItemByNo(String no)
    {
        Query query = new Query();
        query.addCriteria(Criteria.where("no").is(no));
        Farmer farmer = farmerDao.queryOne(query);
        return farmer;
    }

    public long getCount() {
        return farmerDao.getCount(new Query());
    }

    public boolean updateItem(Farmer farmer)
    {
        farmerDao.save(farmer);
        logger.info("Update Farmer");
        return true;
    }

    public void remove(String id)
    {
        farmerDao.deleteById(id);
    }

    public List<Farmer> getItems(int start, int size){
        return farmerDao.getPage(new Query(), start, size);
    }
}
