# Qaru(큐아루)
<br><br>
- **노션** : [[https://relieved-centaur-19d.notion.site/Qaru-f0937ebd2fc7479985f41987dd64dc45?pvs=4](https://relieved-centaur-19d.notion.site/Qaru-f0937ebd2fc7479985f41987dd64dc45?pvs=4)](https://relieved-centaur-19d.notion.site/Qaru-f0937ebd2fc7479985f41987dd64dc45?pvs=4)
  <br><br> 사이드 프로젝트의 정보를 정리해두었습니다.

<br><br>
<hr>

# 소개

이 프로젝트는 해외여행을 하던 중 우리나라에 관광을 하러 오는 외국인을 위한 편리한 페이지가 있다면 좋겠다고 생각하게되었습니다. QR코드를 찍으면 해당 가게의 정보 혹은 관광지의 정보를 표시할 수 있는 서비스를 만들어 보고자 합니다

<br><br>

# DB 다이어그램

![111](https://github.com/AiRn33/Qaru/assets/106871053/aab44596-2b8c-4f90-a85e-a628ba175085)

<br><br>


# 주요 기능
<br>

- **회원관련 기능**<br><br>
 spring security를 통해 로그인을 처리하였고, 각 페이지별 권한이 없으면 접근을 못하도록 막아 뒀으며, 일반유저, 어드민(사장) 유저로 유저를 구분하여 상점을 등록할 수 있게 지정해두었습니다.
어드민 유저는 주문 통계, 예약 지역 통계를 확인 가능하며, 주문처리, 예약처리가 가능합니다
 <br><br>
 
- **여행(게시판)**<br><br>
  여행 메뉴에서는 게시판 형태의 유저가 등록한 여행 소개글을 볼 수 있습니다. 여행 게시글에 유저는 좋아요 표시를 할 수 있고, 댓글을 달 수 있습니다. 또한 등록된 여행 게시글의 주소를 바탕으로 지도를 확인과 등록된 여행지의 사진도 확인이 가능합니다.
 <br><br>

- **상점(결제)**<br><br>
  상점 메뉴에서는 어드민(사장) 유저가 자신의 가게를 등록하고, 가게의 메뉴를 등록할 수 있습니다. 메뉴 등록 시 상점 메뉴에 노출 허용을 선택하면, 리스트에 출력이 됩니다. 상점 메뉴에서 유저들은 해당 가게의 상품들을 확인할 수 있으며, 해당 가게에 주문을 할 수 있습니다. 수량을 선택 후 주문을 하면, 카카오페이로 결제를 진행할 수 있고, 결제 후 주문내역에서 결제 된 상품을 확인할 수 있습니다. 또한 예약 기능을 통해서 상점에 방문 예약을 할 수 있습니다.
  <br><br>

- **QR코드 생성**<br><br>
  유저는 자신이 원하는 URL의 QR코드를 생성할 수 있습니다. 또한 작성한 여행 게시글이 있다면, 해당 여행 게시글로 연결되는 QR코드를 생성할 수 있습니다.
  <br><br>

- **에러 처리 및 유효성검사**<br><br>
통합적인 에러가 발생시에는 에러페이지로 이동하도록 설정되어있으며, 유효성검사의 경우 공통적으로 동기의 경우, 백단에서 errorScript를 만들어서 model로 넘길 수 있도록 공통화 해두었고, 비동기방식의 경우 프론트 단에서 에러메시지를 전송할 수 있도록 공통화 처리해두었습니다.
<br><br>

# 기술 스택 <Br><br>
- **JAVA 11**<br>
- **SpringBoot 2.7**<br>
- **MySql**<br>
- **JPA & QueryDSL**<br>
- **BootStrap**<br>

<br><br>





