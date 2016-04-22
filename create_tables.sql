prompt PL/SQL Developer import file
prompt Created on 2016��4��22�� by sinosoft
set feedback off
set define off
prompt Creating PRPMCLASS...
create table PRPMCLASS
(
  CLASSCODE    VARCHAR2(4) not null,
  OLDCLASSCODE VARCHAR2(255),
  CLASSCNAME   VARCHAR2(255) not null,
  CLASSSCNAME  VARCHAR2(255),
  CLASSTNAME   VARCHAR2(255),
  CLASSENAME   VARCHAR2(255),
  CLASSSENAME  VARCHAR2(255),
  CREATORCODE  VARCHAR2(50) not null,
  CREATETIME   DATE not null,
  UPDATERCODE  VARCHAR2(50),
  UPDATETIME   DATE,
  VALIDDATE    DATE not null,
  INVALIDDATE  DATE,
  AUDITFLAG    VARCHAR2(4),
  VALIDIND     VARCHAR2(2) not null,
  TCOL1        VARCHAR2(510),
  TCOL2        VARCHAR2(510),
  TCOL3        VARCHAR2(510),
  REMARK       VARCHAR2(4000),
  FLAG         VARCHAR2(255)
)
;
alter table PRPMCLASS
  add constraint PK_PRPMCLASS primary key (CLASSCODE);

prompt Creating PRPMCODE...
create table PRPMCODE
(
  CODETYPE    VARCHAR2(20) not null,
  CODECODE    VARCHAR2(30) not null,
  CODECNAME   VARCHAR2(100),
  CODEENAME   VARCHAR2(100),
  NEWCODETYPE VARCHAR2(20),
  NEWCODECODE VARCHAR2(15) not null,
  VALIDSTATUS VARCHAR2(5) not null,
  FLAG        VARCHAR2(10)
)
;
alter table PRPMCODE
  add constraint PK_PRPMCODE primary key (CODETYPE, CODECODE);

prompt Creating PRPMCOMPANY...
create table PRPMCOMPANY
(
  COMCODE         VARCHAR2(8) not null,
  COMCNAME        VARCHAR2(80) not null,
  COMENAME        VARCHAR2(80),
  ADDRESSCNAME    VARCHAR2(80),
  ADDRESSENAME    VARCHAR2(80),
  POSTCODE        VARCHAR2(6),
  PHONENUMBER     VARCHAR2(30),
  FAXNUMBER       VARCHAR2(20),
  UPPERCOMCODE    VARCHAR2(8),
  INSURERNAME     VARCHAR2(80),
  COMTYPE         VARCHAR2(10),
  COMFLAG         VARCHAR2(1),
  CENTERFLAG      VARCHAR2(1),
  COMLEVEL        NUMBER,
  BRANCHTYPE      VARCHAR2(1),
  UPPERPATH       VARCHAR2(100),
  COMCODECIRC     VARCHAR2(20),
  LICENSENO       VARCHAR2(20),
  EMAIL           VARCHAR2(50),
  REMARK1         VARCHAR2(255),
  COMKIND         VARCHAR2(2),
  MANAGER         VARCHAR2(8),
  ACCOUNTANT      VARCHAR2(8),
  REMARK          VARCHAR2(40),
  NEWCOMCODE      VARCHAR2(8) not null,
  VALIDDATE       VARCHAR2(10),
  INVALIDDATE     VARCHAR2(10),
  VALIDSTATUS     VARCHAR2(1) not null,
  ACNTUNIT        VARCHAR2(8),
  ARTICLECODE     VARCHAR2(30),
  UPDATEFLAG      VARCHAR2(1),
  UPDATEDATE      DATE,
  OPERATORCOMCODE VARCHAR2(8),
  FLAG            VARCHAR2(10)
)
;
alter table PRPMCOMPANY
  add constraint PK_PRPMCOMPANY primary key (COMCODE);

prompt Creating PRPMOPERATELOG...
create table PRPMOPERATELOG
(
  USERCODE      VARCHAR2(20),
  USERNAME      VARCHAR2(20),
  OPERATEDATE   DATE,
  SERIALNO      NUMBER(16),
  OPERATETYPE   VARCHAR2(10),
  OPERATETIME   DATE,
  APPLICATIONNO VARCHAR2(50),
  LOGMSG        VARCHAR2(4000),
  REMARK        VARCHAR2(255),
  SIGNATUREID   VARCHAR2(50),
  UUID          VARCHAR2(86) not null,
  CLSNAME       VARCHAR2(200),
  METHODNAME    VARCHAR2(200),
  PARAM         VARCHAR2(1000),
  LOGTYPE       VARCHAR2(10)
)
;
comment on table PRPMOPERATELOG
  is '������־��';
