package Qaru.Prj.service;

import Qaru.Prj.config.customSecurity.PrincipalDetails;
import Qaru.Prj.domain.request.OrderRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    public void createOrder(List<OrderRequest> orderRequest, PrincipalDetails request) {
    }
}
