show user;
-- USER이(가) "SALADMARKET"입니다.
select *
from all_tables
where name='member';

CREATE USER saladmarket IDENTIFIED BY eclass
DEFAULT tablespace users;

GRANT CONNECT, resource, unlimited tablespace, CREATE VIEW TO saladmarket;


 select mnum, userid, name, email, phone, postnum, address1, address2, point,birthday 
					 ,to_char(registerdate, 'yyyy-mm-dd') AS last_logindate 
					 ,to_char(registerdate, 'yyyy-mm-dd') AS  last_changepwdate 
		             ,to_char(registerdate, 'yyyy-mm-dd') as registerdate 
                    ,status,summoney,fk_lvnum,cpname,cpnum,cpexpiredate
                    , (select count (*)from (select fk_cpnum from my_coupon where fk_userid = 'suwook')) AS cpnumCount 
    from member A join my_coupon B
    on A.userid = B.fk_userid
    join coupon C
    on C.cpnum = B.fk_cpnum
    where userid = 'suwook' ;



-- 회원 등급(member_level) 테이블 생성; 1~3등급
create table member_level 
(lvnum       number         not null -- 등급번호; 1, 2, 3
,lvname      varchar2(100)  not null -- 등급명; bronze, silver, gold
,lvbenefit   clob           not null -- 등급혜택
,lvcontents  clob           not null -- 등급조건내용
,constraint  PK_level primary key (lvnum)
);

create sequence seq_member_level_lvnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into member_level 
values(seq_member_level_lvnum.nextval, 'bronze', '회원가입쿠폰(최대 5000원 할인), 할인쿠폰 10%(1만원 이상 구매시 최대 3000원)', '회원가입시'); 

insert into member_level 
values(seq_member_level_lvnum.nextval, 'silver', '회원가입쿠폰(최대 5000원 할인), 할인쿠폰 10%(1만원 이상 구매시 최대 3000원), 할인쿠폰 15%(1만5천원 이상 구매시 최대 5000원)', '10만원 이상 구매시'); 

insert into member_level 
values(seq_member_level_lvnum.nextval, 'gold', '회원가입쿠폰(최대 5000원 할인), 할인쿠폰 10%(1만원 이상 구매시 최대 3000원), 할인쿠폰 15%(1만5천원 이상 구매시 최대 5000원), 할인쿠폰 20%(2만원 이상 구매시 최대 7000원), 무료배송', '30만원 이상 구매시');  

commit;
select *
from member_level;

-- 쿠폰(coupon) 테이블 생성 
create table coupon 
(cpnum          number not null             -- 쿠폰번호 
,cpname         varchar2(100) not null      -- 쿠폰명 
,discountper    number not null         -- 할인율
,cpstatus        number  default 1 not null         -- 쿠폰 사용 상태; 0:사용됨 1:미사용
,cpusemoney   number not null           -- 쿠폰 사용 조건; ex. 1만원 이상 사용시 ~~
,cpuselimit      number not null           -- 쿠폰 할인금액 제한; ex. 최대 5000원
,constraint PK_coupon primary key(cpnum)
,constraint CK_coupon_cpstatus check( cpstatus in(0, 1) )
);

select *
from coupon;

create sequence seq_coupon_cpnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 회원가입쿠폰(최대 5000원 할인), 할인쿠폰 10%(1만원 이상 구매시 최대 3000원), 할인쿠폰 15%(1만5천원 이상 구매시 최대 5000원), 할인쿠폰 20%(2만원 이상 구매시 최대 7000원)
insert into coupon(cpnum, cpname, discountper, cpstatus, cpusemoney, cpuselimit)
values(seq_coupon_cpnum.nextval, '회원가입쿠폰', 100, default, 0, 5000);

insert into coupon(cpnum, cpname, discountper, cpstatus, cpusemoney, cpuselimit)
values(seq_coupon_cpnum.nextval, '할인쿠폰 10%', 10, default, 10000, 3000);

insert into coupon(cpnum, cpname, discountper, cpstatus, cpusemoney, cpuselimit)
values(seq_coupon_cpnum.nextval, '할인쿠폰 15%', 15, default, 15000, 5000);

insert into coupon(cpnum, cpname, discountper, cpstatus, cpusemoney, cpuselimit)
values(seq_coupon_cpnum.nextval, '할인쿠폰 20%', 20, default, 20000, 7000);

insert into coupon(cpnum, cpname, discountper, cpstatus, cpusemoney, cpuselimit)
values(seq_coupon_cpnum.nextval, '무료배송', 0, default, 0, 2500);




-- 회원(member) 테이블 생성 
create table member 
(mnum               number                not null  -- 회원번호
,userid             varchar2(100)         not null  -- 회원아이디
,name               varchar2(10)          not null  -- 회원명
,email              varchar2(200)         not null  -- 이메일(AES256 암호화)
,phone              varchar2(400)         not null  -- 휴대폰(AES256 암호화)
,birthday           date                  not null  -- 생년월일
,postnum            number                not null  -- 우편번호
,address1           varchar2(200)         not null  -- 주소
,address2           varchar2(200)         not null  -- 상세주소
,point              number default 0      not null  -- 포인트
,registerdate       date default sysdate  not null  -- 가입일자
,last_logindate     date default sysdate  not null  -- 마지막로그인일자
,last_changepwdate  date default sysdate  not null  -- 비밀번호변경일자
,status             number default 1      not null  -- 회원탈퇴유무 / 0:탈퇴 1:활동 2:휴면
,summoney           number default 0      not null  -- 누적구매금액
,fk_lvnum           number default 1      not null  -- 회원등급번호
,constraint PK_member_mnum	primary key(mnum)
,constraint UQ_member_userid unique(userid)
,constraint FK_member_lvnum foreign key(fk_lvnum)
                                references member_level(lvnum)
,constraint CK_member_status check( status in(0, 1, 2) )
);
update member set pw varchar2(100) not null;
                
alter table member modify(birthday varchar2(100)); 
alter table member modify(fk_lvnum number default 1); 

alter table member modify(name varchar2(100)); 
alter table member modify(postnum varchar2(20)); 

delete member where mnum = 12;
delete member where mnum = 15;
delete member where mnum = 13;
delete member where mnum = 17;

select *
from member;

alter table member modify(postnum number null); -- 14409
update member set postnum = null;
alter table member modify(postnum varchar2(10));
update member set postnum = '014409';
alter table member modify(postnum varchar2(10) not null);


commit;


create sequence seq_member_mnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 본인이 확인 할 수 있는 이메일이랑 번호 넣어주세요
insert into member(mnum,userid,name,email,phone ,birthday,postnum ,address1,address2,point,registerdate ,last_logindate ,last_changepwdate ,status,summoney ,fk_lvnum)
values(seq_member_mnum.nextval, 'leess', 
'이순신', '422cso@gmail.com', '01073132470', add_months(sysdate, -50), 14409, '경기도 부천시 고리울로 64번길 19', '예다움 502호',
default, default, default, default, default, default, default);


-- 보유쿠폰(my_coupon) 테이블 생성 
create table my_coupon 
(fk_userid   varchar2(100) not null  -- 회원아이디 
,fk_cpnum  number not null  -- 쿠폰번호
,cpexpiredate date not null         -- 쿠폰 사용 기한
,constraint FK_my_coupon_userid foreign key(fk_userid)
                                  references member(userid)
,constraint FK_my_coupon_cpnum foreign key(fk_cpnum)
                                  references coupon(cpnum)
);

insert into my_coupon values('suwook',6,'19/01/05');

drop table my_coupon purge;
drop table coupon purge;

-- 로그인(login) 테이블 생성 
--create table login 
--(fk_userid  varchar2(100) not null  -- 회원아이디 
--,pw         varchar2(200) not null  -- 암호(SHA256 암호화) 
--,name       varchar2(30)  not null  -- 회원명 
--,constraint PK_login_userid primary key(fk_userid)
--,constraint FK_login_userid foreign key(fk_userid)
--                                  references member(userid)
--);


-- 관리자(admin) 테이블 생성 
create table admin 
(adminid varchar2(100) -- 관리자아이디 
,adminpw varchar2(200) -- 관리자암호 
);

insert into admin values('admin', 'qwer1234$');

-----------------------------------------------------------------------------
select *
from  product_package;
-- 상품패키지(product_package) 테이블 생성 
create table product_package 
(pacnum       number default 0  not null    -- 상품패키지번호 
,pacname      varchar2(100)     not null    -- 상품패키지명 
,paccontents  clob                          -- 패키지내용 
,pacimage     varchar2(200)                 -- 패키지이미지 
,constraint PK_product_package primary key(pacnum)
,constraint UQ_product_package unique(pacname)
);

create sequence seq_product_Package_pacnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into product_package values(seq_product_Package_pacnum.nextval, '없음', '없음', '없음');

commit;

-- 대분류상세(large_detail) 테이블 생성 
create table large_detail 
(ldnum   number         not null  -- 대분류상세번호 
,ldname  varchar2(100)  not null  -- 대분류명 
,constraint PK_large_detail	primary key(ldnum)
,constraint UQ_large_detail unique (ldname)
);

create sequence seq_large_detail_ldnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into large_detail values(seq_large_detail_ldnum.nextval, '샐러드');
insert into large_detail values(seq_large_detail_ldnum.nextval, '디톡스');
insert into large_detail values(seq_large_detail_ldnum.nextval, 'DIY');

select *
from large_detail;

-- 소분류상세(small_detail) 테이블 생성
create table small_detail 
(sdnum     number         not null  -- 소분류상세번호
,fk_ldname  varchar2(100)       not null  -- 대분류상세명
,sdname    varchar2(100)  not null  -- 소분류명
,constraint PK_small_detail	primary key(sdnum)
,constraint FK_small_detail_ldname foreign key(fk_ldname)
                                  references large_detail(ldname)
,constraint UQ_small_detaill unique (sdname)
);

create sequence seq_small_detail_sdnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


insert into small_detail values(seq_small_detail_sdnum.nextval, '샐러드', '시리얼');
insert into small_detail values(seq_small_detail_sdnum.nextval, '샐러드', '샐러드도시락');
insert into small_detail values(seq_small_detail_sdnum.nextval, '샐러드', '죽/스프');

insert into small_detail values(seq_small_detail_sdnum.nextval, '디톡스', '물/주스');
insert into small_detail values(seq_small_detail_sdnum.nextval, '디톡스', '건강즙');
insert into small_detail values(seq_small_detail_sdnum.nextval, '디톡스', '건강차');

