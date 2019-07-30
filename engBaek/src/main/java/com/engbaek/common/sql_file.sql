==========================DEV1계정만들기===========================
사용자이름 : sys ,비밀번호: 아마 1111일껄요? 접속유형에서 롤을 sysdba로 설정

접속 후 
CREATE USER dev1 IDENTIFIED BY qwerty123;

GRANT connect, resource, dba TO dev1;

===========================테이블 생성=============================
//1.권한
CREATE TABLE auth(
    auth_no VARCHAR2(10) CONSTRAINT auth_pk PRIMARY KEY
)

//2.강사
CREATE TABLE teacher(
    teacher_id  VARCHAR2(40) CONSTRAINT teacher_pk PRIMARY KEY,
    name        VARCHAR2(40) NOT NULL,
    pw          VARCHAR2(40) NOT NULL,
    birthday    DATE NOT NULL,
    email1      VARCHAR2(40) NOT NULL,
    email2      VARCHAR2(40) NOT NULL,
    phone       VARCHAR2(40) NOT NULL,
    gender      VARCHAR2(40) NOT NULL,
    address     VARCHAR2(40) NOT NULL,
    regdate     DATE DEFAULT SYSDATE,
    career      VARCHAR2(2000) NOT NULL,
    auth_no     VARCHAR2(10) CONSTRAINT t_auth_fk REFERENCES auth(auth_no) NOT NULL
 )   
    
//3.관리자
CREATE TABLE admin(
    admin_id    VARCHAR2(40) CONSTRAINT admin_pk PRIMARY KEY,
    admin_name  VARCHAR2(40) NOT NULL,
    auth_no     VARCHAR2(10) CONSTRAINT a_auth_fk REFERENCES auth(auth_no) NOT NULL
)

//4.학생
CREATE TABLE student(
    student_id  VARCHAR2(40) CONSTRAINT student_pk PRIMARY KEY,
    name        VARCHAR2(40) NOT NULL,
    pw          VARCHAR2(40) NOT NULL,
    birthday    VARCHAR2(40) NOT NULL,
    email1      VARCHAR2(40) NOT NULL,
    email2      VARCHAR2(40) NOT NULL,
    phone       VARCHAR2(40) NOT NULL,
    gender      VARCHAR2(40) NOT NULL,
    address     VARCHAR2(40) NOT NULL,
    regdate     DATE    DEFAULT SYSDATE,
    auth_no     VARCHAR2(10) CONSTRAINT s_auth_fk REFERENCES auth(auth_no) NOT NULL
 )


//5.강좌
CREATE TABLE course(
    course_code     NUMBER(20) CONSTRAINT course_pk PRIMARY KEY,
    teacher_id      VARCHAR2(40) CONSTRAINT c_teacher_fk REFERENCES teacher(teacher_id) NOT NULL,
    croom_no        NUMBER(20)  NOT NULL,
    course_name     VARCHAR2(40) NOT NULL,
    course_type     VARCHAR2(40) NOT NULL,
    course_level    VARCHAR2(40) NOT NULL,
    course_pic      VARCHAR2(40) NOT NULL,
    course_pic_uuid VARCHAR2(2000) NOT NULL,
    curriculum      VARCHAR2(40) NOT NULL,
    curriculum_uuid VARCHAR2(2000) NOT NULL,
    course_info     VARCHAR2(2000) NOT NULL,
    course_day      VARCHAR2(40) NOT NULL,
    course_time     VARCHAR2(40) NOT NULL,
    course_start    DATE NOT NULL,
    course_end      DATE NOT NULL
)

//강좌 시퀀스
CREATE SEQUENCE course_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//6.강사소개
CREATE TABLE teacher_profile(
    teacher_pno VARCHAR2(40) CONSTRAINT teacher_profile_pk PRIMARY KEY,
    teacher_id  VARCHAR2(40) CONSTRAINT tp_teacher_fk REFERENCES teacher(teacher_id) NOT NULL,
    teacher_subject VARCHAR2(2000) NOT NULL,
    teacher_profile VARCHAR2(2000) NOT NULL,
    teacher_profile_pic VARCHAR2(40) NOT NULL,
    teacher_profile_uuid  VARCHAR2(40) NOT NULL,
    teacher_course_cnt  NUMBER(20) NOT NULL
)
//7.FAQ
CREATE TABLE faq(
   faq_bno NUMBER(20)  CONSTRAINT faq_pk PRIMARY KEY,
   admin_id VARCHAR2(40) CONSTRAINT f_admin_fk REFERENCES admin(admin_id) NOT NULL,
   faq_title VARCHAR2(40) NOT NULL,
   faq_content VARCHAR2(2000) NOT NULL,
   faq_regdate DATE DEFAULT SYSDATE 
)

