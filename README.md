# spring-project-01

## 2020.10.19 수정사항

### analysis_request 테이블<br>
- file_path 컬럼 추가<br>
- grant 컬럼은 예약어라 생성이 어려워 grant_check로 생성<br><br>

### manage-request.jsp<br>
- grantCheck 상태에 따른 버튼, 문구 표시 완료<br>
> -> ajax, REST<br>
- 0: 분석완료 (버튼: 결과 승인)<br>
>> -> 버튼 클릭 시, 1로 변경<br>
- 1: 분석 완료 / 결과 승인 완료<br>


## 환경
개발환경: IntelliJ IDEA 2020.2 <br>
데이터베이스: mariaDB 10.5 / mybatis <br>
Spring boot / maven <br>

로그인: Spring Security <br>
로그인 후 권한에 따라 테이블 조회 <br>
ROLE_ADMIN 사용자의 비밀번호는 BCrypt로 저장