insert into small_detail values(seq_small_detail_sdnum.nextval, 'DIY', '야채/곡류');
insert into small_detail values(seq_small_detail_sdnum.nextval, 'DIY', '과일');
insert into small_detail values(seq_small_detail_sdnum.nextval, 'DIY', '고기/달걀');
insert into small_detail values(seq_small_detail_sdnum.nextval, 'DIY', '생선');
insert into small_detail values(seq_small_detail_sdnum.nextval, 'DIY', '소스');
insert into small_detail values(seq_small_detail_sdnum.nextval, 'DIY', '유제품');

commit;

select *
from small_detail;

-- 스펙태그(spec_tag) 테이블 생성 / (Hit, Best, New)
create table spec_tag 
(stnum   number         not null  -- 스펙태그번호 
,stname  varchar2(100)  not null  -- 스펙태그명 
,constraint PK_spec_tag	primary key(stnum)
,constraint UQ_spec_tag unique (stname)
);

create sequence seq_spec_tag_stnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into spec_tag values(seq_spec_tag_stnum.nextval, 'HIT');
insert into spec_tag values(seq_spec_tag_stnum.nextval, 'BEST');
insert into spec_tag values(seq_spec_tag_stnum.nextval, 'NEW');

select *
from spec_tag;

-- 카테고리태그(category_tag) 테이블 생성 
create table category_tag 
(ctnum   number         not null  -- 카테고리번호 
,ctname  varchar2(100)  not null  -- 카테고리명 
,constraint PK_category_tag primary key(ctnum)
,constraint UQ_category_tag unique (ctname)
);

create sequence seq_category_tag_ctnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into category_tag values(seq_category_tag_ctnum.nextval, '다이어트용');
insert into category_tag values(seq_category_tag_ctnum.nextval, '식사대용/간식용');
insert into category_tag values(seq_category_tag_ctnum.nextval, '채식주의자용');

select *
from category_tag;

-- 이벤트태그(event_tag) 테이블 생성 
create table event_tag 
(etnum   number  not null  -- 이벤트번호 
,etname  varchar2(100)     -- 이벤트명
,etimagefilename varchar2(200) -- 이벤트 이미지
,constraint PK_event_tag primary key(etnum)
,constraint UQ_event_tag unique (etname)
);


 select *
from event_tag;


create sequence seq_event_tag_etnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

insert into event_tag values(seq_event_tag_etnum.nextval, '크리스마스 이벤트', 'MerryChristmas.PNG');
insert into event_tag values(seq_event_tag_etnum.nextval, '연말 이벤트', 'LastSale.png');
insert into event_tag values(seq_event_tag_etnum.nextval, '연초 이벤트', 'NewYearSale.png');
insert into event_tag values(seq_event_tag_etnum.nextval, '없음', null);

select *
from event_tag; 

-- 이벤트 테이블 이미지컬럼 추가(미리 만드신 분만 실행하세요)
alter table event_tag add etimagefilename varchar2(200); 
update event_tag set etimagefilename= 'MerryChristmas.PNG' where etnum=1;
update event_tag set etimagefilename= 'LastSale.png' where etnum=2;
update event_tag set etimagefilename= 'NewYearSale.png' where etnum=3;
update event_tag set etimagefilename= null where etnum=4;

commit;

select *
from event_tag;

select * from
(
    select *
    from
    (
        select *
        from product
        where fk_pacname = '[퀸즈프레시] 프리미엄 샐러드 3종'
    ) V
    where saleprice = (select min(saleprice) from (
                                                    select *
                                                    from product
                                                    where fk_pacname = '[퀸즈프레시] 프리미엄 샐러드 3종'
                                            )
                )
) T
where pnum = (select min(pnum) from (
    select *
    from
    (
        select *
        from product
        where fk_pacname = '[퀸즈프레시] 프리미엄 샐러드 3종'
    ) V
    where saleprice = (select min(saleprice) from (
                                                    select *
                                                    from product
                                                    where fk_pacname = '[퀸즈프레시] 프리미엄 샐러드 3종'
                                            )
                )
    )
) ;

select *
from 
(
    select *
    from
    (
        select *
        from product
        where fk_pacname = '[퀸즈프레시] 프리미엄 샐러드 3종'
    ) V
    where saleprice = (
                        select min(saleprice)
                        from product
                        where fk_pacname = '[퀸즈프레시] 프리미엄 샐러드 3종'
                    )
)T;


-- 상품(product) 테이블 생성
create table product 
(pnum          number  not null                -- 상품번호 
,fk_pacname     varchar2(100)  not null                -- 상품패키지명
,fk_sdname      varchar2(100)  not null                -- 소분류상세명 
,fk_ctname      varchar2(100)  not null                -- 카테고리태그명 
,fk_stname      varchar2(100)  not null                -- 스펙태그명 
,fk_etname      varchar2(100)  not null      -- 이벤트태그명
,pname         varchar2(100)  not null         -- 상품명 
,price         number default 0  not null      -- 원가 
,saleprice     number default 0  not null      -- 판매가 
,point         number default 0  not null      -- 포인트 
,pqty          number default 0  not null      -- 재고량 
,pcontents     clob                            -- 상품설명 
,pcompanyname  varchar2(100)  not null         -- 상품회사명 
,pexpiredate varchar2(200) default '상세내용참조'  not null -- 유통기한 
,allergy       clob                            -- 알레르기정보 
,weight        number default 0  not null      -- 용량 
,salecount     number default 0  not null      -- 판매량 
,plike         number default 0  not null      -- 상품좋아요 
,pdate         date default sysdate  not null  -- 상품등록일자
,constraint PK_product_pnum primary key(pnum)
,constraint FK_product_pacname foreign key(fk_pacname)
                               references product_package(pacname)
,constraint FK_product_sdname foreign key(fk_sdname)
                               references small_detail(sdname)
,constraint FK_product_ctname foreign key(fk_ctname)
                               references category_tag(ctname)
,constraint FK_product_stname foreign key(fk_stname)
                               references spec_tag(stname)
,constraint FK_product_etname foreign key(fk_etname)
                               references event_tag(etname)
);



create sequence seq_product_pnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;



-- 상품백업(Product_backup) 테이블 생성 
create table product_backup 
(deletenum     number  not null         -- deletenum 
,pnum          number  not null                -- 상품번호 
,fk_pacname     number  not null                -- 상품패키지명
,fk_sdname      number  not null                -- 소분류상세명 
,fk_ctname      number  not null                -- 카테고리태그명 
,fk_stname      number  not null                -- 스펙태그명 
,fk_etname      number  default 0 not null      -- 이벤트태그명
,pname         varchar2(100)  not null         -- 상품명 
,price         number default 0  not null      -- 원가 
,saleprice     number default 0  not null      -- 판매가 
,point         number default 0  not null      -- 포인트 
,pqty          number default 0  not null      -- 재고량 
,pcontents     clob                            -- 상품설명 
,pcompanyname  varchar2(100)  not null         -- 상품회사명 
,pexpiredate   date default sysdate  not null  -- 유통기한 
,allergy       clob                            -- 알레르기정보 
,weight        number default 0  not null      -- 용량 
,salecount     number default 0  not null      -- 판매량 
,plike         number default 0  not null      -- 상품좋아요 
,pdate         date default sysdate  not null  -- ?상품판매일자
,constraint PK_product_backup primary key(deletenum)
);

create sequence seq_product_backup_deletenum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 찜(pick) 테이블 생성 
create table pick 
(picknum    number         not null  -- 찜번호 
,fk_userid  varchar2(100)  not null  -- 회원아이디 
,fk_pnum    number         not null  -- 상품번호    
,constraint PK_pick_picknum primary key(picknum)
,constraint FK_pick_userid foreign key(fk_userid)
                            references member(userid)
,constraint FK_pick_pnum foreign key(fk_pnum)
                           references product(pnum)
);

create sequence seq_pick_picknum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 장바구니 테이블 생성
 create table product_cart
 (cartno  number               not null   --  장바구니 번호
 ,fk_userid  varchar2(20)         not null   --  사용자ID
 ,fk_pnum    number(8)            not null   --  제품번호 
 ,oqty    number(8) default 0  not null   --  주문량
 ,status  number(1) default 1             --  삭제유무; 0: 삭제 1: 생성
 ,constraint PK_product_cart_cartno primary key(cartno)
 ,constraint FK_product_cart_userid foreign key(fk_userid)
                                references member(userid) 
 ,constraint FK_product_cart_pnum foreign key(fk_pnum)
                                references product(pnum)
 ,constraint CK_product_cart_status check( status in(0,1) ) 
 );

 create sequence seq_product_cart_cartno
 start with 1
 increment by 1
 nomaxvalue
 nominvalue
 nocycle
 nocache;


 
-- 상품이미지(product_images) 테이블 생성 
create table product_images 
(pimgnum       number         not null -- 상품이미지번호 
,pimgfilename  varchar2(100)  not null -- 상품이미지파일명 
,fk_pnum       number         not null -- 상품번호 
,constraint PK_product_images primary key(pimgnum)
,constraint FK_product_images_ldnum foreign key(fk_pnum)
                                      references product(pnum)
);

				


create sequence seq_product_images_pimgnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 리뷰게시판(review_borad) 테이블 생성 
create table review_borad 
(rbnum        number  not null                -- 리뷰번호 
,fk_pnum      number  not null                -- 상품번호 
,fk_userid    varchar2(100)  not null         -- 사용자아이디 
,rbtitle      varchar2(100)  not null         -- 리뷰제목 
,rbgrade      number default 0      not null  -- 리뷰평점 
,rbwritedate  date default sysdate  not null  -- 리뷰작성일자 
,rbcontents   clob  not null                  -- 리뷰내용
,rbimage    varchar2(200)                 -- 리뷰이미지
,rbviewcount  number default 0  not null      -- 리뷰조회수 
,rblike       number default 0  not null      -- 리뷰좋아요 
,rbstatus     number default 1  not null   
,constraint PK_review_borad primary key(rbnum)
,constraint FK_review_borad_pnum foreign key(fk_pnum)
                                   references product(pnum)
,constraint FK_review_borad_userid foreign key(fk_userid)
                                    references member(userid)
,constraint CK_review_borad_rbstatus check( rbstatus in(0,1) )
);

create sequence seq_review_borad_rbnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 기존에 리뷰게시판 테이블 만드신 분만 실행하세요
alter table review_borad add rbimage varchar2(200);

commit;

-- 리뷰게시판댓글(review_comment) 테이블 생성 
create table review_comment 
(rcnum        number         not null         -- 리뷰댓글번호
,fk_rbnum     number         not null         -- 리뷰게시판번호
,fk_userid    varchar2(100)  not null         -- 사용자아이디
,name      varchar2(10) not null                -- 사용자이름  
,rcwritedate  date default sysdate  not null  -- 리뷰댓글작성일자 
,rccontents   number  not null                -- 리뷰댓글내용 
,constraint PK_review_comment primary key(rcnum)
,constraint FK_review_comment_rbnum foreign key(fk_rbnum)
                                       references review_borad(rbnum)
,constraint FK_review_comment_userid foreign key(fk_userid)
                                        references member(userid)
);

