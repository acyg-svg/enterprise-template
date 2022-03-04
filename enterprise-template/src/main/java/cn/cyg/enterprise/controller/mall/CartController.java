package cn.cyg.enterprise.controller.mall;

import cn.cyg.enterprise.controller.vo.CartItemVO;
import cn.cyg.enterprise.entity.CartItem;
import cn.cyg.enterprise.service.CartService;
import cn.cyg.enterprise.util.Result;
import cn.cyg.enterprise.util.ResultGenerator;
import cn.cyg.enterprise.common.Constants;
import cn.cyg.enterprise.common.ServiceResultEnum;
import cn.cyg.enterprise.controller.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {

    @Resource
    private CartService cartService;

    @GetMapping("/shop-cart")
    public String cartListPage(HttpServletRequest request,
                               HttpSession httpSession) {
        UserVO user = (UserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        int itemsTotal = 0;
        int priceTotal = 0;
        List<CartItemVO> myShoppingCartItems = cartService.getCartItems(user.getUserId());
        if (!CollectionUtils.isEmpty(myShoppingCartItems)) {
            //购物项总数
            itemsTotal = myShoppingCartItems.stream().mapToInt(CartItemVO::getGoodsCount).sum();
            if (itemsTotal < 1) {
                return "error/error_5xx";
            }
            //总价
            for (CartItemVO cartItemVO : myShoppingCartItems) {
                priceTotal += cartItemVO.getGoodsCount() * cartItemVO.getSellingPrice();
            }
            if (priceTotal < 1) {
                return "error/error_5xx";
            }
        }
        request.setAttribute("itemsTotal", itemsTotal);
        request.setAttribute("priceTotal", priceTotal);
        request.setAttribute("myShoppingCartItems", myShoppingCartItems);
        return "mall/cart";
    }

    @PostMapping("/shop-cart")
    @ResponseBody
    public Result saveCartItem(@RequestBody CartItem cartItem,
                               HttpSession httpSession) {
        UserVO user = (UserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        cartItem.setUserId(user.getUserId());
        String saveResult = cartService.saveCartItem(cartItem);
        //添加成功
        if (ServiceResultEnum.SUCCESS.getResult().equals(saveResult)) {
            return ResultGenerator.genSuccessResult();
        }
        //添加失败
        return ResultGenerator.genFailResult(saveResult);
    }

    @PutMapping("/shop-cart")
    @ResponseBody
    public Result updateCartItem(@RequestBody CartItem cartItem,
                                 HttpSession httpSession) {
        UserVO user = (UserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        cartItem.setUserId(user.getUserId());
        String updateResult = cartService.updateCartItem(cartItem);
        //修改成功
        if (ServiceResultEnum.SUCCESS.getResult().equals(updateResult)) {
            return ResultGenerator.genSuccessResult();
        }
        //修改失败
        return ResultGenerator.genFailResult(updateResult);
    }

    @DeleteMapping("/shop-cart/{CartItemId}")
    @ResponseBody
    public Result updateCartItem(@PathVariable("CartItemId") Long CartItemId,
                                 HttpSession httpSession) {
        UserVO user = (UserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        Boolean deleteResult = cartService.deleteById(CartItemId,user.getUserId());
        //删除成功
        if (deleteResult) {
            return ResultGenerator.genSuccessResult();
        }
        //删除失败
        return ResultGenerator.genFailResult(ServiceResultEnum.OPERATE_ERROR.getResult());
    }

    @GetMapping("/shop-cart/settle")
    public String settlePage(HttpServletRequest request,
                             HttpSession httpSession) {
        int priceTotal = 0;
        UserVO user = (UserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        List<CartItemVO> myShoppingCartItems = cartService.getCartItems(user.getUserId());
        if (CollectionUtils.isEmpty(myShoppingCartItems)) {
            //无数据则不跳转至结算页
            return "/shop-cart";
        } else {
            //总价
            for (CartItemVO cartItemVO : myShoppingCartItems) {
                priceTotal += cartItemVO.getGoodsCount() * cartItemVO.getSellingPrice();
            }
            if (priceTotal < 1) {
                return "error/error_5xx";
            }
        }
        request.setAttribute("priceTotal", priceTotal);
        request.setAttribute("myShoppingCartItems", myShoppingCartItems);
        return "mall/order-settle";
    }
}