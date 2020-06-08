create table buy_goods_data
(
    time      datetime null,
    name      char(20) null,
    id        int      null,
    goodsName char(20) null,
    category  char(20) null,
    price     float    null,
    number    int      null
);





create table goodsrecord
(
    time         datetime null,
    userName     char(20) null,
    goodsId      int      null,
    goodsName    char(20) null,
    operation    char(20) null,
    salesmanName char(20) null
);


create table login_data
(
    name      char(20) null,
    time      datetime null,
    ip        char(20) null,
    operation char(5)  null
);



create table record
(
    time      datetime not null,
    username  char(20) null,
    operation char(40) null,
    ip        char(20) null
);


create table salesman
(
    name     char(20) not null
        primary key,
    password char(20) null
);

create table goods
(
    id           int auto_increment
        primary key,
    name         char(20)      null,
    price        float         null,
    picture      char(100)     null,
    sales        int default 0 null,
    description  char(255)     null,
    category     char(20)      null,
    salesmanName char(20)      null,
    stock        int default 0 null,
    constraint goods_salesman_name_fk
        foreign key (salesmanName) references salesman (name)
            on delete cascade
);


create table user
(
    username char(20) not null
        primary key,
    password char(20) null,
    email    char(40) null
);



INSERT INTO pumpkin.user (username, password, email) VALUES ('admin', '123456', null);

create table `order`
(
    id   int auto_increment
        primary key,
    name char(20) null,
    date datetime null,
    constraint order_user_username_fk
        foreign key (name) references user (username)
);


create table order_goods
(
    oid    int      not null,
    gid    int      not null,
    number int      null,
    name   char(20) null,
    price  float    null,
    primary key (oid, gid),
    constraint order_goods_order_id_fk
        foreign key (oid) references `order` (id)
);
create table visit_goods_data
(
    datetime  datetime null,
    name      char(20) null,
    id        int      null,
    goodsName char(20) null,
    category  char(20) null,
    time      int      null
);

--
-- Dumping routines for database 'pumpkin'
--

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addSales`(IN gid int, IN temp_sales int)
begin
    declare temp int;
    select sales into temp from goods where id=gid;
    update goods
        set sales=temp+temp_sales
    where id=gid;
end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buyGoods`(in num int,in gid int)
begin



    declare temp int;

    select stock

        into temp

    from goods

        where id=gid;

    update goods

        set stock=temp-num

    where id=gid;



end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSalesman`(in sname char(20))
begin

    delete

        from salesman

            where name=sname;

end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EquiryOrder`(IN username char(20))
begin
    select id,`date`,gid,number,order_goods.name,price
        from `order`,order_goods
            where `order`.id=order_goods.oid and `order`.name=username;
end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `equiryOrderid`(in uname char(20),in dtime datetime)
begin

    select id from `order`

        where name=uname and date=dtime;

end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findAllBuyGoodsData`()
begin

    select * from buy_goods_data;

end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findAllGoodsRecord`(IN sname char(20))
begin
    select *
        from goodsrecord
            where salesmanName=sname;
end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findAllLoginData`()
begin

    select *

        from login_data;

end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findAllRecord`()
begin

    select * from record;

end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findAllSalesman`()
begin

    select *

        from salesman;

end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findAllVisitGoodsData`()
begin

    select *

        from visit_goods_data;

end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findGoodsRecord`(in gid int)
begin

    select *

        from goodsrecord

            where goodsId=gid;

end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findSalesman`(in sname char(20))
begin

    select *

        from salesman

            where name=sname;

end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertBuyGoodsData`(

in tm datetime,in nm char(20),in i int,

in gn char(20),in ctgr char(20),in pr float,in num int

)
begin

    insert into buy_goods_data

    values (tm,nm,i,gn,ctgr,pr,num);

end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGoods`(IN gname char(20), IN gprice float, IN gpicture char(255),
                                                   IN gdescription char(100), IN gcategory char(20),
                                                   IN gsalesmanName char(20), IN gstock int)
begin
        insert into goods (name,price,picture,description,category,salesmanName,stock)
        values (gname,gprice,gpicture,gdescription,gcategory,gsalesmanName,gstock);
        select id
            from goods
                where name=gname and price=gprice and picture=gpicture and
                      description=gdescription and category=gcategory and 
                      salesmanName=gsalesmanName and stock=gstock;
    end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertGoodsRecord`(IN tm datetime, IN uname char(20), IN gid int,
                                                         IN gname char(20), IN op char(20), IN sname char(20))
begin
        insert into goodsrecord
        values (tm,uname,gid,gname,op,sname);
    end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertLoginData`(in nam char(20),in tm datetime,in i char(20),in op char(5))
begin

    insert into login_data

    values (nam,tm,i,op);

end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertOrders`(IN username char(20), IN dtime datetime)
begin
    insert into `order`(name,date)
    values (username,dtime);
end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOrder_Goods`(IN oid int, IN gid int, IN number int, IN name char(20), IN price float)
begin
        insert order_goods
        values (oid,gid,number,name,price);
    end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertRecord`(IN dtime datetime, IN uname char(20), IN operation char(40),
                                                    IN ip char(20))
begin
insert into record
values (dtime,uname,operation,ip);
end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSalesman`(in sname char(20),in pw char(20))
begin

    insert into salesman

    values (sname,pw);

end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertVisitGoodsData`(IN dtm datetime, IN nm char(20), IN i int, IN gnm char(20),
                                                            IN ctgr char(20), IN tm int)
begin
    insert into visit_goods_data
    values (dtm,nm,i,gnm,ctgr,tm);
end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGoods`(IN gid int, IN gname char(20), IN gprice float,
                                                   IN gpicture char(100), IN gdescription char(255),
                                                   IN gcategory char(20), IN gstock int)
begin
        update goods
            set name=gname,price=gprice,picture=gpicture,description=gdescription,category=gcategory,stock=gstock
        where id=gid;
    end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSalesman`(in sname char(20),in pw char(20))
begin

    update salesman

        set password=pw

            where name=sname;

end ;;
DELIMITER ;

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `viewStock`(in gid int)
begin

    select stock

        from goods

            where id=gid;

end ;;
DELIMITER ;


-- Dump completed on 2020-06-07 12:20:34
