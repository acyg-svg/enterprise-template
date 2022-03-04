package cn.cyg.enterprise.service;

import cn.cyg.enterprise.entity.CartItem;
import cn.cyg.enterprise.controller.vo.CartItemVO;

import java.util.List;

public interface CartService {

    /**
     * 保存商品至购物车中
     *
     * @param cartItem
     * @return
     */
    String saveCartItem(CartItem cartItem);

    /**
     * 修改购物车中的属性
     *
     * @param cartItem
     * @return
     */
    String updateCartItem(CartItem cartItem);

    /**
     * 获取购物项详情
     *
     * @param newBeeMallShoppingCartItemId
     * @return
     */
    CartItem getCartItemById(Long newBeeMallShoppingCartItemId);

    /**
     * 删除购物车中的商品
     *
     *
     * @param shoppingCartItemId
     * @param userId
     * @return
     */
    Boolean deleteById(Long shoppingCartItemId, Long userId);

    /**
     * 获取我的购物车中的列表数据
     *
     * @param MallUserId
     * @return
     */
    List<CartItemVO> getCartItems(Long MallUserId);
}
