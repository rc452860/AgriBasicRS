package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.Farmer;
import abrs.system.dao.FarmerDao;
import abrs.system.dao.MongoGenDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Edifi_000 on 2016-03-24.
 */

@Service
public class FarmerService extends BaseService{
    private static Logger logger = LoggerFactory.getLogger(FarmerService.class);

    @Autowired
    private FarmerDao farmerDao;

    public Object getDao()
    {
        return farmerDao;
    }

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

    public long getCount(String name,String telphone,String village) {
        Query query = new Query();
        Criteria cr = new Criteria();
        List<Criteria> querylist = new ArrayList<Criteria>();
        if(name != null){
            querylist.add(Criteria.where("name").regex(name));
        }
        if (telphone!=null){
            querylist.add(Criteria.where("contact_phone").regex(telphone));
            querylist.add(Criteria.where("contact_landline").regex(telphone));
        }
        if (village != null){
            querylist.add(Criteria.where("region").regex(village));
        }
        if(querylist.size()>1){
            query.addCriteria(cr.andOperator(querylist.toArray(new Criteria[querylist.size()])));
        }
        if (querylist.size() == 1){
            query.addCriteria(querylist.get(0));
        }
        return farmerDao.getCount(query);
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

    public void removeMulit(String[] ids){
        farmerDao.deleteByIdMulit(ids);
    }

    public List<Farmer> getItems(int start, int size,String name,String telphone,String village){
        Query query = new Query();
        Criteria cr = new Criteria();
        List<Criteria> querylist = new ArrayList<Criteria>();
        if(name != null){
            querylist.add(Criteria.where("name").regex(name));
        }
        if (telphone!=null){
            querylist.add(Criteria.where("contact_phone").regex(telphone));
            querylist.add(Criteria.where("contact_landline").regex(telphone));
        }
        if (village != null){
            querylist.add(Criteria.where("region").regex(village));
        }
        if(querylist.size()>1){
                query.addCriteria(cr.andOperator(querylist.toArray(new Criteria[querylist.size()])));
        }
        if (querylist.size() == 1){
            query.addCriteria(querylist.get(0));
        }
        return farmerDao.getPage(query, start, size);
    }
}
