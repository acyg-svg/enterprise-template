package cn.cyg.enterprise.dao;

import cn.cyg.enterprise.entity.CartItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartItemMapper {
    int deleteByPrimaryKey(Long cartItemId);

    int insert(CartItem record);

    int insertSelective(CartItem record);

    CartItem selectByPrimaryKey(Long cartItemId);

    CartItem selectByUserIdAndGoodsId(@Param("MallUserId") Long MallUserId, @Param("goodsId") Long goodsId);

    List<CartItem> selectByUserId(@Param("MallUserId") Long MallUserId, @Param("number") int number);

    int selectCountByUserId(Long MallUserId);

    int updateByPrimaryKeySelective(CartItem record);

    int updateByPrimaryKey(CartItem record);

    int deleteBatch(List<Long> ids);
}