create sequence seq_review_comment_rcnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 상품주문(product_order)  테이블 생성 
create table product_order 
(odrcode        varchar2(100)  not null         -- 주문코드 / 회사코드-주문일자-seq (ex. s-20181123-1
,fk_userid      varchar2(100)  not null         -- 사용자아이디 
,odrtotalprice  number         not null         -- 주문총액 
,odrtotalpoint  number         not null         -- 주문총포인트 
,odrdate        date default sysdate  not null  -- 주문일자
,constraint PK_product_order primary key(odrcode)
,constraint FK_product_order_userid foreign key(fk_userid)
                                      references member(userid)
);

create sequence seq_product_order_odrcode
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

create table product_order_temp
as
select *
from product_order;


-- 주문상세(product_order_detail) 테이블 생성 
create table product_order_detail 
(odrdnum        number not null            -- 주문상세번호 
,fk_pnum        number not null            -- 상품번호 
,fk_odrcode     varchar2(100) not null     -- 주문코드 
,oqty           number not null            -- 주문수량 
,odrprice       number not null            -- 주문시 상품가격
,odrstatus  number default 0 not null  -- 배송상태 / 0:배송전(주문완료) 1:배송중 2:배송완료 3: 주문취소 4: 교환환불
,deliverdate    date                       -- 배송완료일자?
,invoice        varchar2(200)              -- 운송장번호 
,constraint PK_order_detail	primary key (odrdnum)
,constraint FK_order_detail_pnum foreign key(fk_pnum)
                                   references product(pnum)                             
,constraint FK_order_detail_odrcode foreign key(fk_odrcode) 
                                       references product_order(odrcode)  on delete cascade
,constraint CK_order_detail_odrstatus check( odrstatus in(0, 1, 2, 3, 4) )
);

create sequence seq_order_detail_odrdnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


create table product_order_detail_temp
as
select *
from product_order_detail;

-- 상품문의게시판(qna_borad) 테이블 생성 
create table qna_borad 
(qnanum        number not null                -- 상품문의번호 
,fk_pnum       number not null                -- 상품번호 
,fk_userid     varchar2(100) not null         -- 사용자아이디 
,qnawritedate  date default sysdate not null  -- 상품문의작성일자 
,qnatitle      varchar2(100) not null         -- 상품문의제목 
,qnacontents   clob not null                  -- 상품문의내용 
,qnaopencheck  number default 1 not null      -- 상품문의공개여부 / 0:삭제 1:공개 
,qnastatus     number default 1 not null
,constraint PK_qna_borad primary key(qnanum)
,constraint FK_qna_borad_pnum foreign key(fk_pnum)
                                  references product(pnum)
,constraint FK_qna_borad_userid foreign key(fk_userid)
                                  references member(userid)
,constraint CK_qna_borad_qnastatus check( qnastatus in(0, 1) )
);

create sequence seq_qna_borad_qnanum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from member;

select *
from login;

-- 상품문의댓글(qna_comment) 테이블 생성
create table qna_comment 
(qnacnum        number not null                -- 상품문의댓글번호 
,fk_qnanum      number not null                -- 상품문의번호 
,qnacwritedate  date default sysdate not null  -- 상품문의댓글작성일자 
,qnaccontents   clob not null                  -- 상품문의댓글내용 
,constraint PK_qna_comment primary key(qnacnum)
,constraint FK_qna_comment_qnanum foreign key(fk_qnanum)
                                    references qna_borad(qnanum)
);

create sequence seq_qna_comment_qnacnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


-- 주문취소(order_cancel) 테이블 생성
create table order_cancel 
(odrcnum       number not null  -- 주문취소번호
,odrccontents  clob not null    -- 주문취소사유
,fk_odrcode     varchar2(100)  not null -- 주문코드
,constraint PK_order_cancel primary key(odrcnum)
,constraint FK_order_cancel_odrcode foreign key(fk_odrcode) 
                                       references product_order(odrcode)  on delete cascade
);

create sequence seq_order_cancel_odrcnum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 결제정보 저장 테이블
--(회원아이디/결제일시/결제금액/세부결제수단/결제상태(실패/성공))
create table payment 
(paynum  number             not null    -- 결제정보인덱스
,fk_userid varchar2(100)    not null    -- 사용자아이디
,paydate    date               not null    -- 결제일시
,payamounts number        not null      -- 결제금액
,paymethod     varchar2(100)    not null    -- 결제수단
,paystatus      number      not null        -- 결제상태(0; 실패/1; 성공)
,constraint PK_payment primary key(paynum)
,constraint FK_payment_userid foreign key(fk_userid)
                                      references member(userid)
,constraint CK_payment check( paystatus in(0, 1) )

);

create sequence seq_payment_paynum
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


create table payment_temp
as
select *
from payment;

alter table product modify(pexpiredate varchar2(200) default '상세내용참조'); 

commit;



--------- 데이터 인서트 쿼리 (product_package, product) ------------
-- 샐러드 - 샐러드도시락
insert into product_package(pacnum, pacname, paccontents,  pacimage)
values(seq_product_Package_pacnum.nextval
, '[퀸즈프레시] 프리미엄 샐러드 3종'
, '수분을 적당히 머금어 아삭하게 씹히는 채소와 신선한 과일에 산뜻하게 곁들여지는 드레싱. 
여기에 간이 세지 않은 고기나 쉬림프 등의 재료가 어우러지면, 한 끼 식사로도 손색없는 든든한 샐러드가 완성되죠. 
샐러드는 간편할 뿐 아니라 다양한 영양소가 고루 담겨 있어 많은 사람들이 즐겨 찾습니다. 
이 고마운 샐러드에 여성을 향한 ‘각별한’ 마음이 한 줌 더해졌어요. 
컬리가 소개하는 샐러드는 영양사, 채소연구원 등 전문가의 자문을 받아 여성 건강에 도움을 주는 레시피로 세심하게 구성됐어요. 
유기농 재료를 가지고 저염식 조리법으로 만들어져 더욱 안심하고 건강하게 즐길 수 있답니다. 전문 셰프가 만든 프리미엄 샐러드, 퀸즈프레시의 샐러드를 직접 경험해보세요. '
, '1496199185281l0.jpg' );
 
insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname
, price, saleprice, point, pqty, pcontents, pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate)
values(seq_product_pnum.nextval, '[퀸즈프레시] 프리미엄 샐러드 3종', '샐러드도시락', '다이어트용', 'HIT', '없음', '베리'||chr(38)||'리코타'
, 6900, 6900, 690, 100, '리코타 치즈는 부드러운 질감과 고소하면서도 살짝 시큼한 맛이 여심을 저격하는 대표 음식으로 칼슘은 물론 오메가 3와 6가 풍부하죠. 여기에 상큼한 맛이 톡 튀며 즐거움을 안기는 아로니아, 블루베리, 크랜베리 등을 담아 칼로리 부담을 낮췄어요. 베리류에는 비타민, 안토시아닌 등의 성분이 풍부하답니다. 이탈리아산 포도 과즙으로 만들어진 발사믹 드레싱은 샐러드의 산뜻함을 한층 더해 줄 거예요.'
,'queensfresh', '제조일로부터 5일', '난류, 땅콩, 소고기, 닭고기, 새우와 같은 시설에서 생산', 245, 30, 10, sysdate);

insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname
, price, saleprice, point, pqty, pcontents, pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate)
values(seq_product_pnum.nextval, '[퀸즈프레시] 프리미엄 샐러드 3종', '샐러드도시락', '다이어트용', 'HIT', '없음', '쉬림프'||chr(38)||'프렌치빈'
, 6900, 6900, 690, 100, '바다 내음이 은은히 번지는 탱글탱글하고 신선한 새우와 씹을수록 고소한 풍미를 선사하는 프렌치빈이 만났어요. 새우에는 오메가 3, 칼슘, 비타민 D가, 프렌치빈에는 칼슘, 콜린, 비타민 등의 성분이 풍부해요. 여기에 구운 마늘과 양파가 들어가 맛과 영양을 더했답니다. 맛의 화룡점정을 찍어줄 칠리어니언 드레싱은 할라피뇨와 오이피클로 매콤새콤한 맛을 살렸기에 보다 풍성한 맛의 조화를 이끌어 낼 거예요.'
,'queensfresh', '제조일로부터 5일', '난류, 땅콩, 소고기, 닭고기, 새우와 같은 시설에서 생산', 270, 30, 10, sysdate);

insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname
, price, saleprice, point, pqty, pcontents, pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate)
values(seq_product_pnum.nextval, '[퀸즈프레시] 프리미엄 샐러드 3종', '샐러드도시락', '다이어트용', 'HIT', '없음', '비프'||chr(38)||'머쉬룸'
, 6900, 6900, 690, 100, '부드럽고 담백하게 씹히는 청정 호주산 소고기와 쫄깃하고 고소한 풍미가 인상적인 국내산 새송이버섯이 고급스러운 조화를 이뤘어요. 소고기에는 단백질, 비타민 B, 나이아신 성분이, 새송이버섯에는 질 좋은 칼슘과 비타민 C가 풍부하답니다. 함께 얹힌 파인애플은 고기의 육질을 부드럽게 해줄 뿐 아니라, 새콤하고 달달한 맛으로 산뜻한 풍미를 안겨줄 거예요. 오리엔탈 드레싱을 곁들여 감칠맛을 더해보세요.'
,'queensfresh', '제조일로부터 5일', '난류, 땅콩, 소고기, 닭고기, 새우와 같은 시설에서 생산', 250, 30, 10, sysdate);


insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'berry_ricotta.jpg', 1); 
insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'shirimp_franchbean.jpg', 2); 
insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'beef.jpg', 3); 

select *
from product_images;

select *
from product_package;


--------샐러드:시리얼 insert
insert into product_package(pacnum, pacname, paccontents ,pacimage)
values( seq_product_Package_pacnum.nextval, '[네이쳐패스] 유기농 시리얼 4종','깐깐하게 엄선된 유기농 재료로 더욱 건강하게 즐기는 시리얼','1508744357840l0.jpg');

--product 시퀀스 4번
insert into product (pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point
                                    ,pqty, pcontents, pcompanyname, pexpiredate
                                    ,allergy, weight, salecount, plike, pdate )
