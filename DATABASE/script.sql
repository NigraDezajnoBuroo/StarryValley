create table sv_comment
(
    comment_id           int auto_increment
        primary key,
    content_id           int                           not null,
    comment_status       int                           null,
    comment_time         datetime                      not null,
    comment_text         text                          not null,
    comment_reply        int                           null,
    comment_ip           varchar(15) default '0.0.0.0' not null,
    comment_author_name  varchar(60)                   null,
    comment_author_email text                          null,
    comment_author_url   varchar(64)                   null,
    comment_author_uid   int                           null,
    comment_owner_uid    int                           null
);

create table sv_contents
(
    content_id                 int auto_increment
        primary key,
    content_name               text                 null,
    content_abstract           text                 null,
    content_create_time        datetime             null,
    content_modified_time      datetime             null,
    content_text               longtext             null,
    content_author             int                  null,
    content_status             int        default 0 not null,
    content_acpasswd           varchar(64)          null,
    content_comment_permission tinyint(1) default 1 null,
    content_rss                tinyint(1) default 1 null
);

create table sv_settings
(
    setting_name    varchar(32) not null,
    user_id         bigint      not null,
    setting_content text        null,
    primary key (setting_name, user_id),
    constraint sv_settings_setting_name_uindex
        unique (setting_name),
    constraint sv_settings_user_id_uindex
        unique (user_id)
);

create table sv_users
(
    user_id        bigint auto_increment
        primary key,
    username       varchar(20)  default ''                    not null,
    userpasswd     varchar(64)  default ''                    not null,
    user_fullname  varchar(100) default 'user_k'              null,
    user_url       varchar(64)  default 'www.bilibili.com'    null,
    user_email     varchar(64)  default 'someone@example.com' null,
    user_regdate   datetime                                   null,
    user_lastLogin datetime                                   null,
    constraint sv_users_user_email_uindex
        unique (user_email),
    constraint sv_users_user_fullname_uindex
        unique (user_fullname),
    constraint sv_users_username_uindex
        unique (username)
);