comment on column PRPMOPERATELOG.USERCODE
  is '�û�����';
comment on column PRPMOPERATELOG.USERNAME
  is '�û�����';
comment on column PRPMOPERATELOG.OPERATEDATE
  is '��������';
comment on column PRPMOPERATELOG.SERIALNO
  is '���';
comment on column PRPMOPERATELOG.OPERATETYPE
  is '�������� 1-controller  0-service';
comment on column PRPMOPERATELOG.OPERATETIME
  is '����ʱ��';
comment on column PRPMOPERATELOG.APPLICATIONNO
  is 'Ӧ�ñ��';
comment on column PRPMOPERATELOG.LOGMSG
  is '������־';
comment on column PRPMOPERATELOG.REMARK
  is '��ע';
comment on column PRPMOPERATELOG.SIGNATUREID
  is 'ǩ��ID';
comment on column PRPMOPERATELOG.UUID
  is 'UUID';
comment on column PRPMOPERATELOG.CLSNAME
  is '����';
comment on column PRPMOPERATELOG.METHODNAME
  is '��������';
comment on column PRPMOPERATELOG.PARAM
  is '����';
comment on column PRPMOPERATELOG.LOGTYPE
  is '��־���� 1-�� 0-�� 2-�쳣';
alter table PRPMOPERATELOG
  add constraint PK_OPERATELOG primary key (UUID);

prompt Creating PRPMRISK...
create table PRPMRISK
(
  RISKCODE          VARCHAR2(6) not null,
  OLDRISKCODE       VARCHAR2(255),
  RISKCNAME         VARCHAR2(255) not null,
  RISKSCNAME        VARCHAR2(255),
  RISKTNAME         VARCHAR2(255),
  RISKENAME         VARCHAR2(255),
  RISKSENAME        VARCHAR2(255),
  RISKATTRIBUTE     VARCHAR2(2) not null,
  SALEAREALEVEL     VARCHAR2(4) not null,
  SALEAREACODE      VARCHAR2(4000),
  SALEAREANAME      VARCHAR2(4000),
  MATERIALCONTXT    VARCHAR2(4000),
  CLASSCODE         VARCHAR2(4),
  FRAMECODE         VARCHAR2(12),
  REPORTNO          VARCHAR2(255),
  PROJECTCODE       VARCHAR2(24),
  PLANIND           VARCHAR2(2),
  ACCOUNTLEVEL      VARCHAR2(2) not null,
  REINSLEVEL        VARCHAR2(2),
  MANAGEMENTLEVEL   VARCHAR2(2) not null,
  STATLEVEL         VARCHAR2(2),
  AUDITFLAG         VARCHAR2(4),
  AGRICULTUREFLAG   VARCHAR2(2),
  POLICYFLAG        VARCHAR2(2),
  POLICYPROCESSFLAG VARCHAR2(2),
  ISFORCE           VARCHAR2(2) not null,
  REQUIREDFLAG      VARCHAR2(8),
  CREATORCODE       VARCHAR2(50) not null,
  CREATETIME        DATE not null,
  UPDATERCODE       VARCHAR2(50),
  UPDATETIME        DATE,
  VALIDDATE         DATE,
  INVALIDDATE       DATE,
  VALIDIND          VARCHAR2(2) not null,
  TCOL1             VARCHAR2(510),
  TCOL2             VARCHAR2(510),
  TCOL3             VARCHAR2(510),
  REMARK            VARCHAR2(4000),
  FLAG              VARCHAR2(255),
  RATEUNIT          INTEGER,
  SHORTRATEFLAG     VARCHAR2(6),
  CLASSFLAG         VARCHAR2(2),
  RISKFLAG          VARCHAR2(2),
  AUTOPAYMENTFLAG   VARCHAR2(2),
  ENDUPDATERCODE    VARCHAR2(20),
  OPERATETIMEFORHIS DATE,
  POLICYTYPE        VARCHAR2(4),
  PRODUCTVADLIDDATE DATE,
  REVISEDATE        DATE,
  VALIDSTATUS       VARCHAR2(2),
  NEWRISKCODE       VARCHAR2(255)
)
;
alter table PRPMRISK
  add constraint PK_PRPMRISK primary key (RISKCODE);