values(seq_product_pnum.nextval,  '[네이쳐패스] 유기농 시리얼 4종','시리얼','식사대용/간식용','NEW','크리스마스 이벤트','헤리티지 플레이크',8000,7800,780,300,'밀, 보리, 퀴노아를 비롯해 영양 만점의 곡물들이 혼합되어 고소한 풍미를 전해요. 유기농 꿀이 첨가되어 살짝 달콤한 맛이 나며 사탕수수를 증발시켜 만든 섬유질이 들어가 건강을 더하였죠. 통곡물 본연의 맛과 식감이 잘 살아 있답니다.'
,'Nature Path Foods Inc.','제품에 별도 표기된 날짜까지(읽는법:년.월.일 순)','밀 포함',375,568,84,default);

--product 시퀀스 5번
insert into product (pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point
                                    ,pqty, pcontents, pcompanyname, pexpiredate
                                    ,allergy, weight, salecount, plike, pdate )
values(seq_product_pnum.nextval,  '[네이쳐패스] 유기농 시리얼 4종','시리얼','식사대용/간식용','NEW','크리스마스 이벤트','코알라 크리스피 ',8000,7800,780,0,'건강에 좋은 현미를 달콤한 코코아로 감싼 코알라 크리스피는 바삭바삭한 식감이 일품이에요. 현미의 고소함과 코코아의 달달한 풍미가 조화롭게 어우러졌지요. 입맛 없는 아침도 문제없답니다.'
,'Nature Path Foods Inc.','제품에 별도 표기된 날짜까지(읽는법:년.월.일 순)','없음',325,215,43,default);

--product 시퀀스 6번
insert into product (pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point
                                    ,pqty, pcontents, pcompanyname, pexpiredate
                                    ,allergy, weight, salecount, plike, pdate )
values(seq_product_pnum.nextval,  '[네이쳐패스] 유기농 시리얼 4종','시리얼','식사대용/간식용','NEW','크리스마스 이벤트','블루베리 시나몬 플렉스 ',8000,7800,780,50,'통밀과 밀기울을 비롯해 아마씨, 대두, 귀리 등 다양한 곡물과 상큼한 블루베리, 향긋한 시나몬, 달콤한 사탕수수즙을 섞어 만들었어요. 다채로운 재료가 어우러졌기에 씹히는 식감이 풍성하고, 고소하면서도 향긋한 풍미를 전하지요.'
,'Nature Path Foods Inc.','제품에 별도 표기된 날짜까지(읽는법:년.월.일 순)','밀, 대두 함유',400,100,20,default);

--product 시퀀스 7번
insert into product (pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point
                                    ,pqty, pcontents, pcompanyname, pexpiredate
                                    ,allergy, weight, salecount, plike, pdate )
values(seq_product_pnum.nextval,  '[네이쳐패스] 유기농 시리얼 4종','시리얼','식사대용/간식용','NEW','크리스마스 이벤트','초코 침스 ',8000,7800,780,165,'활짝 웃고 있는 아기 오랑우탄이 그려져 있어 아이들의 흥미를 끄는 초코 침스예요. 유기농으로 자란 옥수수와 유기농 코코아로 만들어진 달달하며 고소한 인기 만점의 시리얼이랍니다.'
,'Nature Path Foods Inc.','제품에 별도 표기된 날짜까지(읽는법:년.월.일 순)','없음',284,86,4,default);


insert into product_images(pimgnum,pimgfilename,fk_pnum) 
values(seq_product_images_pimgnum.nextval,'HERTAGE FLAKES.PNG',4 ); 

insert into product_images(pimgnum,pimgfilename,fk_pnum) 
values(seq_product_images_pimgnum.nextval,'KOALA CRISP.PNG',5);

insert into product_images(pimgnum,pimgfilename,fk_pnum) 
values(seq_product_images_pimgnum.nextval,'Blueberry Cinnamon Flax.PNG',6);

insert into product_images(pimgnum,pimgfilename,fk_pnum) 
values(seq_product_images_pimgnum.nextval,'Choco Chimps.PNG', 7);



insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname
, price, saleprice, point, pqty, pcontents, pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate)
values(seq_product_pnum.nextval, '없음', '죽/스프', '식사대용/간식용', 'HIT', '없음', '새우 완탕 클리어스프'
, 3900, 3900, 390, 100, '홍콩이나 중국은 물론 태국의 길거리에서도 완탕 가게를 쉽게 발견할 수 있어요. 옹기종기 모여앉아 완탕 한 그릇을 비우는 사람들은 태국의 일상적인 풍경이기도 하죠. 새우 한 마리가 꽉 들어차 씹으면 씹을수록 탱글탱글 풀어지는 완탕의 그 맛. 완탕 한 입, 국물 한 입 먹다 보면 금방 바닥을 보게 되는데요. 지금 소개하는 새우 완탕 클리어 수프는 태국에서 손꼽히는 규모의 수산물 전문 업체가 노하우를 살려 현지의 맛을 그대로 담아낸 제품입니다. 신선한 새우의 껍질과 내장을 깨끗하게 손질하여 비리지 않고 고소한 맛이 나지요. 향신료가 과하게 들어가지 않고 국물이 맑고 담백해 계속 먹게 되는 매력을 지녔어요. 드실 땐 비닐을 제거한 뒤 표시선까지 물을 붓고 전자레인지에 삼 분만 돌려주세요. 간단하게 이국적인 맛의 요리를 즐기실 수 있을 거예요.'
,'OKEANOSFOOD COMPANY LIMITED', '제조일로부터 18개월', '새우, 밀가루(밀), 대두 함유', 150, 50, 10, sysdate);

insert into product_images(pimgnum,pimgfilename,fk_pnum) 
values(seq_product_images_pimgnum.nextval,'hobakjook.png', 8);

insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname
, price, saleprice, point, pqty, pcontents, pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate)
values(seq_product_pnum.nextval, '없음', '죽/스프', '식사대용/간식용', 'HIT', '없음', '[정미경키친] 단호박 죽'
, 6000, 6000, 600, 200, '정미경키친은 전통 요리, 정통 한식을 고수하기보다는 시대에 맞는 식재료와 문화를 아우러 누구든 친숙하게 즐길 수 있는 집밥 레시피를 지향합니다. 모양이 화려하지 않아도 재료가 녹아든 모양새와 깊은 맛을 보면 요리연구가의 남다른 내공이 느껴지죠. 우연찮게 요리를 가르치기 시작한 정미경 요리연구가는 어느덧 요리 인생 30년의 길을 걸으며 현재, 대한민국을 대표하는 음식 전문가로 활약하고 있는데요. 고급 요리 학원의 한식 전문 강사, 이밥차 요리 연구소장, 정미경 사계철 반찬 대표라는 탄탄한 타이틀이 그녀를 증명해줘요. 누구든 맛있고 간편하게 조리할 수 있는 집밥 레시피를 각종 방송과 책 작업, 강연 등 여러 무대에서 알리고 있지요. 이제 컬리를 통해 만나보세요. 집밥이 즐거워지는 이유, 따뜻한 밥과 어우러지는 집밥 레시피를 가정에서 경험할 수 있답니다. 전세대가 어우러지는 행복한 식탁을 펼쳐보세요.'
,'(주)정미경키친', '제조일로부터 7일', '게, 새우, 고등어, 난류, 땅콩, 대두, 우유, 밀, 메밀, 돼지고기, 토마토, 호두, 잣, 키위, 닭고기, 조개류(굴,전복,홍합포함), 오징어, 쇠고기, 참깨와 같은 시설에서 제조', 350, 30, 10, sysdate);

insert into product_images(pimgnum,pimgfilename,fk_pnum) 
values(seq_product_images_pimgnum.nextval,'shirimp_soup.png', 9);

update product_images set pimgnum = 9 where pimgnum =10;
commit;

select *
from product;


-- ***** 건강차 insert
-- 자몽청
insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point
             , pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '없음', '건강즙', '식사대용/간식용', 'NEW', '없음', '[겨울향기] 자몽청 950g', 10000, 8800, 880
     , 100, '손 끝이 차갑게 아려오는 날, 따끈한 과일차를 호르륵 마시는 느낌은 참 각별해요. 
     코 끝에 감겨 오는 풍성한 과일향과 입 안 가득한 달콤함은 생각만 해도 기분이 좋아지죠. 
     컬리가 자몽 과육이 풍성하게 들어간 자몽청을 준비했습니다. 생과일로 먹을 때에 비해 쌉싸름한 맛이 줄어들고 붉게 익은 만다린이 연상되는 
     진향 향이 매력적이에요. 베타카로틴과 비타민A 등이 풍부한 자몽에 설탕만을 넣어서 만든 건강한 과일청이죠. 
     과육을 얇게 썰어 넣은 덕분에 식감이 살아있으면서도 씹는데 부담이 없어요. 
     겨울에는 따끈한 차로, 여름에는 탄산수에 넣어 청량한 탄산음료로 활용해보세요.'
     , '신성에프엔비', 950);
     
-- 유자청
insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point
             , pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '없음', '건강즙', '식사대용/간식용', 'NEW', '없음', '[겨울향기] 유자청 1kg', 10000, 7700, 770
     , 100, '손 끝이 차갑게 아려오는 날, 따끈한 과일차를 호르륵 마시는 느낌은 참 각별해요.
     코 끝에 감겨 오는 풍성한 과일향과 입 안 가득한 달콤함은 생각만 해도 기분이 좋아지죠.
     컬리가 진한 과일향의 대표주자인 유자 과육이 풍성하게 들어간 유자청을 준비했습니다.
     비타민C와 구연산, 엽산 등이 풍부한 유자에 설탕만을 넣어서 만든 건강한 과일청이죠.
     과육을 얇게 썰어 넣은 덕분에 식감이 살아있으면서도 씹는데 부담이 없어요.
     겨울에는 따끈한 차로, 여름에는 탄산수에 넣어 청량한 탄산음료로 활용해보세요.'
     , '신성에프엔비', 1000);
     
     
-- 레몬청
insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point
             , pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '없음', '건강즙', '식사대용/간식용', 'NEW', '없음', '[겨울향기] 레몬청 950g', 10000, 8800, 880
     , 100, '손 끝이 차갑게 아려오는 날, 따끈한 과일차를 호르륵 마시는 느낌은 참 각별해요. 
     코 끝에 감겨 오는 풍성한 과일향과 입 안 가득한 달콤함은 생각만 해도 기분이 좋아지죠. 
     컬리가 레몬 과육이 풍성하게 들어간 레몬청을 준비했습니다. 비타민C와 구연산 등이 풍부한 레몬에 설탕만을 넣어서 만든 건강한 과일청이죠.
     과육을 얇게 썰어 넣은 덕분에 식감이 살아있으면서도 씹는데 부담이 없어요. 
     겨울에는 따끈한 차로, 여름에는 탄산수에 넣어 청량한 탄산음료로 활용해보세요.'
     , '신성에프엔비', 950);
     
