package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.entity.Menu;
import Qaru.Prj.domain.entity.Order;
import Qaru.Prj.domain.entity.OrderMenu;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.enums.StatusType;
import Qaru.Prj.domain.request.OrderRequest;
import Qaru.Prj.domain.response.OrderMenuCheckResponse;
import Qaru.Prj.domain.response.OrdersResponse;
import Qaru.Prj.repository.Impl.UserRepositoryImpl;
import Qaru.Prj.repository.MenuRepository;
import Qaru.Prj.repository.OrderMenuRepository;
import Qaru.Prj.repository.OrderRepository;
import Qaru.Prj.repository.ShopRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final MenuRepository menuRepository;
    private final OrderRepository orderRepository;
    private final OrderMenuRepository orderMenuRepository;
    private final ShopRepository shopRepository;
    private final UserRepositoryImpl userRepositoryImpl;

    @Transactional
    public List<Order> createOrder(List<OrderRequest> orderRequest, PrincipalDetails request, Long id) {

        List<Order> list = new ArrayList<>();
        Shop shop = shopRepository.findById(id).get();

        OrderMenu orderMenu = OrderMenu.builder()
                .user(request.getUser())
                .orderMenuPrice(0L)
                .orderMenuCount(0L)
                .shop(shop)
                .build();

        orderMenuRepository.save(orderMenu);

        for(int i = 0; i < orderRequest.size(); i++){

            Menu menu = menuRepository.findById(orderRequest.get(i).getMenuId()).get();

            Order order  = Order.builder()
                    .orderCount(orderRequest.get(i).getOrderCount())
                    .orderMenu(orderMenu)
                    .menu(menu)
                    .build();

            orderRepository.save(order);

            orderMenu.updateOrderMenu(orderRequest.get(i).getOrderCount(), menu.getMenuPrice());

            list.add(order);
        }

        return list;
    }

    public List<OrdersResponse> myOrders(PrincipalDetails request) {

        List<OrdersResponse> responseOrders = userRepositoryImpl.ordersList(request.getUser().getId());
        List<OrdersResponse> ordersList = new ArrayList<>();
        List<OrderMenuCheckResponse> orderDatas = new ArrayList<>();
        Long beforeId = 0L;
        Long afterId = 0L;
        String ordersMenuName = "";

        for(int i = 0; i < responseOrders.size(); i++){

            beforeId = responseOrders.get(i).getOrderMenuId();

            // 같지 않을 경우
            if(!(beforeId.compareTo(afterId) == 0) && i > 0){

                OrdersResponse ordersResponse = responseOrders.get(i - 1);
                ordersMenuName = ordersMenuName.substring(0, ordersMenuName.length() - 2);

                ordersResponse.setMenuNameAll(ordersMenuName);
                ordersResponse.setOrderData(orderDatas);
                ordersMenuName = "";
                orderDatas = new ArrayList<>();

                ordersList.add(ordersResponse);

            }else if(i == responseOrders.size() - 1){

                ordersMenuName += responseOrders.get(i).getMenuName() + ", ";
                OrdersResponse ordersResponse = responseOrders.get(i);
                ordersMenuName = ordersMenuName.substring(0, ordersMenuName.length() - 2);

                ordersResponse.setMenuNameAll(ordersMenuName);
                ordersResponse.setOrderData(orderDatas);

                ordersList.add(ordersResponse);
            }

            ordersMenuName += responseOrders.get(i).getMenuName() + ", ";
            orderDatas.add(new OrderMenuCheckResponse().orderDataSet(responseOrders.get(i)));
            afterId = responseOrders.get(i).getOrderMenuId();
        }


        return ordersList;
    }

    public List<OrdersResponse> adminOrders(PrincipalDetails request) {

        List<OrdersResponse> responseOrders = userRepositoryImpl.adminOrdersList(request.getUser().getId());
        List<OrdersResponse> ordersList = new ArrayList<>();
        List<OrderMenuCheckResponse> orderDatas = new ArrayList<>();
        Long beforeId = 0L;
        Long afterId = 0L;
        String ordersMenuName = "";

        for(int i = 0; i < responseOrders.size(); i++){

            beforeId = responseOrders.get(i).getOrderMenuId();

            // 같지 않을 경우
            if(!(beforeId.compareTo(afterId) == 0) && i > 0){

                OrdersResponse ordersResponse = responseOrders.get(i - 1);
                ordersMenuName = ordersMenuName.substring(0, ordersMenuName.length() - 2);

                ordersResponse.setMenuNameAll(ordersMenuName);
                ordersResponse.setOrderData(orderDatas);
                ordersMenuName = "";
                orderDatas = new ArrayList<>();

                ordersList.add(ordersResponse);

            }else if(i == responseOrders.size() - 1){

                ordersMenuName += responseOrders.get(i).getMenuName() + ", ";
                OrdersResponse ordersResponse = responseOrders.get(i);
                ordersMenuName = ordersMenuName.substring(0, ordersMenuName.length() - 2);

                ordersResponse.setMenuNameAll(ordersMenuName);
                ordersResponse.setOrderData(orderDatas);

                ordersList.add(ordersResponse);
            }

            ordersMenuName += responseOrders.get(i).getMenuName() + ", ";
            orderDatas.add(new OrderMenuCheckResponse().orderDataSet(responseOrders.get(i)));
            afterId = responseOrders.get(i).getOrderMenuId();
        }


        return ordersList;
    }

    @Transactional
    public StatusType updateOrderStatus(Long id, String value) {

        Optional<OrderMenu> findOrderMenu = orderMenuRepository.findById(id);
        if(findOrderMenu.isPresent()){
            return findOrderMenu.get().updateOrderStatus(value).getStatusType();
        }else{
            return null;
        }
    }
}
