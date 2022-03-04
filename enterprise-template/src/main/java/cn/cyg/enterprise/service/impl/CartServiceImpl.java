package cn.cyg.enterprise.service.impl;

import cn.cyg.enterprise.dao.CartItemMapper;
import cn.cyg.enterprise.entity.CartItem;
import cn.cyg.enterprise.entity.Goods;
import cn.cyg.enterprise.service.CartService;
import cn.cyg.enterprise.util.BeanUtil;
import cn.cyg.enterprise.common.Constants;
import cn.cyg.enterprise.common.ServiceResultEnum;
import cn.cyg.enterprise.controller.vo.CartItemVO;
import cn.cyg.enterprise.dao.GoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartItemMapper cartItemMapper;

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public String saveCartItem(CartItem cartItem) {
        CartItem temp = cartItemMapper.selectByUserIdAndGoodsId(cartItem.getUserId(), cartItem.getGoodsId());
        if (temp != null) {
            //已存在则修改该记录
            temp.setGoodsCount(cartItem.getGoodsCount());
            return updateCartItem(temp);
        }
        Goods goods = goodsMapper.selectByPrimaryKey(cartItem.getGoodsId());
        //商品为空
        if (goods == null) {
            return ServiceResultEnum.GOODS_NOT_EXIST.getResult();
        }
        int totalItem = cartItemMapper.selectCountByUserId(cartItem.getUserId()) + 1;
        //超出单个商品的最大数量
        if (cartItem.getGoodsCount() > Constants.SHOPPING_CART_ITEM_LIMIT_NUMBER) {
            return ServiceResultEnum.SHOPPING_CART_ITEM_LIMIT_NUMBER_ERROR.getResult();
        }
        //超出最大数量
        if (totalItem > Constants.SHOPPING_CART_ITEM_TOTAL_NUMBER) {
            return ServiceResultEnum.SHOPPING_CART_ITEM_TOTAL_NUMBER_ERROR.getResult();
        }
        //保存记录
        if (cartItemMapper.insertSelective(cartItem) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    @Override
    public String updateCartItem(CartItem cartItem) {
        CartItem cartItemUpdate = cartItemMapper.selectByPrimaryKey(cartItem.getCartItemId());
        if (cartItemUpdate == null) {
            return ServiceResultEnum.DATA_NOT_EXIST.getResult();
        }
        //超出单个商品的最大数量
        if (cartItem.getGoodsCount() > Constants.SHOPPING_CART_ITEM_LIMIT_NUMBER) {
            return ServiceResultEnum.SHOPPING_CART_ITEM_LIMIT_NUMBER_ERROR.getResult();
        }
        //当前登录账号的userId与待修改的cartItem中userId不同，返回错误
        if (!cartItemUpdate.getUserId().equals(cartItem.getUserId())) {
            return ServiceResultEnum.NO_PERMISSION_ERROR.getResult();
        }
        //数值相同，则不执行数据操作
        if (cartItem.getGoodsCount().equals(cartItemUpdate.getGoodsCount())) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        cartItemUpdate.setGoodsCount(cartItem.getGoodsCount());
        cartItemUpdate.setUpdateTime(new Date());
        //修改记录
        if (cartItemMapper.updateByPrimaryKeySelective(cartItemUpdate) > 0) {
            return ServiceResultEnum.SUCCESS.getResult();
        }
        return ServiceResultEnum.DB_ERROR.getResult();
    }

    @Override
    public CartItem getCartItemById(Long MallShoppingCartItemId) {
        return cartItemMapper.selectByPrimaryKey(MallShoppingCartItemId);
    }

    @Override
    public Boolean deleteById(Long shoppingCartItemId, Long userId) {
        CartItem cartItem = cartItemMapper.selectByPrimaryKey(shoppingCartItemId);
        if (cartItem == null) {
            return false;
        }
        //userId不同不能删除
        if (!userId.equals(cartItem.getUserId())) {
            return false;
        }
        return cartItemMapper.deleteByPrimaryKey(shoppingCartItemId) > 0;
    }

    @Override
    public List<CartItemVO> getCartItems(Long MallUserId) {
        List<CartItemVO> cartItemVOS = new ArrayList<>();
        List<CartItem> cartItems = cartItemMapper.selectByUserId(MallUserId, Constants.SHOPPING_CART_ITEM_TOTAL_NUMBER);
        if (!CollectionUtils.isEmpty(cartItems)) {
            //查询商品信息并做数据转换
            List<Long> MallGoodsIds = cartItems.stream().map(CartItem::getGoodsId).collect(Collectors.toList());
            List<Goods> goods = goodsMapper.selectByPrimaryKeys(MallGoodsIds);
            Map<Long, Goods> MallGoodsMap = new HashMap<>();
            if (!CollectionUtils.isEmpty(goods)) {
                MallGoodsMap = goods.stream().collect(Collectors.toMap(Goods::getGoodsId, Function.identity(), (entity1, entity2) -> entity1));
            }
            for (CartItem cartItem : cartItems) {
                CartItemVO cartItemVO = new CartItemVO();
                BeanUtil.copyProperties(cartItem, cartItemVO);
                if (MallGoodsMap.containsKey(cartItem.getGoodsId())) {
                    Goods goodsTemp = MallGoodsMap.get(cartItem.getGoodsId());
                    cartItemVO.setGoodsCoverImg(goodsTemp.getGoodsCoverImg());
                    String goodsName = goodsTemp.getGoodsName();
                    // 字符串过长导致文字超出的问题
                    if (goodsName.length() > 28) {
                        goodsName = goodsName.substring(0, 28) + "...";
                    }
                    cartItemVO.setGoodsName(goodsName);
                    cartItemVO.setSellingPrice(goodsTemp.getSellingPrice());
                    cartItemVOS.add(cartItemVO);
                }
            }
        }
        return cartItemVOS;
    }
}