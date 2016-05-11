package abrs.system.service;

import abrs.system.aspect.Auth;
import abrs.system.dao.Entity.CostBenefitProductivityOfPlant;
import abrs.system.dao.CostBenefitProductivityOfPlantDao;
import abrs.system.web.context.SessionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Edifi_000 on 2016-03-28.
 */

@Service
public class CostBenefitProductivityOfPlantService {
    private static Logger logger = LoggerFactory.getLogger(CostBenefitProductivityOfPlantService.class);

    @Autowired
    private CostBenefitProductivityOfPlantDao costBenefitProductivityOfPlantDao;

    @Autowired
    HttpSession session;
    public boolean addItem(CostBenefitProductivityOfPlant costBenefitProductivityOfPlant)
    {
        String farmerId = (String) session.getAttribute(SessionContext.CURRENT_FARMER_ID);
        costBenefitProductivityOfPlant.setFarmer_id(farmerId);
        costBenefitProductivityOfPlantDao.save(costBenefitProductivityOfPlant);
        logger.info("Add CostBenefitProductivityOfPlant");
        return true;
    }

    public CostBenefitProductivityOfPlant getItem(String id)
    {
        return costBenefitProductivityOfPlantDao.queryById(id);
    }

    public long getCount() {
        return costBenefitProductivityOfPlantDao.getCount(new Query());
    }

    public boolean updateItem(CostBenefitProductivityOfPlant costBenefitProductivityOfPlant)
    {
        costBenefitProductivityOfPlantDao.save(costBenefitProductivityOfPlant);
        logger.info("Update CostBenefitProductivityOfPlant");
        return true;
    }

    public void remove(String id)
    {
        costBenefitProductivityOfPlantDao.deleteById(id);
    }

    public void removeMulit(String[] ids){
        costBenefitProductivityOfPlantDao.deleteByIdMulit(ids);
    }

    public List<CostBenefitProductivityOfPlant> getItems(int start, int size){
        return costBenefitProductivityOfPlantDao.getPage(new Query(), start, size);
    }
}
