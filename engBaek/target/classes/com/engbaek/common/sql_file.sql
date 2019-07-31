==========================DEV1계정만들기===========================
사용자이름 : sys ,비밀번호: 아마 1111일껄요? 접속유형에서 롤을 sysdba로 설정

접속 후 
CREATE USER dev1 IDENTIFIED BY qwerty123;

GRANT connect, resource, dba TO dev1;

===========================테이블 생성=============================
//1.권한
CREATE TABLE auth(
    authNo VARCHAR2(10) CONSTRAINT auth_pk PRIMARY KEY
)

//2.강사
CREATE TABLE teacher(
    teacherId   VARCHAR2(40) CONSTRAINT teacher_pk PRIMARY KEY,
    name        VARCHAR2(40) NOT NULL,
    pw          VARCHAR2(40) NOT NULL,
    birthday    VARCHAR2(40) NOT NULL,
    email1      VARCHAR2(40) NOT NULL,
    email2      VARCHAR2(40) NOT NULL,
    phone       VARCHAR2(40) NOT NULL,
    gender      VARCHAR2(40) NOT NULL,
    address     VARCHAR2(500) NOT NULL,
    regdate     DATE DEFAULT SYSDATE,
    career      VARCHAR2(4000) NOT NULL,
    authNo      VARCHAR2(10) CONSTRAINT t_auth_fk REFERENCES auth(authNo) NOT NULL
 )   
    
//3.관리자
CREATE TABLE admin(
    adminId    VARCHAR2(40) CONSTRAINT admin_pk PRIMARY KEY,
    adminName  VARCHAR2(40) NOT NULL,
    authNo     VARCHAR2(10) CONSTRAINT a_auth_fk REFERENCES auth(authNo) NOT NULL
)

//4.학생
CREATE TABLE student(
    studentId   VARCHAR2(40) CONSTRAINT student_pk PRIMARY KEY,
    name        VARCHAR2(40) NOT NULL,
    pw          VARCHAR2(40) NOT NULL,
    birthday    VARCHAR2(40) NOT NULL,
    email1      VARCHAR2(40) NOT NULL,
    email2      VARCHAR2(40) NOT NULL,
    phone       VARCHAR2(40) NOT NULL,
    gender      VARCHAR2(40) NOT NULL,
    address     VARCHAR2(40) NOT NULL,
    regdate     DATE    DEFAULT SYSDATE,
    authNo      VARCHAR2(10) CONSTRAINT s_auth_fk REFERENCES auth(authNo) NOT NULL
 )


//5.강좌
CREATE TABLE course(
    courseCode     NUMBER(20) CONSTRAINT course_pk PRIMARY KEY,
    teacherId      VARCHAR2(40) CONSTRAINT c_teacher_fk REFERENCES teacher(teacherId) NOT NULL,
    classroomNo        NUMBER(20)  NOT NULL,
    courseName     VARCHAR2(40) NOT NULL,
    courseType     VARCHAR2(40) NOT NULL,
    courseLevel    VARCHAR2(40) NOT NULL,
    coursePicureName      VARCHAR2(40) NOT NULL,
    coursePictureUuid VARCHAR2(2000) NOT NULL,
    curriculumName      VARCHAR2(40) NOT NULL,
    curriculumUuid VARCHAR2(2000) NOT NULL,
    courseInfo     VARCHAR2(2000) NOT NULL,
    courseDay      VARCHAR2(40) NOT NULL,
    courseTime     VARCHAR2(40) NOT NULL,
    courseStart    DATE NOT NULL,
    courseEnd      DATE NOT NULL
)

//강좌 시퀀스
CREATE SEQUENCE course_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//6.강사소개
CREATE TABLE profile(
    teacherPno VARCHAR2(40) CONSTRAINT teacher_profile_pk PRIMARY KEY,
    teacherId  VARCHAR2(40) CONSTRAINT tp_teacher_fk REFERENCES teacher(teacherId) NOT NULL,
    teachersubject VARCHAR2(2000) NOT NULL,
    teacherProfile VARCHAR2(2000) NOT NULL,
    teacherProfilePicture VARCHAR2(40) NOT NULL,
    teacherProfileUuid VARCHAR2(40) NOT NULL
)

//7.FAQ
CREATE TABLE faq(
   faqNo NUMBER(20)  CONSTRAINT faq_pk PRIMARY KEY,
   adminId VARCHAR2(40) CONSTRAINT f_admin_fk REFERENCES admin(adminId) NOT NULL,
   faqTitle VARCHAR2(100) NOT NULL,
   faqContent VARCHAR2(2000) NOT NULL,
   faqRegdate DATE DEFAULT SYSDATE 
)

