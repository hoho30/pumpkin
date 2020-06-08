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


create table user
(
    username char(20) not null
        primary key,
    password char(20) null,
    email    char(40) null
);

INSERT INTO pumpkin.user (username, password, email) VALUES ('admin', '123456', null);
create table visit_goods_data
(
    datetime  datetime null,
    name      char(20) null,
    id        int      null,
    goodsName char(20) null,
    category  char(20) null,
    time      int      null
);

