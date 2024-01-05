package Qaru.Prj.domain.response;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class ReservationAreaList {

    private String cityName;
    private Long count;
    private Long seoul = 0L;
    private Long incheon = 0L;
    private Long gwangju = 0L;
    private Long daegu = 0L;
    private Long daejeon = 0L;
    private Long ulsan = 0L;
    private Long busan = 0L;
    private Long jeju = 0L;
    private Long sejong = 0L;
    private Long gyeonggi = 0L;
    private Long gangwon = 0L;
    private Long chungbuk = 0L;
    private Long chungnam = 0L;
    private Long jeonbuk = 0L;
    private Long jeonnam = 0L;
    private Long gyeongbuk = 0L;
    private Long gyeongnam = 0L;

    public ReservationAreaList setAreaList(List<ReservationAreaList> list){

        for(int i = 0; i < list.size(); i++){
            String area = list.get(i).cityName;

            if(area.equals("서울")){
                this.seoul = list.get(i).count;
            }else if(area.equals("인천")){
                this.incheon = list.get(i).count;
            }else if(area.equals("광주")){
                this.gwangju = list.get(i).count;
            }else if(area.equals("대구")){
                this.daegu = list.get(i).count;
            }else if(area.equals("대전")){
                this.daejeon = list.get(i).count;
            }else if(area.equals("울산")){
                this.ulsan = list.get(i).count;
            }else if(area.equals("부산")){
                this.busan = list.get(i).count;
            }else if(area.equals("제주")){
                this.jeju = list.get(i).count;
            }else if(area.equals("세종")){
                this.sejong = list.get(i).count;
            }else if(area.equals("경기")){
                this.gyeonggi = list.get(i).count;
            }else if(area.equals("강원")){
                this.gangwon = list.get(i).count;
            }else if(area.equals("충북")){
                this.chungbuk = list.get(i).count;
            }else if(area.equals("충남")){
                this.chungnam = list.get(i).count;
            }else if(area.equals("전북")){
                this.jeonbuk = list.get(i).count;
            }else if(area.equals("전남")){
                this.jeonnam = list.get(i).count;
            }else if(area.equals("경북")){
                this.gyeongbuk = list.get(i).count;
            }else if(area.equals("경남")){
                this.gyeongnam = list.get(i).count;
            }
        }

        return this;
    }

}