-- 한라봉청
insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point
             , pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '없음', '건강즙', '식사대용/간식용', 'BEST', '없음', '[겨울향기] 한라봉청 950g', 10000, 8800, 880
     , 100, '손 끝이 차갑게 아려오는 날, 따끈한 과일차를 호르륵 마시는 느낌은 참 각별해요. 
     코 끝에 감겨 오는 풍성한 과일향과 입 안 가득한 달콤함은 생각만 해도 기분이 좋아지죠. 
     컬리가 한라봉 과육이 풍성하게 들어간 한라봉청을 준비했습니다. 비타민C와 구연산 등이 풍부한 한라봉에 설탕만을 넣어서 만든 건강한 과일청이죠.
     과육을 얇게 썰어 넣은 덕분에 식감이 살아있으면서도 씹는데 부담이 없어요. 
     겨울에는 따끈한 차로, 여름에는 탄산수에 넣어 청량한 탄산음료로 활용해보세요.'
     , '신성에프엔비', 950);

update product set fk_sdname = '샐러드도시락'
where pnum =1;
select *
from product;

commit;

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'grapefruitjuice.jpg', 10);
insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'citronjuice.jpg', 11);
insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'lemonjuice.jpg', 12);
insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'hanrabongjuice.jpg', 13);

select *
from product;

select *
from product_images;

commit;



---------------------------------
-- ***** 건강즙 insert
-- 도라지배즙
insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point
             , pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '없음', '건강즙', '식사대용/간식용', 'BEST', '없음', '[참든건강] 아이달콤 도라지배즙 (20포)', 30000, 25000, 2500
     , 100, '환절기 식품의 대명사인 도라지와 배. 요즘엔 환절기 뿐만 아니라 평상시에도 찾게 돼요.
     에어컨이나 난방기 사용부터 미세먼지까지 대비해야 할 것도 챙길 것도 많기 때문이죠. 그래서 아이에게 도라지배즙을 먹이려고 하는 분들이 많으실 텐데요. 
     참든건강은 아이가 먹고 마실 거라면 더 꼼꼼해질 수밖에 없는 부모의 마음으로 국산 배와 도라지를 깨끗한 즙에 담았습니다.'
     , '참든건강과학', 100);
     
-- 포도즙
insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point
             , pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '없음', '건강즙', '식사대용/간식용', 'BEST', '없음', '[장수이야기] 순진한 포도즙 10포', 20000, 16000, 1600
     , 100, '장수이야기는 포도의 과육뿐만 아니라 영양이 풍부한 껍질과 씨까지 통째로 착즙하여 순진한 포도즙을 만들었습니다. 
     무엇보다 순진한 포도즙의 가장 큰 매력으로는 생착즙 공정을 꼽을 수 있는데요. 보통 재료를 오랜 시간 끓여 즙을 얻는 것과 달리 장수이야기는 열에 의해 
     영양소가 파괴되는 것을 막기 위하여 까다롭게 생으로 착즙하는 과정을 마다하지 않습니다. 그렇게 만들어진 순진한 포도즙을 한 입 들이켜보면, 
     마치 생포도를 먹는 듯 신선한 맛이 도드라진답니다. 이제 포도 본연의 영양과 풍미를 보존한 장수이야기 포도즙 선물세트로 소중한 지인에게 건강을 선물해보세요.'
     , '장수이야기', 120);
     
-- 호박즙
insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point
             , pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '없음', '건강즙', '식사대용/간식용', 'HIT', '없음', '[담아본] 유기농 호박즙', 35000, 32000, 3200
     , 100, '좋은 원재료로 만든 즙을 집에 갖추고 있으면 주스 대용으로 한 포씩 쭉쭉 들이키기 참 좋지요. 즙을 꾸준히 먹어볼까 하는 생각이 드신다면,
     담아본의 유기농 호박즙을 준비해 보세요. 그 어떤 식품첨가물도 넣지 않고 유기농으로 재배한 늙은 호박에 극소량의 유기농 설탕만을 넣어 만들었습니다.
     달콤하게 잘 익은 늙은 호박을 그대로 착즙했기에 매력적인 호박의 풍미를 느낄 수 있어요. 30개입 박스 제품으로, 주변 분들에게 선물하기에도 제격이에요.'
     , '담아본', 80);
     
-- 착즙
insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point
             , pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '없음', '건강즙', '식사대용/간식용', 'BEST', '없음', '[그란테] 100% 착즙 석류주스', 20000, 18000, 1800
     , 100, '석류는 예로부터 미인들과 얽힌 이야기가 많았어요. 양귀비와 클레오파트라가 즐겨 먹었다는 일화가 전해 내려오고, 하데스는 페르세포네를 석류로 
     유혹했다고 하죠. 타는 듯 붉은 열매 속에는 보석처럼 빛나는 알갱이가 알알이 박혀 맛과 향을 뽐내는데요. 석류의 과육에는 식물성 에스트로겐과 필수 아미노산이, 
     씨앗에는 식이섬유가 풍부해서 여성에게 추천하기에는 더없이 좋은 식품이기도 합니다. '
     , '그란테', 100);
     
insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'bellflowerjuice.jpg', 14);
insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'grapejuice.jpg', 15);
insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'pumpkinjuice.jpg', 16);
insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'pomegranatejuice.jpg', 17);
select *
from product_images;

commit;

select *
from product;

delete product_images where pimgnum=27;

select *
from product_images;

select *
from product_package;

---- 패키지 -> 물/주스


-- 1. 패키지있는 주스
insert into product_package(pacnum, pacname, paccontents,  pacimage)
values(seq_product_Package_pacnum.nextval
, '[자연마을] 과일 주스 8종'
, '과일의 풍부한 영양 성분을 쉽고 간편하게 누릴 수 있는 주스. 아이에게 직접 신선한 주스를 만들어주고 싶지만, 만들기가 번거롭죠. 
컬리는 과일 그대로를 착즙한 자연마을 과일주스 8종을 가져왔어요. 
컬리에서 판매되고 있는 다양한 종류의 국내산 과일을 공급해주는 자연마을에서 만든 제품이에요. 
농축 과즙을 사용한 주스가 아닌, 식품 첨가물은 물론 정제수도 넣지 않은 착즙 주스랍니다. 
원상태의 과일을 착즙한 뒤, 비타민이나 효소 등이 파괴되지 않을 정도로 순간 살균 과정만 거쳐 과일 고유의 맛과 향을 그대로 즐길 수 있어요. 
먹기 편한 스파우트 파우치로 휴대하기도 불편함이 없으며, 용량도 100ml로 아이가 마시기 적당해요. 
그냥 마셔도 맛있지만, 냉동실에 얼리면 시원한 샤베트로 즐길 수 있어요.'
, 'fruitjuice2.jpg' );

update product_package set pacnum=4 where pacnum=6;
commit;


insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point, pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '[자연마을] 과일 주스 8종', '물/주스', '식사대용/간식용', 'NEW', '없음', '[자연마을] 배도라지 주스 1팩', 1400, 990, 99, 100, '엄선된 배를 껍질째 통째로 착즙하고, 도라지를 사용한 제품 유통기한 : 2019년 11월 26일까지', '자연마을', 100);

commit;

insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point, pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '[자연마을] 과일 주스 8종', '물/주스', '식사대용/간식용', 'NEW', '없음', '[자연마을] 포도주스 1팩', 1400, 990, 99, 100, '엄선된 국내산 포도를 그대로 착즙하여 원물의 영양 파괴를 최소화한 제품 유통기한 : 2019년 11월 26일까지', '자연마을', 100);

insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point, pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '[자연마을] 과일 주스 8종', '물/주스', '식사대용/간식용', 'NEW', '없음', '[자연마을] 감귤주스 1팩', 1400, 990, 99, 100, '무농약 인증을 받은 제주도 감귤을 그대로 착즙하여 원물의 영양 파괴를 최소화한 제품 유통기한 : 2019년 11월 26일까지', '자연마을', 100);

insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point, pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '[자연마을] 과일 주스 8종', '물/주스', '식사대용/간식용', 'NEW', '없음', '[자연마을] 배 주스 1팩', 1400, 990, 99, 100, '엄선된 국내산 배를 그대로 착즙하여 원물의 영양 파괴를 최소화한 제품 유통기한 : 2019년 11월 26일까지', '자연마을', 100);

insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point, pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '[자연마을] 과일 주스 8종', '물/주스', '식사대용/간식용', 'NEW', '없음', '[자연마을] 딸기 주스 1팩', 1400, 990, 99, 100, '무농약 인증을 받은 딸기를 저온 추출액 공법으로 추출하여 원물의 영양 파괴를 최소화한 제품. 유통기한 : 2019년 11월 26일까지', '자연마을', 100);

insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point, pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '[자연마을] 과일 주스 8종', '물/주스', '식사대용/간식용', 'NEW', '없음', '[자연마을] 사과당근 주스 1팩', 1400, 990, 99, 100, '엄선된 사과와 당근을 그대로 착즙하여 원물의 영양 파괴를 최소화한 제품 유통기한 : 2019년 11월 26일까지', '자연마을', 100);

insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point, pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '[자연마을] 과일 주스 8종', '물/주스', '식사대용/간식용', 'NEW', '없음', '[자연마을] 사과 주스 1팩', 1400, 990, 99, 100, '엄선된 국내산 사과를 그대로 착즙하여 원물의 영양 파괴를 최소화한 제품 유통기한 : 2019년 11월 26일까지', '자연마을', 100);

insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point, pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '[자연마을] 과일 주스 8종', '물/주스', '식사대용/간식용', 'NEW', '없음', '[자연마을] 사과아로니아 주스 1팩', 1400, 990, 99, 100, '엄선된 국내산 사과와 무농약 인증을 받은 아로니아를 그대로 착즙하여 원물의 영양 파괴를 최소화한 제품 유통기한 : 2019년 11월 26일까지', '자연마을', 100);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice1.jpg', 18);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice2.jpg', 18);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice3.jpg', 18);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice4.jpg', 18);


insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice1.jpg', 19);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice2.jpg', 19);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice3.jpg', 19);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice4.jpg', 19);


insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice1.jpg', 20);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice2.jpg', 20);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice3.jpg', 20);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice4.jpg', 20);



insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice1.jpg', 21);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice2.jpg', 21);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice3.jpg', 21);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice4.jpg', 21);



insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice1.jpg', 22);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice2.jpg', 22);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice3.jpg', 22);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice4.jpg', 22);




insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice1.jpg', 23);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice2.jpg', 23);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice3.jpg', 23);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice4.jpg', 23);



insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice1.jpg', 24);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice2.jpg', 24);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice3.jpg', 24);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice4.jpg', 24);


insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice1.jpg', 25);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice2.jpg', 25);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice3.jpg', 25);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'fruitjuice4.jpg', 25);


commit;

select *
from product;

select *
from product_images;

select *
from product_package;

-- 2. 패키지 없는 물
insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point, pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '없음', '물/주스', '식사대용/간식용', 'BEST', '없음', '[미네랄워터] 딥스 해양심층수 2L', 2000, 1800, 180, 100, '5대 영양소의 하나인 천연 미네랄이 풍부한 딥스 해양심층수', '(주)글로벌심층수', 2000);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'water1.jpg', 26);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'water2.jpg', 26);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'water3.jpg', 26);



-- 3. 패키지없는 오렌지 주스

insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point, pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '없음', '물/주스', '다이어트용', 'HIT', '없음', '[콜린스그린] 더 오렌지', 18000, 15600, 1560, 100, '물 한방울 넣지 않고 순수한 오렌지 과육을 짜낸 100% 착즙 오렌지 주스 유통기한 : 수령일로부터 2~3일까지 ', '콜린스그린', 1000);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'orangejuice1.jpg', 27);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'orangejuice2.jpg', 27);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'orangejuice3.jpg', 27);




-- 4. 패키지없는 델몬트 푸룬 주스 


insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point, pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '없음', '물/주스', '채식주의자용', 'HIT', '없음', '[델몬트] 프룬주스', 10000, 8500, 850, 100, '말린 서양 자두를 뜻하는 프룬은 식이섬유, 비타민, 철분을 풍부하게 함유하고 있어요. 
이번에 컬리는 자두의 영양을 통째로 담은 델몬트의 프룬 주스를 가져왔답니다. 
이 제품은 120년 전통의 글로벌 과일 브랜드 델몬트가 과육이 실하고 당도가 높은 서양 자두를 엄선하여 만든 것이에요. 
보존료, 설탕, 감미료 등 식품첨가물을 일절 넣지 않고 말린 자두(프룬)와 물만 푹 끓여서 얻은 100% 과일 주스이지요. 
델몬트 프룬 주스를 한 입 마셔보면, 인공적인 달콤함 대신 과일 본연의 달콤하고 싱그러운 풍미를 생생하게 느낄 수 있답니다. 
이제 상쾌하게 아침을 시작할 때, 식후에 입가심할 때, 델몬트의 프룬 주스를 마셔보세요. 
900ml가 넘는 넉넉한 양이기 때문에 냉장고에 두고 온 가족이 함께 나눠 마시기에도 좋을 거예요.
보관방법 : 직사광선을 피하고 서늘한 곳에 보관. 개봉 후에는 반드시 냉장보관하시고 가급적 빨리 드시기 바랍니다.', '델몬트', 946);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'prunejuice1.jpg', 28);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'prunejuice2.jpg', 28);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'prunejuice3.jpg', 28);


commit;

select *
from product;

select *
from product_images;

select *
from product_package;


-- 5. 패키지 없는 귀리음료

insert into product(pnum, fk_pacname, fk_sdname, fk_ctname, fk_stname, fk_etname, pname, price, saleprice, point, pqty, pcontents, pcompanyname, weight)
values(seq_product_pnum.nextval, '없음', '물/주스', '채식주의자용', 'NEW', '없음', '[서강유업] 오트밸리', 4000, 3500, 350, 100, '식물성 우유는 우유처럼 흰빛을 띠고 우유의 역할을 대신하는 식품으로 주목받고 있어요. 
특히 다양한 이유로 우유를 섭취하지 못하는 분들이 이 식물성 우유를 즐겨 찾으실 텐데요. 
식물성 우유의 재료로 많이 쓰이는 귀리는 식이섬유가 많고 맛이 고소해 음료로 만들면 남녀노소가 잘 마실 수 있는 곡물이죠. 
30년이 넘는 세월 동안 정직하게 식품을 만들어온 서강유업 또한 귀리 음료를 선보입니다. 
캐나다산 귀리를 사용한 오트밸리 오트밀크에는 귀리 특유의 고소한 맛과 향이 잘 담겨 있어요. 
콜레스테롤과 포화지방이 없고 식품첨가물이 들어가지 않아 유당 분해가 어려운 아이에게 주셔도 좋습니다. 
아이부터 어른까지, 온 가족이 아침마다 한 잔씩 나누어보세요. 부담 없고 든든한 하루를 시작하실 수 있을 거예요.', '서강유업', 1000);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'oatmilk1.jpg', 29);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'oatmilk2.jpg', 29);

insert into product_images(pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval, 'oatmilk3.jpg', 29);


commit;

----------------------------'DIY', '야채/곡류----------------------------------------------
insert into product_package(pacnum, pacname, paccontents,  pacimage)
values(seq_product_Package_pacnum.nextval
, '무농약 간편 샐러드 6종'
, '짙은 녹색의 잎채소는 식이섬유부터 미네랄, 철분, 비타민, 엽산 등 각종 영양분이 풍부한데요. 잎채소의 영양분을 효과적으로 섭취하는 방법은 무엇일까요? 익히지 않고 생으로 먹는 것이죠. 컬리가 여러분의 건강을 위해 간편하게 즐길 수 있는 샐러드를 준비했습니다. 조금씩 다른 맛과 생김새, 영양분을 가진 잎채소를 한 팩으로 만나보세요.'
, '1470792312213l0.jpg' );
--1
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'무농약 간편 샐러드 6종','야채/곡류','다이어트용','NEW','크리스마스 이벤트','손질 로메인 40g(1,800원)',2000,1800,180,10
,'로마시대 로마인들이 즐겨 먹던 상추라고 하여 이름이 붙은 로메인은 상추과의 채소지만 상추와 달리 쓴맛이 적고 씹는 맛이 아삭해 식감이 뛰어납니다. 겉잎은 약간 쓴맛이 나고 안쪽의 잎들은 더 달고 향긋합니다.'
,'농업회사법인 미래원(주)',default,'로메인상추'
,40,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'gv40000001409_1.jpg', 30);


insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'무농약 간편 샐러드 6종','야채/곡류','다이어트용','NEW','크리스마스 이벤트','손질 그린믹스 40g(1,800원)',2000,1800,180,default
,'다양한 종류만큼 제각기 다른 맛을 가진 잎채소들. 이 때문에 어떤 채소들을, 어떻게 믹스할까 고민이 되곤 하는데요. 컬리는 약간의 단맛과 쌉쌀함이 어우러지게끔 로메인, 적근대, 치커리를 하나로 모았어요. 샐러드 한 팩으로 다양한 잎채소의 조화를 즐겨보세요.'
,'농업회사법인 미래원(주)',default,'로메인상추,적근대,치커리'
,40,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'gv00000001408_1.jpg', 31);

insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'무농약 간편 샐러드 6종','야채/곡류','다이어트용','NEW','크리스마스 이벤트','손질 양상추 60g(1,850원)',2100,1850,185,default
,'우리에게 너무나도 친숙하고 익숙한 채소인 양상추는 진한 맛이나 향은 없지만 수분이 전체의 94~95%를 차지하고 있어 싱그러움이 그대로 전해집니다. 날로 먹어야 영양 손실을 막을 수 있으므로 샌드위치나 샐러드를 만들어 먹는 것이 좋아요. 아삭하게 씹는 맛도 좋아 샐러드엔 빠지지 않고 들어가는 채소지요.'
,'농업회사법인 미래원(주)',default,'양상추'
,60,default,default,default);
insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'gv30000001410_1.jpg', 32);

insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'무농약 간편 샐러드 6종','야채/곡류','다이어트용','NEW','크리스마스 이벤트','손질 양배추+적채 80g (1,700원)',2000,1700,170,default
,'양배추와 적채 샐러드는 고기를 먹을 때 자주 곁들이죠. 붉은 양배추인 적채와 양배추는 익히면 무기질, 단백질, 탄수화물 등이 많이 손실되고 유황이라는 성분이 휘발성으로 변해 맛이 없어지기 때문에 생으로 먹는 것이 좋아요. 붉은 적자색을 가진 적채는 독특한 색깔 덕분에 샐러드를 더욱 맛깔스럽게 보이게 하죠. 꼭 샐러드가 아니어도 비빔밥이나 냉면의 고명, 김밥 재료로 활용해도 좋아요.'
,'농업회사법인 미래원(주)',default,'적채,양배추'
,80,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'gv10000001411_1.jpg', 33);
--5
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'무농약 간편 샐러드 6종','야채/곡류','다이어트용','NEW','크리스마스 이벤트','파프리카 슬라이스 100g (2,700원)',3000,2700,270,default
,'양배추와 적채 샐러드는 고기를 먹을 때 자주 곁들이죠. 붉은 양배추인 적채와 양배추는 익히면 무기질, 단백질, 탄수화물 등이 많이 손실되고 유황이라는 성분이 휘발성으로 변해 맛이 없어지기 때문에 생으로 먹는 것이 좋아요. 붉은 적자색을 가진 적채는 독특한 색깔 덕분에 샐러드를 더욱 맛깔스럽게 보이게 하죠. 꼭 샐러드가 아니어도 비빔밥이나 냉면의 고명, 김밥 재료로 활용해도 좋아요.'
,'농업회사법인 미래원(주)',default,'적채,양배추'
,100,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'gv40000001412_1.jpg', 34);
--6
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'무농약 간편 샐러드 6종','야채/곡류','다이어트용','NEW','크리스마스 이벤트','어린잎채소 믹스 40g (1,900원)',2500,1900,190,default
,'부드럽고 아기자기한 식감이 사랑스러운 샐러드입니다. 채소가 완전히 자라 성숙해지기 전 수확한 어린잎을 모은 것으로, 성장에 필요한 영양소를 응축하고 있는 것이 특징이에요. 떫은맛이 나지 않아 채소를 좋아하지 않는 사람들도 부담 없이 즐길 수 있습니다..'
,'농업회사법인 미래원(주)',default,'어린잎'
,40,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'gv40000001413_1.jpg', 35);

commit;



select *
from product;

select *
from product_images;

select *
from product_package;

