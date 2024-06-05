# PocketSalad



## 목차

- [개요](https://github.com/JongHoonKim1004/Project_Survey#-개요)

- [기술 스택](https://github.com/JongHoonKim1004/Project_Survey#-기술-스택)

- [프로젝트 설계](https://github.com/JongHoonKim1004/Project_Survey#-프로젝트-설계)

- [핵심 기능](https://github.com/JongHoonKim1004/Project_Survey#-핵심-기능)

- [주요기능 실행화면](https://github.com/JongHoonKim1004/Project_Survey#-주요기능-실행화면)

- [개선사항](https://github.com/oh_my_car/Project_Survey#-개선사항)

## 🚩 개요

- 프로젝트 목표 : 다양한 API 이용과 분리된 서버와 클라이언트 이용을 위한 `spring`, `jsp` `thymeLeaf` 자동차 관리 사이트
- 개발 기간 : 24/04/23 ~ 24/05/30

## 🔧 기술 스택

- Language : `Java(11)`, `JavaScript(ES6)`
- Library & Framework : `Spring(5.2.7.RELEASE)`, `thymeLeaf(3.0.11.RELEASE)`, `mybatis(3.5.14)`, `jackson(2.16.1)`, `Spring Security(5.2.7.RELEASE)`
- Database : `Oracle(11.2.0.2.0)`
- Target : `Web Browser`

- Tool : `STS`, `VSCode`
- ETC : `Git`

## 👾 프로젝트 설계, 구현 📂 PPT 📂 (ERD, USECASE)

|![1](https://github.com/misosiruda/oh_my_car/assets/155126222/f1896d85-9d59-4716-a6e2-67ed5f9096a3) | ![2](https://github.com/misosiruda/oh_my_car/assets/155126222/342f7634-8743-41c3-a5bb-631adceb9edc) |
| :-------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------: |
| ![3](https://github.com/misosiruda/oh_my_car/assets/155126222/438c0f52-8836-49be-bb59-fc3c97e29241) | ![4](https://github.com/misosiruda/oh_my_car/assets/155126222/cd4c71d1-5b50-4e22-94ca-39ffdf830e8b) |
| ![5](https://github.com/misosiruda/oh_my_car/assets/155126222/97beab33-3ff5-4b38-b5ab-290ab701d16e) | ![6](https://github.com/misosiruda/oh_my_car/assets/155126222/140bcea4-48d3-4dcb-8716-2210413a2ce1) |
| ![7](https://github.com/misosiruda/oh_my_car/assets/155126222/c8afd94d-64c7-4a47-a631-153718375bd2) | ![8](https://github.com/misosiruda/oh_my_car/assets/155126222/c5e2a829-97c9-4bbe-af12-89867f56a83c) |
| ![9](https://github.com/misosiruda/oh_my_car/assets/155126222/e1d46de6-a797-49d1-9bc7-073457d77c3e) | ![10](https://github.com/misosiruda/oh_my_car/assets/155126222/9942c4d3-e017-4c65-b2ec-3ceb19b36d83) |
| ![11](https://github.com/misosiruda/oh_my_car/assets/155126222/ffe87105-67fa-405d-9b53-2e15554e8a51) | ![12](https://github.com/misosiruda/oh_my_car/assets/155126222/ec9284e2-af95-4b04-ae54-618ede342893) |
| ![13](https://github.com/misosiruda/oh_my_car/assets/155126222/064e944f-7539-40fd-a3fe-cef51eef019b) | ![14](https://github.com/misosiruda/oh_my_car/assets/155126222/4984a346-fb9e-4d25-b05d-24f8d98aa09e) |
|![15](https://github.com/misosiruda/oh_my_car/assets/155126222/4c3ffb39-320b-4661-823a-c943dbf2b00e) | ![16](https://github.com/misosiruda/oh_my_car/assets/155126222/49b649db-0323-45bc-887d-b1448c5ca985) |
| ![17](https://github.com/misosiruda/oh_my_car/assets/155126222/6b613af4-65b8-45f5-98f5-d6db3e5834dd) | ![18](https://github.com/misosiruda/oh_my_car/assets/155126222/a893250e-fec7-4957-83d7-b6b550e7a6ef) |
| ![19](https://github.com/misosiruda/oh_my_car/assets/155126222/e785abb7-4df1-4251-a117-28120aea0610) | ![20](https://github.com/misosiruda/oh_my_car/assets/155126222/62dfe134-f1aa-4975-916f-0b04cae47ebe) |
| ![21](https://github.com/misosiruda/oh_my_car/assets/155126222/109e1e1f-5362-4a6a-9a65-d68a1dd6fdc1) | ![22](https://github.com/misosiruda/oh_my_car/assets/155126222/ed6ff825-b0a4-4d53-b6e4-581d313474af) |
| ![23](https://github.com/misosiruda/oh_my_car/assets/155126222/4e6bcd19-13d7-40f6-a0d7-b84112dfb52f) |

## 💻 핵심 기능

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

- ##### 차량 토막 상식

  - 차량 토막 상식 읽기

#### 👷‍♂️ 관리자

- ##### 관리자 회원가입

  - 아이디, 이메일 중복확인
  - 입력 양식 정규식처리
  - 유효성검사

- ##### 자동차 토막상식 관리

  - 자동차 토막상식 작성,수정,삭제

## 🎇 주요기능 실행화면

## **🏠 메인 페이지**

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

### **문의게시판**

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
<details><summary>열기</summary>

    ![main](https://github.com/yje0515/PocketSalad/assets/155126222/eeb336b3-003b-4903-8ea5-2c5bae9b4d13)

</details>