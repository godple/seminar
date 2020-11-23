CREATE TABLE COMTECOPSEQ
(
	TABLE_NAME            VARCHAR(20) NULL,
	NEXT_ID               NUMERIC(30) NULL,
	 PRIMARY KEY (TABLE_NAME)
)
;

CREATE UNIQUE INDEX COMTECOPSEQ_PK ON COMTECOPSEQ
(
	TABLE_NAME
)
;



CREATE TABLE COMTCCMMNCLCODE
(
	CL_CODE               CHAR(3) NOT NULL,
	CL_CODE_NM            VARCHAR(60) NULL,
	CL_CODE_DC            VARCHAR(200) NULL,
	USE_AT                CHAR(1) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (CL_CODE)
)
;

CREATE UNIQUE INDEX COMTCCMMNCLCODE_PK ON COMTCCMMNCLCODE
(
	CL_CODE
)
;



CREATE TABLE COMTCCMMNCODE
(
	CODE_ID               VARCHAR(6) NOT NULL,
	CODE_ID_NM            VARCHAR(60) NULL,
	CODE_ID_DC            VARCHAR(200) NULL,
	USE_AT                CHAR(1) NULL,
	CL_CODE               CHAR(3) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (CODE_ID),
	FOREIGN KEY COMTCCMMNCODE_FK1 (CL_CODE) REFERENCES COMTCCMMNCLCODE(CL_CODE)
)
;

CREATE UNIQUE INDEX COMTCCMMNCODE_PK ON COMTCCMMNCODE
(
	CODE_ID
)
;
CREATE INDEX COMTCCMMNCODE_i01 ON COMTCCMMNCODE
(
	CL_CODE
)
;



CREATE TABLE COMTCCMMNDETAILCODE
(
	CODE_ID               VARCHAR(6) NOT NULL,
	CODE                  VARCHAR(15) NOT NULL,
	CODE_NM               VARCHAR(60) NULL,
	CODE_DC               VARCHAR(200) NULL,
	USE_AT                CHAR(1) NULL,
	FRST_REGIST_PNTTM     DATETIME NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       DATETIME NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (CODE_ID,CODE),
	FOREIGN KEY COMTCCMMNDETAILCODE_FK1 (CODE_ID) REFERENCES COMTCCMMNCODE(CODE_ID)
)
;

CREATE UNIQUE INDEX COMTCCMMNDETAILCODE_PK ON COMTCCMMNDETAILCODE
(
	CODE_ID,
	CODE
)
;
CREATE INDEX COMTCCMMNDETAILCODE_i01 ON COMTCCMMNDETAILCODE
(
	CODE_ID
)
;



CREATE TABLE COMTNAUTHORGROUPINFO
(
	GROUP_ID              CHAR(20) NULL,
	GROUP_NM              VARCHAR(60) NOT NULL,
	GROUP_CREAT_DE        CHAR(20) NOT NULL,
	GROUP_DC              VARCHAR(100) NULL,
	 PRIMARY KEY (GROUP_ID)
)
;

CREATE UNIQUE INDEX COMTNAUTHORGROUPINFO_PK ON COMTNAUTHORGROUPINFO
(
	GROUP_ID
)
;



CREATE TABLE COMTNGNRLMBER
(
	MBER_ID               VARCHAR(20) NULL,
	PASSWORD              VARCHAR(200) NOT NULL,
	PASSWORD_HINT         VARCHAR(100) NULL,
	PASSWORD_CNSR         VARCHAR(100) NULL,
	IHIDNUM               VARCHAR(200) NULL,
	MBER_NM               VARCHAR(50) NOT NULL,
	ZIP                   VARCHAR(6) NOT NULL,
	ADRES                 VARCHAR(100) NOT NULL,
	AREA_NO               VARCHAR(4) NOT NULL,
	MBER_STTUS            VARCHAR(15) NULL,
	DETAIL_ADRES          VARCHAR(100) NULL,
	END_TELNO             VARCHAR(4) NOT NULL,
	MBTLNUM               VARCHAR(20) NOT NULL,
	GROUP_ID              CHAR(20) NULL,
	MBER_FXNUM            VARCHAR(20) NULL,
	MBER_EMAIL_ADRES      VARCHAR(50) NULL,
	MIDDLE_TELNO          VARCHAR(4) NOT NULL,
	SBSCRB_DE             DATETIME NULL,
	SEXDSTN_CODE          CHAR(1) NULL,
	ESNTL_ID              CHAR(20) NOT NULL,
	 PRIMARY KEY (MBER_ID),
	FOREIGN KEY COMTNGNRLMBER_FK1 (GROUP_ID) REFERENCES COMTNAUTHORGROUPINFO(GROUP_ID)
		ON DELETE SET NULL
)
;

