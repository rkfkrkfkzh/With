# readme

## Introduction

> Spring boot 를 사용하여 중고거래 웹 어플리케이션을 제작한다.


## 1. Entity Relationship Diagram

![1](https://user-images.githubusercontent.com/86057607/174211944-21889f0b-f764-4ed0-b909-80afffbbe448.png)
![2](https://user-images.githubusercontent.com/86057607/174222653-1d5a676c-6e2c-491a-bd0a-5b4b130fde72.png)


## 2. Class Diagram



## 3. 기술


### **SpringBoot**

- Java 8
- SpringBoot
- Spring Web MVC
- Oracle
- DBeaver
- Html
- Css
- JQuery
- jsp


# 4. 설명


## [1] 회원가입

![회원가입](https://user-images.githubusercontent.com/86057607/174213697-4c53b9d9-9b25-4a5b-a41c-17f71a809a78.png)

이메일 형식이 아니면 재입력을 해야합니다.

비밀번호 요구사항에 맞지 않을시 재입력을 해야합니다.

휴대폰번호는 `정규식`을 이용하여 `자동 하이폰 처리`를 하였으며 010, 011 등 휴대폰 번호와 맞지 않을시 재입력을 해야합니다.

가입시 사용자와 관리자용으로 나뉘어 회원가입을 합니다.


## [2] 공지사항 게시판

![공지사항 관리자 목록](https://user-images.githubusercontent.com/86057607/174213699-f419b930-9a88-4ff1-9ff1-490a4eb7840b.png)
![공지사항 관리자 삭제권한](https://user-images.githubusercontent.com/86057607/174213702-02e93ad3-b46d-4bbc-b433-c3f9ccb1c684.png)

공지사항 목록을 표시하며 `페이징 처리`를 하였으며 공지사항 번호를 내림차순으로 하였습니다.

관리자는 공지를 삭제할 권한이 있습니다. 

삭제시에는 공지 번호가 '재정렬 상태'로 정리됩니다.


![공지사항 유저 삭제권한](https://user-images.githubusercontent.com/86057607/174213816-9ada9c4e-8944-4e82-9186-8bfe61b15769.png)

일반 유저는 삭제 불가합니다.


## [3] 검색 서비스

![검색기능](https://user-images.githubusercontent.com/86057607/174214465-8762d094-0c99-4066-a24c-35c49340eac3.png)

`검색 기능`을 추가하여 제목, 작성일 기준으로 조회를 할수 있게끔 하였습니다.



## [4] 마이페이지

![마이페이지](https://user-images.githubusercontent.com/86057607/174224525-4cf1280f-60d5-4b73-8a5d-ca5b1071f986.png)



판매내역과 자신이 찜한 목록 상품등록과 평점을 조회할 수 있습니다.

또한 거래 신청시 알림표시를 함으로써 확인가능합니다.

관리자는 신고목록에 대해 조회가 가능합니다.


## [5] 제품 목록

![제품 목록](https://user-images.githubusercontent.com/86057607/174226769-5c76109a-f0e9-4d91-8061-bcd0fbb4e072.png)

상품 목록을 들어가면 상품에 따라 판매중, 거래완료, 거래대기 상태로 표시가 됩니다.

관리자는 부적절한 상품을 삭제할 수 있습니다.(사용자는 삭제 항목 활성화 되지않아서 자신제외 삭제불가)

제품목록 또한 10개를 초과하면 `페이징 처리`가 됩니다.

검색 기능또한 제품명, 아이디로 검색가능하며 `카테고리별로 조회`가 가능합니다.

## [6] 제품 등록

![제품등록](https://user-images.githubusercontent.com/86057607/174224676-7df0cff1-4ec9-4e0f-ac66-568bd75f2961.png)

제품 필수 입력 사항들을 입력하지 않으면 등록이 되지 않습니다.( 이름, 가격, 카테고리)

마땅한 카테고리에 항목이 없으면 관리자에게 문의하여 추가해서 재등록 합니다.(카테고리생성 관리자권한)


## [7] 제품 댓글기능


![댓글대댓글](https://user-images.githubusercontent.com/86057607/174224563-c0fa2ab6-b728-4f6d-b0ba-3e163c320dfd.png)

회원들은 댓글을 작성할 수 있으며 본인만 수정 삭제 가능하며 삭제시 지운흔적이 남습니다.

다른 회원들은 댓글에 추가 댓글을 작성할 수 있습니다.

대댓글은 10% 가량 작게 나오며, 작성자는 댓글 생상이 하늘색으로 나와 쉽게 구분 가능합니다.

## [8] 찜 목록 현황

![찜목록 현황](https://user-images.githubusercontent.com/86057607/174224703-b89c7a8e-80e2-4124-991a-099b74511d9d.png)

 
## [9] 신고 방법

![신고 중](https://user-images.githubusercontent.com/86057607/174224746-e34c680f-3676-496f-abcc-efb6654a016f.png)

제품과 다른경우 사용자가 신고를 할수있습니다.

## [10] 카테고리 관리

![카테고리관리](https://user-images.githubusercontent.com/86057607/174225752-3b78eb20-67db-491e-9f55-a351045771c6.png)

관리자가 카테고리를 추가 및 삭제 할 수 있습니다.

Ajax를 활용하여 추가하면 실시간으로 추가,삭제 처리 됩니다.

하위 분류를 추가하기 위해서 상위 분류를 선택하고 추가하며 삭제 가능 합니다.
