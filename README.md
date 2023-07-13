# Spring Framework 기반으로 제작한 도서 대여 서비스 <br/> '[ 북극성(Polaris) ](https://www.polarisebook.com)' 프로젝트 입니다.
## 🔎 도메인 주소
#### https://www.polarisebook.com
##### cloud flare를 통한 https 보안 연결을 하였습니다.

## 📱 디자인 팀과 협업하여 제작하였습니다.
#### · 디자인 팀은 프론트 디자인을 전부 제작하였습니다.
#### · 프론트엔드와 백엔드 팀은 따로 구분되어있지 않습니다.

## 🗓️ 개발 기간
### · 2023.06.07 ~ 2023.07.04

## 🖥️ 개발 환경
### · `JDK-11`
### · IDE : STS 3.9
### · Framework : Spring Framework (Spring MVC Project)
### · Database : MySQL (8.0.33)
### · Server : Apache tomcat 9.0.46
### · Deploy : cafe24

### 배포 이후 변경사항
#### · `JDK-8 (JDK-1.8)` (수정 중)
#### · Server : Apache tomcat 8.5.61 (수정 중)

## 📖 페이지 구성
### · 홈 페이지: 구성, 메인
####  > 구성: 헤더, 푸터 (include/header, include/footer · rboxfooter)
####  > 메인 (main)
### · 회원 페이지: 회원정보, 회원찾기
####  > 회원정보: 로그인, 회원가입, 회원수정 (login, register, member)
####  > 회원찾기: 아이디 찾기, 비밀번호 찾기 (findid, findpassword)
### · 마이 페이지 (mypage)
### · 상세 페이지 (detail)
### · 검색 페이지 (search)
### · 팀원 소개 페이지

## 📚 Polaris 팀원 · 페이지 소개

### 👨‍💻정규진 · [ jgj9805 ](https://github.com/jgj9805)
#### > header 작업
###### - header 검색 폼
#### > 검색 페이지 작업
###### - 전체 / 장르별 검색 · 결과 출력
###### - 작가별 / 출판사별 검색 · 결과 출력
###### - 단어 검색 · 결과 출력
###### - 도서별 대여 (최대 3권) / 반납하기 처리 (비동기 처리)
###### - 도서별 찜하기 처리 (비동기 처리)
###### - 검색 결과가 많을 시 더보기 버튼으로 추가 목록 출력

### 👨‍💻조원홍 · [ hhong0302 ](https://github.com/hhong0302)
#### > footer 작업 (+화면 우측 네비게이션 박스 작업)
###### - 로그인 유무에 따른 우측 네비게이션 박스 설정
###### - 우측 네비게이션 박스에서 대여 중인 도서 2개까지 출력
#### > 메인 페이지 작업
###### - 좌측 인기 도서 출력
###### - 장르별 도서 출력
###### - 비동기 처리로 인기 / 최신 / 대여순 도서 출력
#### > 비밀번호 찾기 작업
###### - 정보에 맞는 결과 출력
###### - 난수를 이용하여 무작위로 비밀번호 변경
#### > 상세 페이지 리뷰 작업
###### - 리뷰 작성 유무에 맞는 리뷰 작성 폼 출력
###### - 비동기 페이징 처리로 리뷰 리스트 출력
#### > git 관리
###### - git 전체적인 관리

### 👨‍💻차명진 · [ myeongjin123 ](https://github.com/myeongjin123)
#### > 로그인 페이지 작업
###### - 로그인 시 세션에 아이디 저장
###### - 아이디 저장하기 쿠키 저장
#### > ID 찾기 작업
###### - 정보에 맞는 결과 출력
#### > 회원가입 페이지 작업
###### - 비동기 처리로 아이디 중복확인
###### - 정규식에 맞는 정보 입력
###### - 동시성 처리를 하여 회원가입 시 비동기 처리 반복
###### - 정보 입력 완료 시 회원가입 처리 · 홈으로 이동
#### > 회원수정 페이지 작업
###### - 현재 사용 중인 비밀번호 등록 방지
###### - 정보 입력 완료 시 회원수정 처리

### 👩‍💻최누리 · [ chlsnfl ](https://github.com/chlsnfl)
#### > 마이 페이지 작업
###### - 로그인 중인 회원에 맞는 정보 출력
###### - 현재 대여 중인 목록 출력 (최대 3권)
###### - 현재 대여 중인 도서 바로보기 (협의 중)
###### - 현재 대여 중인 도서 반납하기 처리
###### - 지난 대여 목록 출력
###### - 지난 대여 목록 비동기 페이징 처리
###### - 회원에 맞는 찜하기 목록 출력
###### - 찜하기 목록 비동기 페이징 처리
###### - 찜하기 취소 처리

### 👩‍💻홍정원 · [ jeoungwonhong ](https://github.com/jeoungwonhong)
#### > 상세 페이지 작업
###### - 도서에 맞는 정보 출력
###### - 도서별 찜하기 처리 (비동기 처리)
###### - 도서별 대여 (최대 3권) / 반납하기 처리 (비동기 처리)
###### - 현재 대여 중인 도서 바로보기 (협의 중)
###### - 도서별 기본 정보 출력
###### - 추천 도서를 상세 도서와 일치하는 장르로 무작위 난수를 이용하여 4권 출력
#### > 회원수정 페이지 작업
###### - 탈퇴하기 클릭 시 회원탈퇴 처리
###### - 탈퇴한 회원과 관련 된 모든 정보 삭제
