/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     2011-8-29 16:07:59                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AC_RESOURCE_TYPE') and o.name = 'FK_AC_RESOU_REFERENCE_AC_RESOU')
alter table AC_RESOURCE_TYPE
   drop constraint FK_AC_RESOU_REFERENCE_AC_RESOU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AC_RESOURCE_TYPE')
            and   type = 'U')
   drop table AC_RESOURCE_TYPE
go

/*==============================================================*/
/* Table: AC_RESOURCE_TYPE                                      */
/*==============================================================*/
create table AC_RESOURCE_TYPE (
   CODE                 varchar(20)          not null,
   NAME                 varchar(40)          null,
   DESCRIPTION          varchar(2000)        null,
   CATAGORY             smallint             null,
   OBJECT_PROVIDER      varchar(200)         null,
   DEPENDENT_RESOURCE   varchar(20)          null,
   constraint PK_AC_RESOURCE_TYPE primary key (CODE)
)
go

alter table AC_RESOURCE_TYPE
   add constraint FK_AC_RESOU_REFERENCE_AC_RESOU foreign key (DEPENDENT_RESOURCE)
      references AC_RESOURCE_TYPE (CODE)
go

