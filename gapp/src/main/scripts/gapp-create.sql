
    create table application (
        application_id int4 not null,
        cin int8,
        citizenship varchar(255) not null,
        dob timestamp not null,
        email varchar(255),
        fname varchar(255),
        gender boolean not null,
        lname varchar(255),
        phone int8 not null,
        submit_date varchar(255),
        term varchar(255) not null,
        toefl int4 not null,
        dept_dept_id int4,
        detail_user_id int4,
        program_prg_id int4,
        status_status_id int4,
        primary key (application_id)
    );

    create table appstatus (
        status_id int4 not null,
        status_name varchar(255),
        primary key (status_id)
    );

    create table departments (
        dept_id int4 not null,
        dept_name varchar(255) not null,
        enabled boolean not null,
        primary key (dept_id)
    );

    create table edu_background (
        ebid int4 not null,
        degree varchar(255),
        enabled boolean not null,
        filename varchar(255),
        gpa float4 not null,
        major varchar(255),
        minor varchar(255),
        time_period varchar(255),
        transcript bytea,
        university varchar(255),
        application_application_id int4,
        primary key (ebid)
    );

    create table extra_record_field (
        record_feild_id int4 not null,
        enabled boolean not null,
        feild_value varchar(255),
        fileupload bytea,
        fileupload_name varchar(255),
        application_application_id int4,
        extrarec_rec_id int4,
        primary key (record_feild_id)
    );

    create table extra_records (
        rec_id int4 not null,
        enabled boolean not null,
        rec_name varchar(255),
        rec_type varchar(255),
        required boolean not null,
        dept_dept_id int4,
        primary key (rec_id)
    );

    create table gappuser (
        user_id int4 not null,
        enabled boolean not null,
        firstname varchar(255) not null,
        lastname varchar(255),
        password varchar(255) not null,
        username varchar(255) not null,
        role_role_id int4,
        primary key (user_id)
    );

    create table log (
        log_id int4 not null,
        change_date timestamp,
        comment varchar(255),
        enabled boolean not null,
        application_application_id int4,
        user_user_id int4,
        primary key (log_id)
    );

    create table programs (
        prg_id int4 not null,
        enabled boolean not null,
        prg_name varchar(255),
        dept_dept_id int4,
        primary key (prg_id)
    );

    create table role (
        role_id int4 not null,
        role_name varchar(255),
        primary key (role_id)
    );

    alter table application 
        add constraint UK_jwe4yjwogktj1q4hallbbl97c unique (cin);

    alter table gappuser 
        add constraint UK_3f3g3m58f57s591xp0h8trssr unique (username);

    alter table application 
        add constraint FK_q15f0mjpmaitbwddmbbwtl9r9 
        foreign key (dept_dept_id) 
        references departments;

    alter table application 
        add constraint FK_it8j3sr99x5000u9tgtac4f39 
        foreign key (detail_user_id) 
        references gappuser;

    alter table application 
        add constraint FK_lxjhsiuc5qb6n6t4frvxioxvk 
        foreign key (program_prg_id) 
        references programs;

    alter table application 
        add constraint FK_8chnccp3mdmdfudiaj430xw94 
        foreign key (status_status_id) 
        references appstatus;

    alter table edu_background 
        add constraint FK_j5uuxoqcbl0p3h10kbj1v54dd 
        foreign key (application_application_id) 
        references application;

    alter table extra_record_field 
        add constraint FK_1r1rjw1xprww9up243sab62te 
        foreign key (application_application_id) 
        references application;

    alter table extra_record_field 
        add constraint FK_83bojlvl4txvqrksftjt5hsrm 
        foreign key (extrarec_rec_id) 
        references extra_records;

    alter table extra_records 
        add constraint FK_dnkrpmd9ifwa451uyuay12t9x 
        foreign key (dept_dept_id) 
        references departments;

    alter table gappuser 
        add constraint FK_lpj607q25o5d2qhhsjifnywek 
        foreign key (role_role_id) 
        references role;

    alter table log 
        add constraint FK_1q657dbmfdx5ch4affttbgq5g 
        foreign key (application_application_id) 
        references application;

    alter table log 
        add constraint FK_ksay7bebk5ynt143hjku4yhd7 
        foreign key (user_user_id) 
        references gappuser;

    alter table programs 
        add constraint FK_bvnv211p91vsohkggjqtvq7kx 
        foreign key (dept_dept_id) 
        references departments;

        create sequence hibernate_sequence minvalue 100;

    
INSERT  INTO role  VALUES(1,'administrator');
INSERT  INTO role VALUES(2,'staff');
INSERT  INTO role VALUES(3,'student');



INSERT into gappuser VALUES (1,true,'admin','','abcd','admin@localhost.localdomain',1);
INSERT into gappuser VALUES (2,true,'Joe','Tran','abcd','staff1@localhost.localdomain',2);
INSERT into gappuser VALUES (3,true,'Elly','Evran','abcd','staff2@localhost.localdomain',2);
INSERT into gappuser VALUES (4,true,'Jolly','Jordan','abcd','student1@localhost.localdomain',3);
INSERT into gappuser VALUES (5,true,'Michael','Mathew','abcd','student2@localhost.localdomain',3);


INSERT into departments VALUES (1,'Accounting',true); 
INSERT into departments VALUES (2,'Computer Science',true);

INSERT into programs VALUES (1,true,'MS in Accounting program',1);
INSERT into programs VALUES (2,true,'MS in Computer Science',2);
INSERT into programs VALUES (3,true,'MS in Finance',1);



INSERT into extra_records VALUES (1,true,'GMAT','Integer',true,1);
INSERT into extra_records VALUES (2,true,'LOR','File',true,1);
INSERT into extra_records VALUES (3,true,'GRE','Integer',true,2);
INSERT into extra_records VALUES (4,true,'Statement Of Purpose','File',true,2);

INSERT into appstatus VALUES (1,'new');
INSERT into appstatus VALUES (2,'Pending Review');
INSERT into appstatus VALUES (3,'Denied ');
INSERT into appstatus VALUES (4,'Recommend Admit');
INSERT into appstatus VALUES (5,'Recommend Admit w/ Condition');
INSERT into appstatus VALUES (6,'Submitted');
INSERT into appstatus VALUES (7,'Not Submitted');



INSERT INTO application VALUES (1,305064011,'Indian','11-05-1993','student1@localhost.localdomain','Jolly',False,'Jordan',3234038632,'11-10-2015','Fall2016',110,1,4,1,1);

INSERT into edu_background VALUES (1,'Bachelors in Accounting',true,'',4.0,'Finances','Economics','2 years','','University of Southern California',1);

INSERT into extra_record_field VALUES (1,true,690,'','',1,1);

INSERT INTO log VALUES (1,'11-11-2015','',true,1,1);

