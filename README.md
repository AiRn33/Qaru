# Qaru(큐아루)
<br><br>
- **노션** : [https://relieved-centaur-19d.notion.site/Qaru-f0937ebd2fc7479985f41987dd64dc45?pvs=4](https://relieved-centaur-19d.notion.site/Qaru-f0937ebd2fc7479985f41987dd64dc45?pvs=4)
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
 <br><br>
 
- **여행(게시판)**<br><br>
  여행 메뉴에서는 게시판 형태의 유저가 등록한 여행 소개글을 볼 수 있습니다. 여행 게시글에 유저는 좋아요 표시를 할 수 있고, 댓글을 달 수 있습니다. 또한 등록된 여행 게시글의 주소를 바탕으로 지도를 확인과 등록된 여행지의 사진도 확인이 가능합니다.
 <br><br>

- **상점(결제)**<br><br>
  상점 메뉴에서는 어드민(사장) 유저가 자신의 가게를 등록하고, 가게의 메뉴를 등록할 수 있습니다. 메뉴 등록 시 상점 메뉴에 노출 허용을 선택하면, 리스트에 출력이 됩니다. 상점 메뉴에서 유저들은 해당 가게의 상품들을 확인할 수 있으며, 해당 가게에 주문을 할 수 있습니다. 수량을 선택 후 주문을 하면, 카카오페이로 결제를 진행할 수 있고, 결제 후 주문내역에서 결제 된 상품을 확인할 수 있습니다.
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

# 기능 소개

<br>

- **메인페이지**

  메인페이지에서는 각 메뉴들로 진입할 수 있는 버튼들이 존재합니다
<br>
<details>
<summary><b>메인페이지 확인하기(🖱️)</b></summary>
<div markdown="1">
  <br>
<div align="center">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/26e16b2b-7fed-414e-8b02-b3595f288cdd">
  ➡️ 메인페이지 <br><br>
</div>
<br>
</div>
</details>

<hr>
<br>

- **회원가입**

  회원가입에 필요한 정보로는 아이디, 비밀번호, 닉네임, 이메일이 필요하며 그 중 아이디, 닉네임, 이메일은 중복될 수 없습니다. 회원가입 시 입력한 이메일로 메일이 전송되며, 해당 메일의 인증번호를 입력하면 회원가입이 완료됩니다. 해당 인증번호는 **Redis**로 구현하였으며, 유효시간은 3분입니다.
<br>
<details>
<summary><b>회원가입 확인하기(🖱️)</b></summary>
<div markdown="1">
  <br>
<div align="center">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/0b6de9e9-0d42-4248-ae05-5487ff133e36">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/df9dba58-f8d2-4866-8420-50e84163d9f4">
  <br><br>
➡️ 회원가입 중복 처리 및 공백 처리 <br><br>
</div>
<hr>
<div align="center">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/df8ebbad-fbd7-4239-85c1-b3ae4f294ba6">
  <br><br>
➡️ 이메일 유효시간이 지나거나, 인증번호가 틀린 경우 <br><br>
</div>
<hr>
<br><br>
<div align="center">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/5725b851-1643-4248-b1fe-deefc522602a">
  <br><br>
➡️ 회원가입 성공 <br><br>
</div>
</div>
</details>
<hr>
<br>

- **로그인** <br><br>
  아이디와 비밀번호가 정상입력 됬을 시 로그인을 할 수 있습니다. 또한 아이디나 비밀번호를 잊어버렸을 시 가입시 입력한 이메일 정보로 아이디, 비밀번호를 찾을 수 있습니다.
<br><br>

<details>
<summary><b>로그인 확인하기(🖱️)</b></summary>
<br>
<div align="center">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/bb2c1b4a-f760-4bbf-9f5b-41ae09f77530">
    <br><br>
➡️ 로그인 실패  <br><br>
<hr>
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/d7bb6f67-7772-4c20-b3d8-34cedc0a7cc5">
  <br><br>
➡️ 로그인 성공  <br><br>
<hr>
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/b68e96ab-d550-4ce3-87a8-290d41b4ae2d">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/e756fceb-f599-4ce7-95ec-f40dc5cb79b3">
  <br><br>
➡️ 아이디 찾기  <br><br>
<hr>
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/cd41d4eb-e362-450e-ae90-cf4d830037f9">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/d125be2e-d6ba-4479-b206-f840235acce3">
    <br><br>
➡️ 비밀번호 찾기 실패 <br><br>
  <hr>
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/941a7252-f868-41d6-a370-dec09330b60d">
    <br><br>
➡️ 비밀번호 변경 실패  <br><br>
  <hr>
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/9f5a8493-6e4b-4515-96dd-43238b49ebfd">
  <br><br>
➡️ 비밀번호 찾기 성공<br><br>
</div>
</details>
<hr>
<br>
  
- **마이페이지**<br><br>

마이페이지에서는 회원 정보 수정이 가능하며, 일반 회원은 어드민 회원(사장 등록)이 가능합니다. 사장으로 전환 시 자신의 상점 정보를 입력해야합니다. 상점 정보 입력 후 상점의 상품을 입력할 수 있습니다.
<br><br>

<details>
<summary><b>마이페이지 확인하기(🖱️)</b></summary>
<br>
<div align="center">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/dda54463-51f7-415d-b5f3-fcc4dfedd012">
    <br><br>
➡️ 내 정보 수정 실패  <br><br>
<hr>
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/1128546c-97cf-41e5-952e-e11c7ecf5f43">
    <br><br>
➡️ 내 정보 수정 성공  <br><br>
<hr>
    <img src="https://github.com/AiRn33/Qaru/assets/106871053/15900070-fac9-4224-857a-249f9ff7f8d9">
    <img src="https://github.com/AiRn33/Qaru/assets/106871053/6b47994d-e7dd-4919-b3e6-70d02dc0f424">
    <br><br>
➡️ 사장 등록 <br><br>
<hr>
    <img src="https://github.com/AiRn33/Qaru/assets/106871053/f0d33844-7247-47b9-b3e2-45bdbe3617e7">
    <br><br>
➡️ 상점 메뉴 등록  <br><br>
</div>
</details>

<hr>
<br>


- **상점 메뉴**<br><br>

상점에서는 가게 등록을 한 유저들의 가게 정보를 볼 수 있습니다. 또한 해당 가게에 주문을 하고 결제를 할 수 있습니다.
<br><br>

<details>
<summary><b>상점 메뉴 확인하기(🖱️)</b></summary>
<br>
<div align="center">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/99941de1-8d8e-4c36-842d-2a27e0007d2a">
    <br><br>
➡️ 상점 메뉴 및 상세보기  <br><br>
<hr>
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/bca2db10-76bb-4777-969d-1a2af16fb410">
    <br><br>
➡️ 상점 주문 <br><br>
<hr>
    <img src="https://github.com/AiRn33/Qaru/assets/106871053/a523f64b-4c93-4048-8cdd-44501b883d03">
    <img src="https://github.com/AiRn33/Qaru/assets/106871053/ba9fc5fa-544b-4cbf-b3b3-ebd67789b600">
    <br><br>
➡️ 카카오 결제 <br><br>
<hr>
    <img src="https://github.com/AiRn33/Qaru/assets/106871053/fd98bb6e-516b-419a-8c47-9051af961f9f">
    <br><br>
➡️ 주문 내역 확인  <br><br>
</div>
</details>
<hr>
<br>


- **여행 메뉴**<br><br>

여행 메뉴에서는 사용자들이 자신이 소개하고 싶은 여행지에 대한 게시글을 작성할 수 있습니다. 또한 해당 게시글에 다른 유저들은 댓글과 대댓글을 작성하며 의견을 나눌 수 있고, 게시글/댓글/대댓글에 좋아요를 눌러줄 수 있습니다. 작성자가 등록한 여행지의 주소를 토대로 지도를 확인할 수 있습니다.
<br><br>

<details>
<summary><b>여행 메뉴 확인하기(🖱️)</b></summary>
<br>
<div align="center">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/a543ce1d-0de7-4b7b-8155-83d4745a6f12">
    <br><br>
➡️ 여행 생성  <br><br>
<hr>
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/abf59e2f-8561-49da-8dad-a0a2067de33f">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/b666f5b6-f411-40f5-859f-3600cb1dffb8">
    <br><br>
➡️ 여행 수정 <br><br>
<hr>
    <img src="https://github.com/AiRn33/Qaru/assets/106871053/93849eb8-26d9-4c16-85c5-44944f1e9f81">
    <br><br>
➡️ 여행 목록 확인 <br><br>
<hr>
    <img src="https://github.com/AiRn33/Qaru/assets/106871053/5e793be4-df34-42e9-bce2-cc71a4b3ac2b">
    <br><br>
➡️ 좋아요  <br><br>
<hr>
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/e122291c-264f-4847-90d6-47e47228c0c1">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/34663d5f-8cb2-4c67-a334-22a316556faa">
    <br><br>
➡️ 댓글, 대댓글 작성  <br><br>
<hr>
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/0de3c95b-0135-437e-9ee2-b32fef1e7d8e">
    <br><br>
➡️ 여행 지도  <br><br>
<hr>
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/dcc606a6-b291-45e5-8541-33b74b79e95b">
    <br><br>
➡️ 여행 검색  <br><br>
<hr>
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/6b338ed6-809d-4990-9ed4-825daa59273a">
    <br><br>
➡️ 여행 삭제  <br><br>
</div>
</details>
<hr>
<br>


- **QR 코드 메뉴**<br><br>
QR 코드 메뉴에서는 자신이 원하는 URL로 QR 코드를 생성하거나, 작성한 여행 게시글이 있다면, 해당 페이지로 이동할 수 있는 QR 코드를 생성할 수 있습니다
<br>
<details>
<summary><b>QR 코드 메뉴 확인하기(🖱️)</b></summary>
<br>
<div align="center">
  <img src="https://github.com/AiRn33/Qaru/assets/106871053/88562ba6-0055-494e-aee5-e1866f8d92ab">
    <br><br>
➡️ QR 코드 생성 <br><br>
</div>
</details>
<hr>
<br><br>





