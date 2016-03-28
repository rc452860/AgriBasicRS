package abrs.system.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import java.util.List;

public abstract class MongoGenDao<T> {

    private static Logger log = LoggerFactory.getLogger(MongoGenDao.class);

    @Autowired
    private MongoTemplate mongoTemplate;

    /**
     * 保存一个对象
     */
    public void save(T t) {
        log.info("[Mongo Dao] save:" + t);
        this.mongoTemplate.save(t);
    }

    /**
     * 根据Id从Collection中查询对象
     */
    public T queryById(String id) {
        Query query = new Query();
        Criteria criteria = Criteria.where("_id").is(id);
        query.addCriteria(criteria);
        log.info("[Mongo Dao] queryById:" + query);
        return this.mongoTemplate.findOne(query, this.getEntityClass());
    }

    /**
     * 根据条件查询集合
     */
    public List<T> queryList(Query query){
        log.info("[Mongo Dao] queryList:" + query);
        return this.mongoTemplate.find(query, this.getEntityClass());
    }

    /**
     * 通过条件查询单个实体
     */
    public T queryOne(Query query){
        log.info("[Mongo Dao] queryOne:" + query);
        return this.mongoTemplate.findOne(query, this.getEntityClass());
    }

    /**
     * 通过条件进行分页查询
     */
    public List<T> getPage(Query query, int start, int size){
        query.skip(start);
        query.limit(size);
        log.info("[Mongo Dao] queryPage:" + query + "(" + start +"," + size +")");
        List<T> lists = this.mongoTemplate.find(query, this.getEntityClass());
        return lists;
    }

    /**
     * 根据条件查询库中符合记录的总数
     */
    public Long getCount(Query query){
        log.info("[Mongo Dao] queryPageCount:" + query);
        return this.mongoTemplate.count(query, this.getEntityClass());
    }

    /**
     * 根据Id删除
     */
    public void deleteById(String id) {
        Criteria criteria = Criteria.where("_id").in(id);
        if(null!=criteria){
            Query query = new Query(criteria);
            log.info("[Mongo Dao] deleteById:" + query);
            if(null!=query && this.queryOne(query)!=null){
                this.mongoTemplate.remove(query, this.getEntityClass());
            }
        }
    }

    public void deleteByIdMulit(String[] ids) {
        Criteria criteria = Criteria.where("_id").in(ids);
        if(null!=criteria){
            Query query = new Query(criteria);
            log.info("[Mongo Dao] deleteById:" + query);
            if(null!=query && this.queryOne(query)!=null){
                this.mongoTemplate.remove(query, this.getEntityClass());
            }
        }
    }

    /**
     * 删除对象
     */
    public void delete(T t){
        log.info("[Mongo Dao] delete:" + t);
        this.mongoTemplate.remove(t);
    }



    /**
     * 更新满足条件的第一个记录
     */
    public void updateFirst(Query query,Update update){
        log.info("[Mongo Dao] updateFirst:query(" + query + "),update(" + update + ")");
        this.mongoTemplate.updateFirst(query, update, this.getEntityClass());
    }

    /**
     * 更新满足条件的所有记录
     */
    public void updateMulti(Query query, Update update){
        log.info("[Mongo Dao] updateMulti:query(" + query + "),update(" + update + ")");
        this.mongoTemplate.updateMulti(query, update, this.getEntityClass());
    }

    /**
     * 查找更新,如果没有找到符合的记录,则将更新的记录插入库中
     */
    public void updateInser(Query query, Update update){
        log.info("[Mongo Dao] updateInsert:query(" + query + "),update(" + update + ")");
        this.mongoTemplate.upsert(query, update, this.getEntityClass());
    }

    /**
     * 返回反射的类型
     */
    protected abstract Class<T> getEntityClass();
}