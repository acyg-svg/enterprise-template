package cn.cyg.enterprise.dao;

import cn.cyg.enterprise.entity.Order;
import cn.cyg.enterprise.util.PageQueryUtil;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(Long orderId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Long orderId);

    Order selectByOrderNo(String orderNo);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    List<Order> findOrderList(PageQueryUtil pageUtil);

    int getTotalOrders(PageQueryUtil pageUtil);

    List<Order> selectByPrimaryKeys(@Param("orderIds") List<Long> orderIds);

    int checkOut(@Param("orderIds") List<Long> orderIds);

    int closeOrder(@Param("orderIds") List<Long> orderIds, @Param("orderStatus") int orderStatus);

    int checkDone(@Param("orderIds") List<Long> asList);
}