---------------------- 'DIY', '과일'----------------------------------
insert into product_package(pacnum, pacname, paccontents,  pacimage)
values(seq_product_Package_pacnum.nextval
, '제주 무농약 노지 감귤 3종'
, '참바람이 불기 시작하면 귤의 계절입니다. 겨우내 이불속에서 티비와 함께 부족한 비타민을 충전하세요. 다른 과일에 비해 귤은 친환경으로 재배한 것이 맛이 월등히 좋답니다.'
, '1510036387296l0.jpg' );
--1
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'제주 무농약 노지 감귤 3종','과일','식사대용/간식용','BEST','연말 이벤트','제주 무농약 노지 감귤 800g(4,900원)',5000,4900,490,default
,'참바람이 불기 시작하면 귤의 계절입니다. 겨우내 이불속에서 티비와 함께 부족한 비타민을 충전하세요. 다른 과일에 비해 귤은 친환경으로 재배한 것이 맛이 월등히 좋답니다.'
,'자연마을',default,'감귤'
,800,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'111.jpg', 36);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'7f7322460c4afb3ed2a4.jpg', 36);
--2
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'제주 무농약 노지 감귤 3종','과일','식사대용/간식용','BEST','연말 이벤트','제주 무농약 노지 감귤 2kg(10,800원)',11000,10800,1080,default
,'참바람이 불기 시작하면 귤의 계절입니다. 겨우내 이불속에서 티비와 함께 부족한 비타민을 충전하세요. 다른 과일에 비해 귤은 친환경으로 재배한 것이 맛이 월등히 좋답니다.'
,'자연마을',default,'감귤'
,2000,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'222.jpg', 37);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'7f7322460c4afb3ed2a45.jpg', 37);
--3
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'제주 무농약 노지 감귤 3종','과일','식사대용/간식용','BEST','연말 이벤트','제주 무농약 점보 감귤 1kg(4,400원)',5000,4400,440,default
,'참바람이 불기 시작하면 귤의 계절입니다. 겨우내 이불속에서 티비와 함께 부족한 비타민을 충전하세요. 다른 과일에 비해 귤은 친환경으로 재배한 것이 맛이 월등히 좋답니다.'
,'자연마을',default,'감귤'
,1000,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'333.jpg', 38);
-------------------------'고기/달걀'-------------------------------
---------------------------------------------------------------
insert into product_package(pacnum, pacname, paccontents,  pacimage)
values(seq_product_Package_pacnum.nextval
, '[백년백계] 닭 안심살'
, '고소하고 담백한 맛은 물론 몸에 좋은 영양소가 다량 함유되어 누구나 부담 없이 즐길 수 있는 만인의 고기, 닭고기! 고단백 저칼로리 식품으로 잘 알려져 영양식에 빼놓을 수 없는 익숙한 식품이죠. 부위 별로 각기 다른 맛과 식감 덕분에, 취향별로 골라 먹기도 좋은데요. 그중에서도 뼈를 발라낼 필요 없이 꽉 찬 살코기가 있는 부위를 즐기는 분들을 위해, 먹기 좋게 손질한 닭 안심살을 준비했어요. 끓는 물에 잠깐 데쳐서 간단하게 샐러드에 곁들이는 것부터 살짝 구워 먹기 좋게 썰어 볶음밥 재료까지 다양하게 활용 가능한 닭 안심살로 푸짐한 한 끼 식사를 차려보세요!'
, '1472727892110l0.jpg' );


insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'[백년백계] 닭 안심살','고기/달걀','식사대용/간식용','BEST','연말 이벤트','무항생제 친환경 닭고기 닭 안심살 (300g)',5000,4100,410,default
,'고소하고 담백한 맛은 물론 몸에 좋은 영양소가 다량 함유되어 누구나 부담 없이 즐길 수 있는 만인의 고기, 닭고기! 고단백 저칼로리 식품으로 잘 알려져 영양식에 빼놓을 수 없는 익숙한 식품이죠. 부위 별로 각기 다른 맛과 식감 덕분에, 취향별로 골라 먹기도 좋은데요. 그중에서도 뼈를 발라낼 필요 없이 꽉 찬 살코기가 있는 부위를 즐기는 분들을 위해, 먹기 좋게 손질한 닭 안심살을 준비했어요. 끓는 물에 잠깐 데쳐서 간단하게 샐러드에 곁들이는 것부터 살짝 구워 먹기 좋게 썰어 볶음밥 재료까지 다양하게 활용 가능한 닭 안심살로 푸짐한 한 끼 식사를 차려보세요!'
,'(주)체리부로',default,'닭'
,300,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'gv00000001159_1.jpg', 39);

---------------------------'생선'------------------------------------
insert into product_package(pacnum, pacname, paccontents,  pacimage)
values(seq_product_Package_pacnum.nextval
, '[Sea to Table] FROYA SALMON 노르웨이 생연어 2종'
, '연어는 어떻게 자르냐에 따라 그 식감과 풍미가 달라지는 대표적인 생선 중 하나예요. 이번에 소개하는 FROYA SALMON은 내가 원하는 두께로 직접 잘라 즐길 수 있는 냉장 생연어입니다. 노르웨이의 청정한 바다에서 연어를 어획한 후 곧바로 부위별로 손질하고 포장했지요. 이 모든 과정을 완수하는데 걸리는 시간은 2시간 이내. 이처럼 신선한 연어를 컬리는 항공편을 이용해 고이 모셔왔습니다. 

포장 후 공기중으로 노출되는 시간이 전혀 없고 단 한번의 냉동 과정 없이 까다롭게 들어온 연어이기 때문에 탄력 있고 탱탱한 조직을 그대로 유지하고 있어요. 한 입 먹어보면, 연어 본연의 고소한 맛이 잘 살아있다는 것을 느끼실 수 있을 거예요. FROYA SALMON의 연어는 슬라이스 되지 않은 필렛(통살) 형태이기 때문에 썰어서 싱그러운 회로 즐기면 더할 나위 없고 고급 연어 스테이크로 활용해도 손색이 없답니다.'
, '153925309868l0.jpg' );

--1
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'[Sea to Table] FROYA SALMON 노르웨이 생연어 2종','생선','식사대용/간식용','HIT','연초 이벤트','[Sea to Table]FROYA SALMON 노르웨이 연어 뱃살 800g(17,800원)',19000,17800,1780,default
,'포장 후 공기중으로 노출되는 시간이 전혀 없고 단 한번의 냉동 과정 없이 까다롭게 들어온 연어이기 때문에 탄력 있고 탱탱한 조직을 그대로 유지하고 있어요. 한 입 먹어보면, 연어 본연의 고소한 맛이 잘 살아있다는 것을 느끼실 수 있을 거예요. FROYA SALMON의 연어는 슬라이스 되지 않은 필렛(통살) 형태이기 때문에 썰어서 싱그러운 회로 즐기면 더할 나위 없고 고급 연어 스테이크로 활용해도 손색이 없답니다.'
,'블루씨푸드',default,'연어'
,300,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'gv30000033309_1.jpg', 40);

--2
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'[Sea to Table] FROYA SALMON 노르웨이 생연어 2종','생선','식사대용/간식용','HIT','연초 이벤트','[Sea to Table]FROYA SALMON 노르웨이 연어 등살 180g(13,0000원)',15000,13000,1300,default
,'포장 후 공기중으로 노출되는 시간이 전혀 없고 단 한번의 냉동 과정 없이 까다롭게 들어온 연어이기 때문에 탄력 있고 탱탱한 조직을 그대로 유지하고 있어요. 한 입 먹어보면, 연어 본연의 고소한 맛이 잘 살아있다는 것을 느끼실 수 있을 거예요. FROYA SALMON의 연어는 슬라이스 되지 않은 필렛(통살) 형태이기 때문에 썰어서 싱그러운 회로 즐기면 더할 나위 없고 고급 연어 스테이크로 활용해도 손색이 없답니다.'
,'블루씨푸드',default,'연어'
,180,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'gv30000033313_1.jpg', 41);
--3
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'[Sea to Table] FROYA SALMON 노르웨이 생연어 2종','생선','식사대용/간식용','HIT','연초 이벤트','락교(1,500원)',1500,1500,150,default
,'포장 후 공기중으로 노출되는 시간이 전혀 없고 단 한번의 냉동 과정 없이 까다롭게 들어온 연어이기 때문에 탄력 있고 탱탱한 조직을 그대로 유지하고 있어요. 한 입 먹어보면, 연어 본연의 고소한 맛이 잘 살아있다는 것을 느끼실 수 있을 거예요. FROYA SALMON의 연어는 슬라이스 되지 않은 필렛(통살) 형태이기 때문에 썰어서 싱그러운 회로 즐기면 더할 나위 없고 고급 연어 스테이크로 활용해도 손색이 없답니다.'
,'블루씨푸드',default,'락교'
,120,default,default,default);


insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'aaaa1234.jpg', 42);


--------------------------'소스'------------------------------------
insert into product_package(pacnum, pacname, paccontents,  pacimage)
values(seq_product_Package_pacnum.nextval
, '[아비포트] 아보카도 오일 드레싱 3종'
,'전 세계에 퍼져 있는 아보카도는 무려 100여 종! 이렇게 다양한 아보카도 중 우리가 주로 섭취하는 아보카도는 바로 하스(Hass) 종입니다. 하스 아보카도는 미국 남부 캘리포니아에서 루돌프 하스가 처음 육종 및 대량 재배에 성공해 그 이름을 얻었으며, 맛이 좋기로 유명해 사시사철 사랑받고 있죠. 부드러운 과육은 지방 함량이 높아 열량도 높지만, 이 지방의 대부분은 우리 몸의 건강을 유지하는 데에 도움이 되는 불포화지방산이라 아보카도는 대표적인 슈퍼푸드로도 손꼽히는데요. 아비포트는 Hass 품종의 아보카도를 냉압착하여 품질이 좋은 아보카도 오일을 얻은 뒤 이 오일로 맛있는 드레싱을 만들었습니다.'
, '1531731343385l0.jpg' );



--1
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'[아비포트] 아보카도 오일 드레싱 3종','소스','채식주의자용','NEW','연초 이벤트','[아비포트]가든허브 (6,600원)',7000,6600,660,default
,'테이스팅 노트 : 허브의 멋진 풍미는 언제나 야채와 좋은 궁합을 이루죠. 고소하고도 향긋한 드레싱이라 두루두루 사용하시기에 좋아요.'
,'HINKLE FINE FOODS',default,'아보카도,마늘'
,237,default,default,default);


insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'oil1.jpg', 43);
--2
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'[아비포트] 아보카도 오일 드레싱 3종','소스','채식주의자용','NEW','연초 이벤트','[아비포트]베이컨 발사믹 (6,600원)',7000,6600,660,default
,'테이스팅 노트 : 발사믹의 새콤하면서도 깊은 맛에 구운 베이컨의 향이 은은하게 더해져 색다른 맛으로 즐길 수 있어요.'
,'HINKLE FINE FOODS',default,'베이컨'
,237,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'oil2.jpg', 44);
--3
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'[아비포트] 아보카도 오일 드레싱 3종','소스','채식주의자용','NEW','연초 이벤트','[아비포트]   갈릭 시트러스 (6,600원)',7000,6600,660,default
,'테이스팅 노트 : 아보카도 오일 특유의 고소한 맛에 마늘의 향긋함, 시트러스의 상큼함이 절묘하게 어우러집니다.'
,'HINKLE FINE FOODS',default,'아보카도,레몬'
,237,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'oil3.jpg', 45);

----------------------'유제품'-----------------------------------------
insert into product_package(pacnum, pacname, paccontents,  pacimage)
values(seq_product_Package_pacnum.nextval
, '[상하목장] 유기농 우유'
,'유네스코 생물권 보전지역으로 지정된 청정한 고창, 너른 들과 깨끗한 바람 속에 행복한 젖소가 자랍니다. 하늘과 땅의 기운을 정직하게 담아내는 상하목장의 우유에는 그 행복이 깃들어 있지요. 목장주들은 매일 영농일지를 쓰며 소들의 먹이와 물 하나까지도 소홀히 하지 않습니다. 미세한 필터로 유해 미생물을 99.9% 걸러내는 마이크로필터 공법을 사용해 온도와 시간에 민감한 우유를 더 깨끗하게 담아냈죠. 천혜의 환경에서 행복하게 만들어진 우유는 아이의 간식으로도, 바쁜 아침의 든든한 식사로도 좋습니다. 상하목장의 유기농 우유와 저지방 우유로 몸도 마음도 건강하게 챙겨보세요.'
, '1502350543293l0.jpg' );

--1
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'[상하목장] 유기농 우유','유제품','식사대용/간식용','NEW','연초 이벤트','유기농 우유 750ml(4,300원)',4500,4300,430,default
,'상하목장 유기농 우유에는 고소한 향과 맛은 물론 영양성분까지 풍부합니다. 전용 목장에서 집유한 유기농 우유에는 갓 짜낸 우유의 신선함이 고스란히 담겨있죠. 유기농 우유 한 컵으로 행복한 자연의 맛 그대로를 음미해보세요'
,'매일유업',default,'우유'
,750,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'milk1.jpg', 46);

--2
insert into product(pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pcompanyname,pexpiredate,allergy,weight,salecount,plike,pdate)
values(seq_product_pnum.nextval,'[상하목장] 유기농 우유','유제품','식사대용/간식용','NEW','연초 이벤트','유기농 저지방우유 750ml(4,400원)',4500,4300,430,default
,'우유의 지방함량이 부담스러웠던 분들은 저지방 우유를 선택해보세요. 지방함량은 줄이고, 우유의 풍성한 영양성분은 그대로 담아낸 유기농 저지방 우유는 가볍고 깔끔한 맛을 자랑합니다.'
,'매일유업',default,'우유'
,750,default,default,default);

insert into product_images (pimgnum, pimgfilename, fk_pnum)
values(seq_product_images_pimgnum.nextval,'milk2.jpg', 47);
--------------------------------------------------------------------------------




select *
from product
order by pnum asc;


select *
from product_images
order by pimgnum asc;

select *
from product_package
order by pacnum asc;

commit;

 select *
 from member;
 
 drop table login purge;
 update member set pw ='qwer1234$' where userid='leess';
 alter table member add(pw varchar2(200));
 alter table member modify(pw varchar2(200) not null); 

select min(saleprice),pacnum,pacname
from (
    select pacnum,pacname,paccontents,pacimage,saleprice,point
    from product_package A join product B
    on A.pacname = B.fk_pacname
    where pacname = '[퀸즈프레시] 프리미엄 샐러드 3종'
);

select *
from product_package;
select*
from product; 
select *
from event_tag;

select *
from (select saleprice,fk_pacname,pacimage
from product_package A join 
(
    select min(saleprice) AS saleprice,fk_pacname,etname
    from (
        select fk_pacname,price,B.etname,saleprice
        from product A join event_tag B
        on A.fk_etname = B.etname
    )
    group by fk_pacname
    having fk_pacname like '[퀸즈프레시] 프리미엄 샐러드 3종'
)C
on C.fk_pacname = A.pacname );

--select *
--from product
--where fk_pacname like '[퀸즈프레시] 프리미엄 샐러드 3종
--where 
--union all
--select *
--from event_tag
--where fk_pacname like '[퀸즈프레시] 프리미엄 샐러드 3종';
--sleelct *
--from product; 

--select saleprice,fk_pacname,pacimage
--from product_package A join 
--(
--    select min(saleprice) AS saleprice,fk_pacname
--    from (
--        select fk_pacname,price,etname,saleprice
--        from product A join event_tag B
--        on A.fk_etname = B.etname
--    )
--    group by fk_pacname
--    having fk_pacname like '[퀸즈프레시] 프리미엄 샐러드 3종'
--)C
--on C.fk_pacname = A.pacname; 

select min(saleprice),fk_etname
from product 
group by fk_etname;
where fk_etname like '크리스마스 이벤트' ; 


select *
from product;
-- product테이블 event_tag 테이블 뷰 --
create or replace view product_event
as
select pnum,fk_pacname,fk_sdname,fk_ctname,fk_stname,fk_etname,pname,price,saleprice,point,pqty,pcontents,pexpiredate,allergy,weight,salecount,plike,pdate,etnum,etname,etimagefilename
from product A join event_tag B
on A.fk_etname = B.etname
order by pnum;

--------------------

select salapriceRank, saleprice,fk_pacname,pacimage,fk_stname
    from 
(
    select row_number() over(order by saleprice) AS salapriceRank, saleprice,fk_pacname,pacimage,fk_stname
    from 
    (
        select C.pnum,fk_pacname,C.saleprice,C.fk_sdname,C.fk_ctname,C.fk_stname,C.fk_etname,C.pname,C.price,C.point,C.pqty,C.pcontents,C.pexpiredate,C.allergy,C.weight,C.salecount,C.plike,C.pdate,C.fk_etname
                   ,D.pacnum,D.paccontents,D.pacimage
            from (
                select A.pnum,A.pname,A.fk_pacname,A.fk_sdname,A.fk_ctname,A.fk_stname,A.fk_etname,A.price,A.saleprice,A.point,A.pqty,A.pcontents,A.pexpiredate,A.allergy,A.weight,A.salecount,A.plike,A.pdate,B.etnum,B.etname,B.etimagefilename
                from product A join event_tag B
                on A.fk_etname = B.etname
                where B.etname='크리스마스 이벤트' 
                order by pnum
            )C join product_package D
        on C.fk_pacname = D.pacname
        where fk_pacname = '[자연마을] 과일 주스 8종'
    )
)
where salapriceRank = 1;


----------------------------------
    select fk_pacname,saleprice,pacimage,fk_stname
    from 
        (   
            select fk_pacname, min(saleprice) AS saleprice
            from 
                (
                select row_number() over(order by saleprice) AS salapriceRank, saleprice,fk_pacname,pacimage
                from 
                (
                    select C.pnum,fk_pacname,C.saleprice,C.fk_sdname,C.fk_ctname,C.fk_stname,C.fk_etname,C.pname,C.price,C.point,C.pqty,C.pcontents,C.pexpiredate,C.allergy,C.weight,C.salecount,C.plike,C.pdate,C.fk_etname
                               ,D.pacnum,D.paccontents,D.pacimage
                        from (
                            select A.pnum,A.pname,A.fk_pacname,A.fk_sdname,A.fk_ctname,A.fk_stname,A.fk_etname,A.price,A.saleprice,A.point,A.pqty,A.pcontents,A.pexpiredate,A.allergy,A.weight,A.salecount,A.plike,A.pdate,B.etnum,B.etname,B.etimagefilename
                            from product A join event_tag B
                            on A.fk_etname = B.etname
                            where B.etname='크리스마스 이벤트' 
                            order by pnum
                        )C join product_package D
                    on C.fk_pacname = D.pacname
                )
            )
            group by fk_pacname          
        )A join product_package B
        on A.fk_pacname = B.pacname;

-------------------------

select *
from product;
commit;

select rnum, pacnum, pacname, paccontents, pacimage, pnum 
        , sdname, ctname, stname, etname, pname, price
        , saleprice, point, pqty, pcontents
        , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate 
 from
 (
    select rownum as rnum,pacnum, pacname, paccontents, pacimage, pnum 
            , sdname, ctname, stname, etname, pname, price 
            , saleprice, point, pqty, pcontents 
            , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate 
    from view_Product 
        where stname = 'NEW' and pacname != '없음' 
        order by rnum asc, pname asc 
 ) F;
 
 create or replace view view_Product 
 as
   select pacnum, pacname, paccontents, pacimage, pnum
                    , sdname, ctname, stname, etname, pname, price
                    , saleprice, point, pqty, pcontents
                    , pcompanyname, pexpiredate, allergy, weight, salecount, plike, pdate
            from
            (
                select row_number() over(partition by pacnum order by saleprice) as rno
                    , b.pacnum, b.pacname, b.paccontents, b.pacimage, a.pnum
                    , fk_sdname as sdname, a.fk_ctname as ctname, a.fk_stname as stname, a.fk_etname as etname
                    , a.pname, a.price, a.saleprice, a.point, a.pqty, a.pcontents
                    , a.pcompanyname, a.pexpiredate, allergy, a.weight, a.salecount, a.plike, a.pdate
                from product a JOIN product_package b
                ON a.fk_pacname = b.pacname
            ) V
            where rno = 1 and pacnum != 1
            union all
            select pacnum, pacname, paccontents, pimgfilename, pnum
                    , sdname, ctname, stname, etname, pname
                    , price, saleprice, point, pqty, pcontents
                    , pcompanyname, pexpiredate, allergy, weight, salecount
                    , plike, pdate
            from
            (
                select row_number() over(partition by pname order by saleprice) as rno
                        , b.pacnum, b.pacname, b.paccontents, b.pacimage, pnum
                        , fk_sdname AS sdname, a.fk_ctname AS ctname, a.fk_stname AS stname, a.fk_etname AS etname, a.pname
                        , a.price, a.saleprice, a.point, a.pqty, a.pcontents
                        , a.pcompanyname, a.pexpiredate, allergy, a.weight, a.salecount
                        , a.plike, a.pdate, c.pimgfilename
                from product a JOIN product_package b
                ON a.fk_pacname = b.pacname
                JOIN product_images c
                ON a.pnum = c.fk_pnum
                where pacnum = 1
            ) V
            where rno = 1;
 ------------------------------------------------------------------------------------