prompt Creating PRPMUSER...
create table PRPMUSER
(
  USERCODE           VARCHAR2(20) not null,
  USERNAME           VARCHAR2(30),
  USERENAME          VARCHAR2(30),
  PASSWORD           VARCHAR2(64),
  SEAL               VARCHAR2(20),
  PASSWORDSETDATE    DATE,
  PASSWORDEXPIREDATE DATE,
  COMCODE            VARCHAR2(50) not null,
  MAKECOM            VARCHAR2(50),
  ACCOUNTCODE        VARCHAR2(8),
  PHONE              VARCHAR2(18),
  MOBILE             VARCHAR2(18),
  ADDRESS            VARCHAR2(60),
  POSTCODE           VARCHAR2(6),
  EMAIL              VARCHAR2(60),
  USERFLAG           VARCHAR2(10),
  LOGINSYSTEM        VARCHAR2(20),
  NEWUSERCODE        VARCHAR2(20),
  VALIDSTATUS        VARCHAR2(1) not null,
  ARTICLECODE        VARCHAR2(8),
  FLAG               VARCHAR2(255),
  POSTERMINALNO      VARCHAR2(8),
  USERTYPE           VARCHAR2(1),
  PROFESSIONALNUM    VARCHAR2(500),
  ISCHECK            VARCHAR2(1),
  IMEI               VARCHAR2(40),
  SIM                VARCHAR2(20),
  REMARK             VARCHAR2(255),
  HASPHONEFLAG       VARCHAR2(1),
  REGISTPHONENO      VARCHAR2(11),
  REGISTUSERNAME     VARCHAR2(20),
  REGISTTIME         DATE,
  REGISTPASSWORD     VARCHAR2(20),
  ERRORTIMES         NUMBER(10,2),
  LASTLOGINTIME      DATE,
  LOCKTIME           DATE
)
;
comment on column PRPMUSER.USERCODE
  is 'Ա������';
comment on column PRPMUSER.USERNAME
  is 'Ա������';
comment on column PRPMUSER.USERENAME
  is 'Ա��Ӣ������';
comment on column PRPMUSER.PASSWORD
  is '����';
comment on column PRPMUSER.SEAL
  is 'ӡ��';
comment on column PRPMUSER.PASSWORDSETDATE
  is '������������';
comment on column PRPMUSER.PASSWORDEXPIREDATE
  is '�����������';
comment on column PRPMUSER.COMCODE
  is '������������';
comment on column PRPMUSER.MAKECOM
  is '������������';
comment on column PRPMUSER.ACCOUNTCODE
  is '�˺Ŵ���';
comment on column PRPMUSER.PHONE
  is '�绰����';
comment on column PRPMUSER.MOBILE
  is '�ֻ�����';
comment on column PRPMUSER.ADDRESS
  is 'ͨ�ŵ�ַ';
comment on column PRPMUSER.POSTCODE
  is '��������';
comment on column PRPMUSER.EMAIL
  is '����';
comment on column PRPMUSER.USERFLAG
  is 'Ա����־';
comment on column PRPMUSER.LOGINSYSTEM
  is '�����¼��Ӧ��ϵͳ';
comment on column PRPMUSER.NEWUSERCODE
  is '����Ա������';
comment on column PRPMUSER.VALIDSTATUS
  is '�Ƿ���Ч';
comment on column PRPMUSER.ARTICLECODE
  is 'ר�����';
comment on column PRPMUSER.FLAG
  is '��־';
comment on column PRPMUSER.POSTERMINALNO
  is '�ն˺�';
comment on column PRPMUSER.USERTYPE
  is 'Ա�����';
comment on column PRPMUSER.PROFESSIONALNUM
  is 'ְҵ֤��';
comment on column PRPMUSER.ISCHECK
  is '�Ƿ�����豸У�飨1-�� 0-��';
comment on column PRPMUSER.IMEI
  is '�ֻ�����';
comment on column PRPMUSER.SIM
  is 'SIM���ţ����ֻ��ţ�';
comment on column PRPMUSER.REMARK
  is '��ע';
comment on column PRPMUSER.HASPHONEFLAG
  is '�Ƿ����ֻ���ʶ';
comment on column PRPMUSER.REGISTPHONENO
  is 'ע���ֻ�����';
comment on column PRPMUSER.REGISTUSERNAME
  is 'ע���û���';
comment on column PRPMUSER.REGISTTIME
  is 'ע��ʱ��';
comment on column PRPMUSER.REGISTPASSWORD
  is 'ע������';
comment on column PRPMUSER.ERRORTIMES
  is '��������������';
comment on column PRPMUSER.LASTLOGINTIME
  is '�ϴε�¼ʱ��';
comment on column PRPMUSER.LOCKTIME
  is '��������ʱ��';
alter table PRPMUSER
  add constraint PRPMUSER primary key (USERCODE);

prompt Loading PRPMCLASS...
prompt Table is empty
prompt Loading PRPMCODE...
prompt Table is empty
prompt Loading PRPMCOMPANY...
prompt Table is empty
prompt Loading PRPMOPERATELOG...
prompt Table is empty
prompt Loading PRPMRISK...
prompt Table is empty
prompt Loading PRPMUSER...
prompt Table is empty
set feedback on
set define on
prompt Done.
