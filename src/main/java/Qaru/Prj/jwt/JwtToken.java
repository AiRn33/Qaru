package Qaru.Prj.jwt;


import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class JwtToken {
    private String accessToken;
    private String refreshToken;
    private String grantType;
    private Long expiresIn;

    public static JwtToken of(String accessToken, String refreshToken, String grantType, Long expiresIn) {
        return new JwtToken(accessToken, refreshToken, grantType, expiresIn);
    }
}
