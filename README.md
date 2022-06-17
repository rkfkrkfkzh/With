# readme

## Introduction

> Spring boot 를 사용하여 중고거래 웹 어플리케이션을 제작한다.
## 1. Entity Relationship Diagram

![1](https://user-images.githubusercontent.com/86057607/174211944-21889f0b-f764-4ed0-b909-80afffbbe448.png)

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
휴대폰번호는 '정규식'을 이용하여 '자동 하이폰 처리'를 하였으며 010, 011 등 휴대폰 번호와 맞지 않을시 재입력을 해야합니다.
가입시 사용자와 관리자용으로 나뉘어 회원가입을 합니다.

## [2] 공지사항 게시판

![공지사항 관리자 목록](https://user-images.githubusercontent.com/86057607/174213699-f419b930-9a88-4ff1-9ff1-490a4eb7840b.png)
![공지사항 관리자 삭제권한](https://user-images.githubusercontent.com/86057607/174213702-02e93ad3-b46d-4bbc-b433-c3f9ccb1c684.png)

공지사항 목록을 표시하며 `페이징 처리`를 하였으며 공지사항 번호를 내림차순으로 하였습니다.

관리자는 공지를 삭제할 권한이 있습니다. 

삭제시에는 공지 번호가 '재정렬 상태'로 정리됩니다.


![공지사항 유저 삭제권한](https://user-images.githubusercontent.com/86057607/174213816-9ada9c4e-8944-4e82-9186-8bfe61b15769.png)

일반 유저는 삭제 불가합니다.


## [3] 매칭 서비스





## [4] 마이페이지



회원의 프로필 수정 및 활동 이력을 조회할 수 있습니다.
