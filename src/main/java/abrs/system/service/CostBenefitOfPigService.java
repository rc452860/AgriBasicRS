package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.CostBenefitOfPig;
import abrs.system.dao.CostBenefitOfPigDao;
import abrs.system.web.context.SessionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.http.client.support.HttpAccessor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Edifi_000 on 2016-03-28.
 */

@Service
public class CostBenefitOfPigService {
    private static Logger logger = LoggerFactory.getLogger(CostBenefitOfPigService.class);

    @Autowired
    private CostBenefitOfPigDao costBenefitOfPigDao;

    @Autowired
    HttpSession session;
    public boolean addItem(CostBenefitOfPig costBenefitOfPig)
    {
        String farmerId = (String) session.getAttribute(SessionContext.CURRENT_FARMER_ID);
        costBenefitOfPig.setFarmer_id(farmerId);
        costBenefitOfPigDao.save(costBenefitOfPig);
        logger.info("Add CostBenefitOfPig");
        return true;
    }

    public CostBenefitOfPig getItem(String id)
    {
        return costBenefitOfPigDao.queryById(id);
    }

    public long getCount() {
        return costBenefitOfPigDao.getCount(new Query());
    }

    public boolean updateItem(CostBenefitOfPig costBenefitOfPig)
    {
        costBenefitOfPigDao.save(costBenefitOfPig);
        logger.info("Update CostBenefitOfPig");
        return true;
    }

    public void remove(String id)
    {
        costBenefitOfPigDao.deleteById(id);
    }

    public void removeMulit(String[] ids){
        costBenefitOfPigDao.deleteByIdMulit(ids);
    }

    public List<CostBenefitOfPig> getItems(int start, int size){
        return costBenefitOfPigDao.getPage(new Query(), start, size);
    }
}
