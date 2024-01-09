package Qaru.Prj.service;


import Qaru.Prj.domain.entity.Reservation;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.repository.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@SpringBootTest
public class NPlusOneTests {

    @Autowired
    private TourRepository tourRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private ReservationRepository reservationRepository;

    @Test
    @Transactional
    void N플러스1테스트(){
        List<Reservation> all =
                reservationRepository.findAll();

        System.out.println("============= > : " + all.get(0).getUser());
    }

}