CREATE UNIQUE INDEX COMTNGNRLMBER_PK ON COMTNGNRLMBER
(
	MBER_ID
)
;
CREATE INDEX COMTNGNRLMBER_i01 ON COMTNGNRLMBER
(
	GROUP_ID
)
;



CREATE TABLE COMTNORGNZTINFO
(
	ORGNZT_ID             CHAR(20) NULL,
	ORGNZT_NM             VARCHAR(20) NOT NULL,
	ORGNZT_DC             VARCHAR(100) NULL,
	 PRIMARY KEY (ORGNZT_ID)
)
;

CREATE UNIQUE INDEX COMTNORGNZTINFO_PK ON COMTNORGNZTINFO
(
	ORGNZT_ID
)
;



CREATE TABLE COMTNEMPLYRINFO
(
	EMPLYR_ID             VARCHAR(20) NOT NULL,
	ORGNZT_ID             CHAR(20) NULL,
	USER_NM               VARCHAR(60) NOT NULL,
	PASSWORD              VARCHAR(200) NOT NULL,
	EMPL_NO               VARCHAR(20) NULL,
	IHIDNUM               VARCHAR(200) NULL,
	SEXDSTN_CODE          CHAR(1) NULL,
	BRTHDY                CHAR(20) NULL,
	FXNUM                 VARCHAR(20) NULL,
	HOUSE_ADRES           VARCHAR(100) NOT NULL,
	PASSWORD_HINT         VARCHAR(100) NOT NULL,
	PASSWORD_CNSR         VARCHAR(100) NOT NULL,
	HOUSE_END_TELNO       VARCHAR(4) NOT NULL,
	AREA_NO               VARCHAR(4) NOT NULL,
	DETAIL_ADRES          VARCHAR(100) NULL,
	ZIP                   VARCHAR(6) NOT NULL,
	OFFM_TELNO            VARCHAR(20) NULL,
	MBTLNUM               VARCHAR(20) NULL,
	EMAIL_ADRES           VARCHAR(50) NULL,
	OFCPS_NM              VARCHAR(60) NULL,
	HOUSE_MIDDLE_TELNO    VARCHAR(4) NOT NULL,
	GROUP_ID              CHAR(20) NULL,
	PSTINST_CODE          CHAR(8) NULL,
	EMPLYR_STTUS_CODE     CHAR(1) NOT NULL,
	ESNTL_ID              CHAR(20) NOT NULL,
	CRTFC_DN_VALUE        VARCHAR(100) NULL,
	SBSCRB_DE             DATETIME NULL,
	 PRIMARY KEY (EMPLYR_ID),
	FOREIGN KEY COMTNEMPLYRINFO_FK2 (ORGNZT_ID) REFERENCES COMTNORGNZTINFO(ORGNZT_ID)
		ON DELETE SET NULL,
	FOREIGN KEY COMTNEMPLYRINFO_FK1 (GROUP_ID) REFERENCES COMTNAUTHORGROUPINFO(GROUP_ID)
		ON DELETE SET NULL
)
;

CREATE UNIQUE INDEX COMTNEMPLYRINFO_PK ON COMTNEMPLYRINFO
(
	EMPLYR_ID
)
;
CREATE INDEX COMTNEMPLYRINFO_i01 ON COMTNEMPLYRINFO
(
	ORGNZT_ID
)
;
CREATE INDEX COMTNEMPLYRINFO_i02 ON COMTNEMPLYRINFO
(
	GROUP_ID
)
;



