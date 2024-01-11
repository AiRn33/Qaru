package Qaru.Prj.service;


import Qaru.Prj.CreateClass;
import Qaru.Prj.domain.entity.RefreshToken;
import Qaru.Prj.domain.entity.Reservation;
import Qaru.Prj.domain.entity.Shop;
import Qaru.Prj.domain.entity.User;
import Qaru.Prj.jwt.JwtTokenProvider;
import Qaru.Prj.repository.*;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.transaction.Transactional;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@SpringBootTest
public class NPlusOneTests {

    @Autowired
    private TourRepository tourRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ReservationRepository reservationRepository;

    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    @Autowired
    private RefreshTokenRepository refreshTokenRepository;

    private CreateClass createClass = new CreateClass();

//    @Test
//    @Transactional
//    void N플러스1테스트(){
//        List<Reservation> all =
//                reservationRepository.findAllJoinFetch();
//
//        System.out.println("============= > : " + all.get(0).getUser());
//    }

    @Test
    @Transactional
    void jwt토큰파싱확인() throws NoSuchAlgorithmException {

        // 유저 데이터 저장
        User user = userRepository.save(createClass.createUser());

        // 시간 설정 -- access : 1분 / refresh : 10분
        final long ACCESS_TOKEN_EXPIRE_TIME = 1000 * 60 * 1;            // 1분
        final long REFRESH_TOKEN_EXPIRE_TIME = 1000 * 60 * 60;            // 60분

        long now = (new Date()).getTime();
        Date accessTokenExpiredAt = new Date(now + ACCESS_TOKEN_EXPIRE_TIME);
        Date refreshTokenExpiredAt = new Date(now + REFRESH_TOKEN_EXPIRE_TIME);

        // accessToken 생성
        String accessToken = jwtTokenProvider.generate(user, accessTokenExpiredAt);

        // refresh 토큰 용 random 함수
        SecureRandom random = SecureRandom.getInstanceStrong();
        String refreshToken = String.valueOf(random.nextDouble());

        // refresh 토큰 저장
        RefreshToken refreshTokenEntity = RefreshToken.builder()
                .refreshToken(refreshToken)
                .user(user)
                .expDate(refreshTokenExpiredAt).build();
        RefreshToken refresh = refreshTokenRepository.save(refreshTokenEntity);

        // accessToken 확인
        Claims claims = jwtTokenProvider.parseClaims(accessToken);

        // accessToken 유효함
        System.out.println("=========== > userId : " + claims.getSubject());

        for(int i = 0; i < 65; i++){
            try{
                Thread.sleep(1000);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        System.out.println("========== > : 100초 경과");
        // accessToken 유효시간 만료
        Claims claims2 = jwtTokenProvider.parseClaims(accessToken);
        Long userId = refreshTokenRepository.findByRefreshToken(refreshToken).getUser().getId();

        // 토큰 값이 일치할 때

        String newAccessToken = jwtTokenProvider.generate(userRepository.findById(userId).get(), accessTokenExpiredAt);

        System.out.println("========== > new token : " + newAccessToken);

    }

}