//FAQ 시퀀스
CREATE SEQUENCE faq_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//8.공지사항
CREATE TABLE notice(
    noticeNo NUMBER(20) CONSTRAINT notice_pk PRIMARY KEY,
    adminId   VARCHAR2(40) CONSTRAINT notice_admin_fk REFERENCES admin(adminId) NOT NULL,
    noticeTitle VARCHAR2(100) NOT NULL,
    noticeContent VARCHAR2(2000) NOT NULL,
    noticeRegdate  DATE DEFAULT SYSDATE
)

//공지사항 시퀀스
CREATE SEQUENCE notice_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//9.환불규정
CREATE TABLE refundInfo(
    refundInfoNo NUMBER(20) CONSTRAINT refundInfo_pk PRIMARY KEY,
    adminId VARCHAR2(40) CONSTRAINT refundInfo_admin_fk REFERENCES admin(adminId) NOT NULL,
    refundInfoContent VARCHAR2(4000) NOT NULL
)

//환불규정 시퀀스
CREATE SEQUENCE refundInfo_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//10.강의별 Q&A
CREATE TABLE classQna(
    classQnaNo   NUMBER(20) CONSTRAINT classQna_pk PRIMARY KEY,
    courseCode NUMBER(20) CONSTRAINT classQna_course_fk REFERENCES course(coursecode) NOT NULL,
    studentId  VARCHAR2(40)  CONSTRAINT classQna_student_fk REFERENCES student(studentid) NOT NULL,
    teacherId  VARCHAR2(40) CONSTRAINT classQna_teacher_fk  REFERENCES teacher(teacherid) NOT NULL,
    classQnaTitle VARCHAR2(100) NOT NULL,
    classQnaContent VARCHAR2(2000) NOT NULL,
    classQnaRegdate DATE DEFAULT SYSDATE
)

//강의별 Q&A 시퀀스
CREATE SEQUENCE classQna_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//11.강의별 Q&A댓글
CREATE TABLE classQnaComment (
    commentNO NUMBER(20) CONSTRAINT c_qna_comment_pk PRIMARY KEY,
    courseCode NUMBER(20) CONSTRAINT qna_c_course_fk REFERENCES course(courseCode) NOT NULL,
    studentId  VARCHAR2(40) CONSTRAINT qna_c_student_fk REFERENCES student(studentId) NOT NULL,
    teacherId  VARCHAR2(40) CONSTRAINT qna_c_teacher_fk REFERENCES teacher(teacherId) NOT NULL,
    commentContent VARCHAR2(2000) NOT NULL,
    commentRegdate DATE DEFAULT SYSDATE,
    classQnaNo  NUMBER(20) CONSTRAINT qna_c_c_qna_board_fk REFERENCES classQna(classQnaNo)NOT NULL
)

//강의별 Q&A 댓글 시퀀스
CREATE SEQUENCE classQnaComment_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE			

//12.수강후기
CREATE TABLE review(
    reviewNo NUMBER(20) CONSTRAINT review_pk PRIMARY KEY, 
    teacherId  VARCHAR2(40) CONSTRAINT r_teacher_fk REFERENCES teacher(teacherId) NOT NULL,
    courseCode NUMBER(20) CONSTRAINT r_course_fk REFERENCES course(courseCode) NOT NULL,
    studentId  VARCHAR2(40) CONSTRAINT r_student_fk REFERENCES student(studenId) NOT NULL,
    reviewTitle VARCHAR2(100) NOT NULL,
    reviewContent VARCHAR2(2000) NOT NULL,
    reviewRegdate DATE DEFAULT SYSDATE
)

//수강후기 시퀀스
CREATE SEQUENCE review_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//13.수업자료&공지사항
CREATE TABLE classData (
    classDataNo NUMBER(20) CONSTRAINT class_pk PRIMARY KEY,
    courseCode NUMBER(20) CONSTRAINT cl_course_fk REFERENCES course(courseCode) NOT NULL,
    teacherId VARCHAR2(40) CONSTRAINT cl_teacher_fk REFERENCES teacher(teacherId) NOT NULL,
    classDataTitle VARCHAR2(100) NOT NULL,
    classDataContent VARCHAR2(2000) NOT NULL,
    classDataRegdate DATE DEFAULT SYSDATE
)

//수업자료&공지사항 시퀀스
CREATE SEQUENCE classData_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//14.수업자료&공지사항 파일업로드
CREATE TABLE classDataAttach (
    uuid VARCHAR2(2000) CONSTRAINT class_upload_pk PRIMARY KEY,
    fileName VARCHAR2(40) NOT NULL,
    classDataNo NUMBER(20) CONSTRAINT cu_class_fk REFERENCES classData(classDataNo) NOT NULL,
    attachRegdate DATE DEFAULT SYSDATE
)

