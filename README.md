# PocketSalad



# 목차

- [개요](https://github.com/yje0515/PocketSalad?tab=readme-ov-file#-%EA%B0%9C%EC%9A%94)

- [기술 스택](https://github.com/yje0515/PocketSalad?tab=readme-ov-file#-%EA%B8%B0%EC%88%A0-%EC%8A%A4%ED%83%9D)

- [프로젝트 설계](https://github.com/yje0515/PocketSalad?tab=readme-ov-file#-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EC%84%A4%EA%B3%84-%EA%B5%AC%ED%98%84--ppt--erd-usecase)

- [핵심 기능](https://github.com/yje0515/PocketSalad?tab=readme-ov-file#-%ED%95%B5%EC%8B%AC-%EA%B8%B0%EB%8A%A5)

- [주요기능 실행화면](https://github.com/yje0515/PocketSalad?tab=readme-ov-file#-%EC%A3%BC%EC%9A%94%EA%B8%B0%EB%8A%A5-%EC%8B%A4%ED%96%89%ED%99%94%EB%A9%B4)

- [개선사항](https://github.com/yje0515/PocketSalad?tab=readme-ov-file#-%EA%B0%9C%EC%84%A0%EC%82%AC%ED%95%AD)

- [사이트 전체 이미지 보기](https://github.com/yje0515/PocketSalad?tab=readme-ov-file#-%EC%82%AC%EC%9D%B4%ED%8A%B8%EC%A0%84%EC%B2%B4%EB%B3%B4%EA%B8%B0)

# 🚩 개요

- 프로젝트 목표 : 다양한 API 이용과 분리된 서버와 클라이언트 이용을 위한 `spring`, `jsp` `thymeLeaf` 자동차 관리 사이트
- 개발 기간 : 24/04/23 ~ 24/05/30

# 🔧 기술 스택

- Language : `Java(11)`, `JavaScript(ES6)`
- Library & Framework : `Spring(5.2.7.RELEASE)`, `thymeLeaf(3.0.11.RELEASE)`, `mybatis(3.5.14)`, `jackson(2.16.1)`, `Spring Security(5.2.7.RELEASE)`
- Database : `Oracle(11.2.0.2.0)`
- Target : `Web Browser`

- Tool : `STS`, `VSCode`
- ETC : `Git`

# 👾 프로젝트 설계, 구현 📂 PPT 📂 (ERD, USECASE)

| ![1](https://github.com/user-attachments/assets/63f7c723-adc3-44cb-9a72-36bbbf271e70) | ![2](https://github.com/user-attachments/assets/a2d30930-c320-4622-b6bd-379242c45340) |
|:--:|:--:|
| ![3](https://github.com/user-attachments/assets/73907c41-8387-4df4-8831-2d530292fbbe) | ![4](https://github.com/user-attachments/assets/fd0a304a-9544-4635-80ee-19fd4ed30053) |
| ![5](https://github.com/user-attachments/assets/f3f96db3-5787-4d20-b7d4-2cf3a6cbf6ab) | ![6](https://github.com/user-attachments/assets/0c585c9a-8020-4350-985f-a2bb4386c844) |
| ![7](https://github.com/user-attachments/assets/7ec55f5d-af9f-400e-b31e-a05cd2f46f75) | ![8](https://github.com/user-attachments/assets/f5e27bfb-4493-4742-8b48-5e6cae7acac0) |
| ![9](https://github.com/user-attachments/assets/23544426-1275-406e-b042-542210f37c48) | ![10](https://github.com/user-attachments/assets/fff4cdb1-c66b-409c-9f13-5305b633d7e2) |
| ![11](https://github.com/user-attachments/assets/2fba122d-d25f-4782-86a2-17da31fa861e) | ![12](https://github.com/user-attachments/assets/e06a0cdb-2f05-4420-a211-0afc61d990e5) |
| ![13](https://github.com/user-attachments/assets/e6ed1601-6ead-4bf8-a681-705ef22f1bf2) | ![14](https://github.com/user-attachments/assets/86ae80e7-6c75-4dca-9715-6335f826298d) |
| ![15](https://github.com/user-attachments/assets/ff59d714-1f60-4ea7-90c1-743a30a61897) |


# 💻 핵심 기능

### 🛠️ 차량 부품 교체 주기 확인

- #### 현대 자동차 API

  - `현대자동차 API`를 통해 로그인 한 사람의 경우 해당 회원의 차량의 현재 `누적 주행 거리`를 구해올 수 있습니다.
    구해온 누적 주행 거리를 토대로 각 `부품의 교체주기`를 확인할 수 있습니다.
  - API를 통해 로그인 하지 않은 사람이더라도 직접 누적 주행거리를 입력하거나,
    부품 교체시기를 입력해 간편하게 부품 교체 주기를 확인할 수 있습니다.

#### 🙍 일반회원

- ##### 로그인

  - 비밀번호 암호화

- ##### 회원가입

  - 아이디, 이메일 중복확인
  - 입력 양식 정규식처리
  - 유효성검사

- ##### 마이페이지

  - 회원 정보 수정
  - 차량 신규 등록
  - 차량 목록
  - 회원탈퇴

- ##### 자유게시판

  - 게시글 작성,수정,삭제
  - 게시글에 댓글 작성


#### 👷‍♂️ 관리자

- ##### 관리자 회원가입

  - 아이디, 이메일 중복확인
  - 입력 양식 정규식처리
  - 유효성검사


# 🎇 주요기능 실행화면

### **🏠 메인 페이지**

- **🚶‍♂️ 로그인**

  - 모든 페이지에서 우측 상단의 `로그인`버튼을 통해 로그인 할 수 있습니다.

    ![login](https://github.com/yje0515/PocketSalad/assets/155126222/37b64048-0fd3-4e38-9ccb-6809d92f8acb)


- **🙍 회원가입**

  - 우측 상단 `회원가입`버튼이나, 로그인화면에서 회원가입버튼을 통해 회원가입을 할 수 있습니다. 
  - 입력된 아이디와 DB에 존재하는 아이디를 비교해서 아이디중복검사를 할 수 있습니다. 중복되지 않을 시에만 사용 가능합니다.

    ![join](https://github.com/yje0515/PocketSalad/assets/155126222/b4fd99d9-c9a3-46aa-8fa5-114123c01db7)

- **📄 회원정보 수정**
  - 로그인시 보이는 `마이페이지`아이콘을 눌러서 접근할 수 있습니다.
  - `회원 정보 수정` 에서는 회원정보를 변경할 수 있습니다.
      
    ![userUpdate](https://github.com/yje0515/PocketSalad/assets/155126222/c149ba75-7628-4b09-9b69-7dacca80ac3b)
      

- **👋 로그아웃**

  - 모든 페이지 우측 상단의 `로그아웃`을 통해 로그아웃 할 수 있습니다.
  - 로그인한 사용자의 정보를 저장한 세션을 만료시킵니다.

    ![logout](https://github.com/yje0515/PocketSalad/assets/155126222/29ecae1c-972a-47b8-b34b-f379c9295523)

### **📋 문의게시판**

- **게시판 목록**

  - 게시판 목록

- **게시글 등록**

  - 게시글 등록

    ![boardWriteRead](https://github.com/yje0515/PocketSalad/assets/155126222/e46bc8bb-8820-4836-91a5-a2853b619f29)

- **게시글 수정**

  - 게시글 수정

    ![boardUpdate](https://github.com/yje0515/PocketSalad/assets/155126222/1a8ac2d8-43f0-4a44-8f70-75d4d95db101)

- **게시글 삭제**

  - 게시글 삭제

    ![boardDelete](https://github.com/yje0515/PocketSalad/assets/155126222/e0561405-2866-4e0f-9476-9ed3789cf978)

- **게시판 목록 페이징**
  - 게시판 목록 페이징

    ![boardPaging](https://github.com/yje0515/PocketSalad/assets/155126222/ceae2798-37d1-4c22-a45c-9f7c39558dd2)


### **관리자용 상품등록**

- **상품 목록**

  - 상품 

- **상품 등록**

  - 상품 

    ![productWrite](https://github.com/yje0515/PocketSalad/assets/155126222/ba1429e5-d87c-45b2-88c8-80492a2ed150)

- **상품 수정**

  - 상품 

- **상품 삭제**

  - 상품 

    ![productUpdateDelete](https://github.com/yje0515/PocketSalad/assets/155126222/f75e979d-0c2b-458f-a5e1-727fe2477684)


## 🌄 개선사항

- **😃 회원**
  - 

- **🎸기타**
  - 

## 📷 사이트전체보기
  - 
    ![main](https://github.com/yje0515/PocketSalad/assets/155126222/eeb336b3-003b-4903-8ea5-2c5bae9b4d13)