CREATE TABLE COMTNENTRPRSMBER
(
	ENTRPRS_MBER_ID       VARCHAR(20) NULL,
	ENTRPRS_SE_CODE       CHAR(8) NULL,
	BIZRNO                VARCHAR(10) NULL,
	JURIRNO               VARCHAR(13) NULL,
	CMPNY_NM              VARCHAR(60) NOT NULL,
	CXFC                  VARCHAR(50) NULL,
	ZIP                   VARCHAR(6) NOT NULL,
	ADRES                 VARCHAR(100) NOT NULL,
	ENTRPRS_MIDDLE_TELNO  VARCHAR(4) NOT NULL,
	FXNUM                 VARCHAR(20) NULL,
	INDUTY_CODE           CHAR(1) NULL,
	APPLCNT_NM            VARCHAR(50) NOT NULL,
	APPLCNT_IHIDNUM       VARCHAR(200) NULL,
	SBSCRB_DE             DATETIME NULL,
	ENTRPRS_MBER_STTUS    VARCHAR(15) NULL,
	ENTRPRS_MBER_PASSWORD  VARCHAR(200) NULL,
	ENTRPRS_MBER_PASSWORD_HINT  VARCHAR(100) NOT NULL,
	ENTRPRS_MBER_PASSWORD_CNSR  VARCHAR(100) NOT NULL,
	GROUP_ID              CHAR(20) NULL,
	DETAIL_ADRES          VARCHAR(100) NULL,
	ENTRPRS_END_TELNO     VARCHAR(4) NOT NULL,
	AREA_NO               VARCHAR(4) NOT NULL,
	APPLCNT_EMAIL_ADRES   VARCHAR(50) NOT NULL,
	ESNTL_ID              CHAR(20) NOT NULL,
	 PRIMARY KEY (ENTRPRS_MBER_ID),
	FOREIGN KEY COMTNENTRPRSMBER_FK1 (GROUP_ID) REFERENCES COMTNAUTHORGROUPINFO(GROUP_ID)
		ON DELETE SET NULL
)
;

CREATE UNIQUE INDEX COMTNENTRPRSMBER_PK ON COMTNENTRPRSMBER
(
	ENTRPRS_MBER_ID
)
;
CREATE INDEX COMTNENTRPRSMBER_i01 ON COMTNENTRPRSMBER
(
	GROUP_ID
)
;



CREATE TABLE COMTNFILE
(
	ATCH_FILE_ID          CHAR(20) NOT NULL,
	CREAT_DT              DATETIME NOT NULL,
	USE_AT                CHAR(1) NULL,
	 PRIMARY KEY (ATCH_FILE_ID)
)
;

CREATE UNIQUE INDEX COMTNFILE_PK ON COMTNFILE
(
	ATCH_FILE_ID
)
;



CREATE TABLE COMTNFILEDETAIL
(
	ATCH_FILE_ID          CHAR(20) NOT NULL,
	FILE_SN               NUMERIC(10) NOT NULL,
	FILE_STRE_COURS       VARCHAR(2000) NOT NULL,
	STRE_FILE_NM          VARCHAR(255) NOT NULL,
	ORIGNL_FILE_NM        VARCHAR(255) NULL,
	FILE_EXTSN            VARCHAR(20) NOT NULL,
	FILE_CN               MEDIUMTEXT NULL,
	FILE_SIZE             NUMERIC(8) NULL,
	 PRIMARY KEY (ATCH_FILE_ID,FILE_SN),
	FOREIGN KEY COMTNFILEDETAIL_FK1 (ATCH_FILE_ID) REFERENCES COMTNFILE(ATCH_FILE_ID)
)
;

CREATE UNIQUE INDEX COMTNFILEDETAIL_PK ON COMTNFILEDETAIL
(
	ATCH_FILE_ID,
	FILE_SN
)
;
CREATE INDEX COMTNFILEDETAIL_i01 ON COMTNFILEDETAIL
(
	ATCH_FILE_ID
)
;



CREATE TABLE COMTHEMAILDSPTCHMANAGE
(
	MSSAGE_ID             VARCHAR(20) NULL,
	EMAIL_CN              MEDIUMTEXT NULL,
	SNDR                  VARCHAR(50) NOT NULL,
	RCVER                 VARCHAR(50) NOT NULL,
	SJ                    VARCHAR(60) NOT NULL,
	SNDNG_RESULT_CODE     CHAR(1) NULL,
	DSPTCH_DT             CHAR(20) NOT NULL,
	ATCH_FILE_ID          CHAR(20) NULL,
	 PRIMARY KEY (MSSAGE_ID),
	FOREIGN KEY COMTHEMAILDSPTCHMANAGE_FK1 (SNDR) REFERENCES COMTNEMPLYRINFO(EMPLYR_ID),
	FOREIGN KEY COMTHEMAILDSPTCHMANAGE_FK2 (ATCH_FILE_ID) REFERENCES COMTNFILE(ATCH_FILE_ID)
)
;

CREATE UNIQUE INDEX COMTHEMAILDSPTCHMANAGE_PK ON COMTHEMAILDSPTCHMANAGE
(
	MSSAGE_ID
)
;
CREATE INDEX COMTHEMAILDSPTCHMANAGE_i01 ON COMTHEMAILDSPTCHMANAGE
(
	SNDR
)
;
CREATE INDEX COMTHEMAILDSPTCHMANAGE_i02 ON COMTHEMAILDSPTCHMANAGE
(
	ATCH_FILE_ID
)
;



