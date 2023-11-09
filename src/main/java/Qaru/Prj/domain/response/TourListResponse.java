package Qaru.Prj.domain.response;

import com.querydsl.core.types.dsl.DateTimeExpression;
import com.querydsl.core.types.dsl.NumberExpression;
import com.querydsl.core.types.dsl.StringExpression;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Pattern;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter
@Setter
@NoArgsConstructor
@ToString
@AllArgsConstructor
public class TourListResponse {

    private Long tour_id;

    private String tour_title;

    private String tour_content;

    private LocalDateTime tour_date;

}
