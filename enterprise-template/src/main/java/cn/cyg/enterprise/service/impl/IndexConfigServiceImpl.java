package cn.cyg.enterprise.service.impl;

import cn.cyg.enterprise.common.ServiceResultEnum;
import cn.cyg.enterprise.controller.vo.IndexConfigGoodsVO;
import cn.cyg.enterprise.controller.vo.RecommendVO;
import cn.cyg.enterprise.dao.GoodsMapper;
import cn.cyg.enterprise.dao.OrderItemMapper;
import cn.cyg.enterprise.entity.IndexConfig;
import cn.cyg.enterprise.entity.Goods;
import cn.cyg.enterprise.entity.OrderItem;
import cn.cyg.enterprise.util.BeanUtil;
import cn.cyg.enterprise.util.PageQueryUtil;
import cn.cyg.enterprise.util.PageResult;
import cn.cyg.enterprise.dao.IndexConfigMapper;
import cn.cyg.enterprise.service.IndexConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class IndexConfigServiceImpl implements IndexConfigService {

    @Autowired
    private IndexConfigMapper indexConfigMapper;

    @Autowired
    private GoodsMapper goodsMapper;

    @Autowired
    private OrderItemMapper orderItemMapper;

    @Override
    public PageResult getConfigsPage(PageQueryUtil pageUtil) {
        List<IndexConfig> indexConfigs = indexConfigMapper.findIndexConfigList(pageUtil);
        int total = indexConfigMapper.getTotalIndexConfigs(pageUtil);
        PageResult pageResult = new PageResult(indexConfigs, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }

    @Override
    public String saveIndexConfig(IndexConfig indexConfig) {
        if (goodsMapper.selectByPrimaryKey(indexConfig.getGoodsId()) == null) {
            return ServiceResultEnum.GOODS_NOT_EXIST.getResult();
        }
        if (indexConfigMapper.selectByTypeAndGoodsId(indexConfig.getConfigType(), indexConfig.getGoodsId()) != null) {
            return ServiceResultEnum.SAME_INDEX_CONFIG_EXIST.getResult();
        }
        if (indexConfigMapper.insertSelective(indexConfig) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    @Override
    public String updateIndexConfig(IndexConfig indexConfig) {
        if (goodsMapper.selectByPrimaryKey(indexConfig.getGoodsId()) == null) {
            return ServiceResultEnum.GOODS_NOT_EXIST.getResult();
        }
        IndexConfig temp = indexConfigMapper.selectByPrimaryKey(indexConfig.getConfigId());
        if (temp == null) {
            return ServiceResultEnum.DATA_NOT_EXIST.getResult();
        }
        IndexConfig temp2 = indexConfigMapper.selectByTypeAndGoodsId(indexConfig.getConfigType(), indexConfig.getGoodsId());
        if (temp2 != null && !temp2.getConfigId().equals(indexConfig.getConfigId())) {
            //goodsId相同且不同id 不能继续修改
            return ServiceResultEnum.SAME_INDEX_CONFIG_EXIST.getResult();
        }
        indexConfig.setUpdateTime(new Date());
        if (indexConfigMapper.updateByPrimaryKeySelective(indexConfig) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    @Override
    public IndexConfig getIndexConfigById(Long id) {
        return null;
    }

    @Override
    public List<IndexConfigGoodsVO> getConfigGoodsesForIndex(int configType, int number) {
        List<IndexConfigGoodsVO> indexConfigGoodsVOS = new ArrayList<>(number);
        List<IndexConfig> indexConfigs = indexConfigMapper.findIndexConfigsByTypeAndNum(configType, number);
        System.out.println("goodsids为："+indexConfigs);
        if (!CollectionUtils.isEmpty(indexConfigs)) {
            //取出所有的goodsId
            List<Long> goodsIds = indexConfigs.stream().map(IndexConfig::getGoodsId).collect(Collectors.toList());
            List<Goods> goods = goodsMapper.selectByPrimaryKeys(goodsIds);
            indexConfigGoodsVOS = BeanUtil.copyList(goods, IndexConfigGoodsVO.class);
            for (IndexConfigGoodsVO indexConfigGoodsVO : indexConfigGoodsVOS) {
                String goodsName = indexConfigGoodsVO.getGoodsName();
                String goodsIntro = indexConfigGoodsVO.getGoodsIntro();
                // 字符串过长导致文字超出的问题
                if (goodsName.length() > 30) {
                    goodsName = goodsName.substring(0, 30) + "...";
                    indexConfigGoodsVO.setGoodsName(goodsName);
                }
                if (goodsIntro.length() > 22) {
                    goodsIntro = goodsIntro.substring(0, 22) + "...";
                    indexConfigGoodsVO.setGoodsIntro(goodsIntro);
                }
            }
        }
        return indexConfigGoodsVOS;
    }

    @Override
    public List<RecommendVO> getRecommends(int number) {
        List<RecommendVO> recommendVOS = new ArrayList<>(number);
        List<OrderItem> orderItems = orderItemMapper.selectHotGoodsInThisWeek(number);
        //System.out.println(orderItems);
        List<Long> recommendIds = orderItems.stream().map(OrderItem::getGoodsId).collect(Collectors.toList());
        List<Goods> recommendGoods = goodsMapper.selectByPrimaryKeys(recommendIds);
        System.out.println(recommendGoods);
        recommendVOS = BeanUtil.copyList(recommendGoods,RecommendVO.class);
        return recommendVOS;
    }

    @Override
    public Boolean deleteBatch(Long[] ids) {
        if (ids.length < 1) {
            return false;
        }
        //删除数据
        return indexConfigMapper.deleteBatch(ids) > 0;
    }

}