//FAQ 시퀀스
CREATE SEQUENCE faq_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//8.공지사항
CREATE TABLE notice(
    notice_bno NUMBER(20) CONSTRAINT notice_pk PRIMARY KEY,
    admin_id   VARCHAR2(40) CONSTRAINT n_admin_fk REFERENCES admin(admin_id) NOT NULL,
    notice_title VARCHAR2(40) NOT NULL,
    notice_content VARCHAR2(2000) NOT NULL,
    notice_regdate  DATE DEFAULT SYSDATE
)

//공지사항 시퀀스
CREATE SEQUENCE notice_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//9.환불규정
CREATE TABLE refund_info(
    bno NUMBER(20) CONSTRAINT refund_info_pk PRIMARY KEY,
    admin_id VARCHAR2(40) CONSTRAINT ri_admin_fk REFERENCES admin(admin_id) NOT NULL,
    refund_icontent VARCHAR2(4000) NOT NULL
)

//환불규정 시퀀스
CREATE SEQUENCE refund_info_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//10.강의별 Q&A
CREATE TABLE c_qna_board(
    c_qna_bno   NUMBER(20) CONSTRAINT c_qna_board_pk PRIMARY KEY,
    course_code NUMBER(20) CONSTRAINT qna_course_fk REFERENCES course(course_code) NOT NULL,
    student_id  VARCHAR2(40)  CONSTRAINT qna_student_fk REFERENCES student(student_id) NOT NULL,
    teacher_id  VARCHAR2(40) CONSTRAINT qna_teacher_fk  REFERENCES teacher(teacher_id) NOT NULL,
    c_qna_title VARCHAR2(40) NOT NULL,
    c_qna_content VARCHAR2(2000) NOT NULL,
    c_qna_regdate DATE DEFAULT SYSDATE
)

//강의별 Q&A 시퀀스
CREATE SEQUENCE c_qna_board_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//11.강의별 Q&A댓글
CREATE TABLE c_qna_comment(
    c_qna_cno   NUMBER(20) CONSTRAINT c_qna_comment_pk PRIMARY KEY,
    course_code NUMBER(20) CONSTRAINT qna_c_course_fk REFERENCES course(course_code) NOT NULL,
    student_id  VARCHAR2(40) CONSTRAINT qna_c_student_fk REFERENCES student(student_id) NOT NULL,
    teacher_id  VARCHAR2(40) CONSTRAINT qna_c_teacher_fk REFERENCES teacher(teacher_id) NOT NULL,
    c_qna_ccontent VARCHAR2(2000) NOT NULL,
    c_qna_cregdate DATE DEFAULT SYSDATE,
    c_qna_bno  NUMBER(20) CONSTRAINT qna_c_c_qna_board_fk REFERENCES c_qna_board(c_qna_bno)NOT NULL
)

//강의별 Q&A 댓글 시퀀스
CREATE SEQUENCE c_qna_comment_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//12.수강후기
CREATE TABLE review(
    review_bno NUMBER(20) CONSTRAINT review_pk PRIMARY KEY, 
    teacher_id  VARCHAR2(40) CONSTRAINT r_teacher_fk REFERENCES teacher(teacher_id) NOT NULL,
    course_code NUMBER(20) CONSTRAINT r_course_fk REFERENCES course(course_code) NOT NULL,
    student_id  VARCHAR2(40) CONSTRAINT r_student_fk REFERENCES student(student_id) NOT NULL,
    review_title VARCHAR2(40) NOT NULL,
    review_content VARCHAR2(2000) NOT NULL,
    review_regdate DATE DEFAULT SYSDATE
)

//수강후기 시퀀스
CREATE SEQUENCE review_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//13.수업자료&공지사항
CREATE TABLE class (
    class_bno NUMBER(20) CONSTRAINT class_pk PRIMARY KEY,
    course_code NUMBER(20) CONSTRAINT cl_course_fk REFERENCES course(course_code) NOT NULL,
    teacher_id VARCHAR2(40) CONSTRAINT cl_teacher_fk REFERENCES teacher(teacher_id) NOT NULL,
    class_title VARCHAR2(40) NOT NULL,
    class_content VARCHAR2(2000) NOT NULL,
    class_regdate DATE DEFAULT SYSDATE
)

//수업자료&공지사항 시퀀스
CREATE SEQUENCE class_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//14.수업자료&공지사항 파일업로드
CREATE TABLE class_upload(
    uuid VARCHAR2(2000) CONSTRAINT class_upload_pk PRIMARY KEY,
    file_name VARCHAR2(40) NOT NULL,
    class_bno NUMBER(20) CONSTRAINT cu_class_fk REFERENCES class(class_bno) NOT NULL,
    file_regdate DATE DEFAULT SYSDATE
)