//15.일대일문의
CREATE TABLE privateQna(
    privateQnaNo  NUMBER(20) CONSTRAINT p_qna_board_pk PRIMARY KEY,
    studentId VARCHAR2(40) CONSTRAINT pq_student_fk REFERENCES student(studentId) NOT NULL,
    privateQnaTitle VARCHAR2(100) NOT NULL,
    privateQnaContent VARCHAR2(2000) NOT NULL,
    privateQnaRegdate DATE DEFAULT SYSDATE
)

//일대일문의 시퀀스
CREATE SEQUENCE privateQna_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//16.일대일문의 답변
CREATE TABLE privateQnaReply(
    privateQnaReplyNo NUMBER(20) CONSTRAINT p_qna_comment_pk PRIMARY KEY,
    privateQnaNo NUMBER(20) CONSTRAINT pqc_p_qna_board_fk REFERENCES privateQna(privateQnaNo) NOT NULL,
    studentId  VARCHAR2(40) CONSTRAINT pqc_student_fk REFERENCES student(studentId) NOT NULL,
    adiminId VARCHAR2(40) CONSTRAINT pqc_admin_fk REFERENCES admin(adminId) NOT NULL,
    privateQnaReplyTitle VARCHAR2(100) NOT NULL,
    privateQnaReplyContent VARCHAR2(2000) NOT NULL,
    privateQnaReplyRegdate DATE DEFAULT SYSDATE
)

//일대일문의 답변 시퀀스
CREATE SEQUENCE privateQnaReply_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//17.결제내역
CREATE TABLE payment(
    paymentNo NUMBER(20) CONSTRAINT payment_pk PRIMARY KEY,
    courseCode NUMBER(20) CONSTRAINT pay_course_fk REFERENCES course(courseCode) NOT NULL,
    studentId  VARCHAR2(40) CONSTRAINT pay_student_fk REFERENCES student(studentId) NOT NULL,
    paymentMethod VARCHAR2(40) NOT NULL,
    paymentPrice   NUMBER(20) NOT NULL,
    cardType   VARCHAR2(40),
    cardNo VARCHAR2(40),
    paymentDate DATE DEFAULT SYSDATE,
    paymentState VARCHAR2(40) NOT NULL
)
//결제내역 시퀀스
CREATE SEQUENCE payment_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//18.환불내역
CREATE TABLE refund(
    refundNo NUMBER(20) CONSTRAINT refund_pk PRIMARY KEY,
    paymentNo NUMBER(20) CONSTRAINT rf_payment_fk REFERENCES payment(paymentNo) NOT NULL,
    refundPrice NUMBER(20) NOT NULL,
    courseCode NUMBER(20) CONSTRAINT rf_course_fk REFERENCES course(courseCode) NOT NULL,
    refundDate DATE DEFAULT SYSDATE,
    studentId VARCHAR2(40) CONSTRAINT rf_student_fk REFERENCES student(studentId) NOT NULL
)

//환불내역 시퀀스
CREATE SEQUENCE refund_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE

//19.수강내역
CREATE TABLE courseHistory(
    historyNo NUMBER(20) CONSTRAINT course_history_pk PRIMARY KEY,
    courseCode NUMBER(20) CONSTRAINT ch_course_fk REFERENCES course(courseCode) NOT NULL,
    paymentNo NUMBER(20) CONSTRAINT ch_payment_fk REFERENCES payment(paymentNo) NOT NULL,
    studentId VARCHAR2(40) CONSTRAINT ch_student_fk REFERENCES student(studentId) NOT NULL,
    teacherId VARCHAR2(40) CONSTRAINT ch_teacher_fk REFERENCES teacher(teacherId) NOT NULL
)

//수강내역 시퀀스
CREATE SEQUENCE courseHistory_seq
START WITH      1
INCREMENT BY    1
NOCACHE         
NOCYCLE


==============================테이블 다지우기=====================================
DROP TABLE courseHistory
DROP TABLE refund
DROP TABLE payment
DROP TABLE privateQnaReply
DROP TABLE privateQna
DROP TABLE classDataAttach
DROP TABLE classData
DROP TABLE review
DROP TABLE classQnaComment
DROP TABLE classQna
DROP TABLE refundInfo
DROP TABLE notice
DROP TABLE faq
DROP TABLE profile
DROP TABLE course
DROP TABLE student
DROP TABLE admin
DROP TABLE teacher
DROP TABLE auth


================================시퀀스 다지우기==========================================
DROP SEQUENCE courseHistory_seq
DROP SEQUENCE refund_seq
DROP SEQUENCE payment_seq
DROP SEQUENCE privateQnaReply_seq
DROP SEQUENCE privateQna_seq
DROP SEQUENCE classData_seq
DROP SEQUENCE review_seq
DROP SEQUENCE classQnaComment_seq
DROP SEQUENCE classQna_seq
DROP SEQUENCE refundInfo_seq
DROP SEQUENCE notice_seq
DROP SEQUENCE faq_seq
DROP SEQUENCE course_seq
