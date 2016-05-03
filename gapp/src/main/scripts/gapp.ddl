
    alter table application 
        drop constraint FK_q15f0mjpmaitbwddmbbwtl9r9;

    alter table application 
        drop constraint FK_it8j3sr99x5000u9tgtac4f39;

    alter table application 
        drop constraint FK_lxjhsiuc5qb6n6t4frvxioxvk;

    alter table application 
        drop constraint FK_8chnccp3mdmdfudiaj430xw94;

    alter table edu_background 
        drop constraint FK_j5uuxoqcbl0p3h10kbj1v54dd;

    alter table extra_record_field 
        drop constraint FK_1r1rjw1xprww9up243sab62te;

    alter table extra_record_field 
        drop constraint FK_83bojlvl4txvqrksftjt5hsrm;

    alter table extra_records 
        drop constraint FK_dnkrpmd9ifwa451uyuay12t9x;

    alter table gappuser 
        drop constraint FK_lpj607q25o5d2qhhsjifnywek;

    alter table log 
        drop constraint FK_1q657dbmfdx5ch4affttbgq5g;

    alter table log 
        drop constraint FK_ksay7bebk5ynt143hjku4yhd7;

    alter table programs 
        drop constraint FK_bvnv211p91vsohkggjqtvq7kx;

    drop table if exists application cascade;

    drop table if exists appstatus cascade;

    drop table if exists departments cascade;

    drop table if exists edu_background cascade;

    drop table if exists extra_record_field cascade;

    drop table if exists extra_records cascade;

    drop table if exists gappuser cascade;

    drop table if exists log cascade;

    drop table if exists programs cascade;

    drop table if exists role cascade;

    drop sequence hibernate_sequence;
