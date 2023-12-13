//package Qaru.Prj.config.customSecurity;
//
//import Qaru.Prj.domain.entity.User;
//import Qaru.Prj.repository.UserRepository;
//import com.mysql.cj.log.Log;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import javax.servlet.http.HttpSession;
//import java.util.Optional;
//
//@Service
//public class PrincipalDetailsService implements UserDetailsService {
//
//    @Autowired
//    private UserRepository userRepository;
//
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        Optional<User> userEntity = userRepository.findByUserId(username);
//
//        if(!userEntity.isPresent()){
//            throw new UsernameNotFoundException(username);
//        }
//        return new PrincipalDetails(userEntity.get());
//    }
//}
