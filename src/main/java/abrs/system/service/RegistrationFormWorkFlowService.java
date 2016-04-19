package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.RegistrationFormWorkFlow;
import abrs.system.dao.RegistrationFormWorkFlowDao;
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
 * Created by Edifi_000 on 2016-04-17.
 */

@Service
public class RegistrationFormWorkFlowService {
    private static Logger logger = LoggerFactory.getLogger(RegistrationFormWorkFlowService.class);

    @Autowired
    RegistrationFormWorkFlowDao productsAndMeansMarketPriceDao;

    public boolean addItem(RegistrationFormWorkFlow productsAndMeansMarketPrice)
    {
        productsAndMeansMarketPriceDao.save(productsAndMeansMarketPrice);
        logger.info("Add RegistrationFormWorkFlow");
        return true;
    }

    public RegistrationFormWorkFlow getItem(String id)
    {
        return productsAndMeansMarketPriceDao.queryById(id);
    }

    public RegistrationFormWorkFlow getItem(String aggregation_id,int no)
    {
        Query query = new Query();
        query.addCriteria(Criteria.where("aggregation_id").is(aggregation_id));
        query.addCriteria(Criteria.where("no").is(no));
        return productsAndMeansMarketPriceDao.queryOne(query);
    }

    public long getCount() {
        return productsAndMeansMarketPriceDao.getCount(new Query());
    }

    public boolean updateItem(RegistrationFormWorkFlow productsAndMeansMarketPrice)
    {
        productsAndMeansMarketPriceDao.save(productsAndMeansMarketPrice);
        logger.info("Update RegistrationFormWorkFlow");
        return true;
    }

    public void remove(String id)
    {
        productsAndMeansMarketPriceDao.deleteById(id);
        logger.info("remove RegistrationFormWorkFlow id" + id);
    }

    public void removeMulit(String[] ids){
        productsAndMeansMarketPriceDao.deleteByIdMulit(ids);
        logger.info("remove RegistrationFormWorkFlow ids" + ids.toString());
    }

    public List<RegistrationFormWorkFlow> getItems(int start, int size){

        return productsAndMeansMarketPriceDao.getPage(new Query(), start, size);
    }

    public List<RegistrationFormWorkFlow> getItems(RegistrationFormWorkFlow conditions,int start, int size){
        Query query = new Query();
        Criteria cr = new Criteria();
        List<Criteria> querylist = new ArrayList<Criteria>();
        if(conditions!=null)
        {
            if(conditions.getRegion_id()!=null)
            {
                querylist.add(Criteria.where("region_id").is(conditions.getRegion_id()));
            }
            if(conditions.getUser_id()!=null)
            {
                querylist.add(Criteria.where("user_id").is(conditions.getUser_id()));
            }
            if(conditions.getResult()!=3)//当为3则无此条件
            {
                querylist.add(Criteria.where("result").is(conditions.getResult()));
            }
            if(querylist.size()>1){
                query.addCriteria(cr.andOperator(querylist.toArray(new Criteria[querylist.size()])));
            }
            if (querylist.size() == 1){
                query.addCriteria(querylist.get(0));
            }
        }
        return productsAndMeansMarketPriceDao.getPage(query, start, size);
    }

    public boolean checkNextExist(String aggregation_id,int no) {
        Query query = new Query();
        query.addCriteria(Criteria.where("aggregation_id").is(aggregation_id));
        query.addCriteria(Criteria.where("no").is(no));

        boolean result = false;
        try {
            RegistrationFormWorkFlow one = productsAndMeansMarketPriceDao.queryOne(query);
            if(one!=null)
            {
                result = true;
            }
        }catch (Exception ex)
        {
            ex.toString();
        }

        logger.info("Check Next " +  "/" + aggregation_id +"-"+ no + " Exist: " + result);
        return result;
    }

    public List<RegistrationFormWorkFlow> getItemsByAggregation(String aggregation_id)
    {
        Query query = new Query();
        query.addCriteria(Criteria.where("aggregation_id").is(aggregation_id));
        return productsAndMeansMarketPriceDao.queryList(query);
    }
}