//15.일대일문의
CREATE TABLE p_qna_board(
    p_qna_bno  NUMBER(20) CONSTRAINT p_qna_board_pk PRIMARY KEY,
    student_id VARCHAR2(40) CONSTRAINT pq_student_fk REFERENCES student(student_id) NOT NULL,
    p_qna_title VARCHAR2(40) NOT NULL,
    p_qna_content VARCHAR2(2000) NOT NULL,
    p_qna_regdate DATE DEFAULT SYSDATE
)

//일대일문의 시퀀스
CREATE SEQUENCE p_qna_board_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//16.일대일문의 답변
CREATE TABLE p_qna_comment(
    p_qna_cno NUMBER(20) CONSTRAINT p_qna_comment_pk PRIMARY KEY,
    p_qna_bno NUMBER(20) CONSTRAINT pqc_p_qna_board_fk REFERENCES p_qna_board(p_qna_bno) NOT NULL,
    student_id  VARCHAR2(40) CONSTRAINT pqc_student_fk REFERENCES student(student_id) NOT NULL,
    adimin_id VARCHAR2(40) CONSTRAINT pqc_admin_fk REFERENCES admin(admin_id) NOT NULL,
    p_qna_ctitle VARCHAR2(40) NOT NULL,
    p_qna_ccontent VARCHAR2(2000) NOT NULL,
    p_qna_cregdate DATE DEFAULT SYSDATE
)

//일대일문의 답변 시퀀스
CREATE SEQUENCE p_qna_comment_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//17.결제내역
CREATE TABLE payment(
    payment_no NUMBER(20) CONSTRAINT payment_pk PRIMARY KEY,
    course_code NUMBER(20) CONSTRAINT pay_course_fk REFERENCES course(course_code) NOT NULL,
    student_id  VARCHAR2(40) CONSTRAINT pay_student_fk REFERENCES student(student_id) NOT NULL,
    payment_method VARCHAR2(40) NOT NULL,
    payment_price   NUMBER(20) NOT NULL,
    card_type   VARCHAR2(40),
    card_no VARCHAR2(40),
    payment_date DATE DEFAULT SYSDATE,
    payment_state VARCHAR2(40) NOT NULL
)
//결제내역 시퀀스
CREATE SEQUENCE payment_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//18.환불내역
CREATE TABLE refund(
    refund_no NUMBER(20) CONSTRAINT refund_pk PRIMARY KEY,
    payment_no NUMBER(20) CONSTRAINT rf_payment_fk REFERENCES payment(payment_no) NOT NULL,
    refund_price NUMBER(20) NOT NULL,
    course_code NUMBER(20) CONSTRAINT rf_course_fk REFERENCES course(course_code) NOT NULL,
    refund_date DATE DEFAULT SYSDATE,
    student_id VARCHAR2(40) CONSTRAINT rf_student_fk REFERENCES student(student_id) NOT NULL
)

//환불내역 시퀀스
CREATE SEQUENCE refund_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//19.수강내역
CREATE TABLE course_history(
    history_no NUMBER(20) CONSTRAINT course_history_pk PRIMARY KEY,
    course_code NUMBER(20) CONSTRAINT ch_course_fk REFERENCES course(course_code) NOT NULL,
    payment_no NUMBER(20) CONSTRAINT ch_payment_fk REFERENCES payment(payment_no) NOT NULL,
    student_id VARCHAR2(40) CONSTRAINT ch_student_fk REFERENCES student(student_id) NOT NULL,
    teacher_id VARCHAR2(40) CONSTRAINT ch_teacher_fk REFERENCES teacher(teacher_id) NOT NULL
)

//수강내역 시퀀스
CREATE SEQUENCE course_history_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE


==============================테이블 다지우기=====================================
DROP TABLE course_history
DROP TABLE refund
DROP TABLE payment
DROP TABLE p_qna_comment
DROP TABLE p_qna_board
DROP TABLE class_upload
DROP TABLE class
DROP TABLE review
DROP TABLE c_qna_comment
DROP TABLE c_qna_board
DROP TABLE refund_info
DROP TABLE notice
DROP TABLE faq
DROP TABLE teacher_profile
DROP TABLE course
DROP TABLE student
DROP TABLE admin
DROP TABLE teacher
DROP TABLE auth


================================시퀀스 다지우기==========================================
DROP SEQUENCE course_history_seq
DROP SEQUENCE refund_seq
DROP SEQUENCE payment_seq
DROP SEQUENCE p_qna_comment_seq
DROP SEQUENCE p_qna_board_seq
DROP SEQUENCE class_seq
DROP SEQUENCE review_seq
DROP SEQUENCE c_qna_comment_seq
DROP SEQUENCE c_qna_board_seq
DROP SEQUENCE refund_info_seq
DROP SEQUENCE notice_seq
DROP SEQUENCE faq_seq
DROP SEQUENCE course_seq
