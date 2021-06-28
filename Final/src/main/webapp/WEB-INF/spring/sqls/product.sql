DROP SEQUENCE PRODUCTSEQ;
DROP TABLE PRODUCT;

CREATE SEQUENCE PRODUCTSEQ;
CREATE TABLE PRODUCT(

	PRODUCTSEQ			NUMBER			PRIMARY KEY,
	CATEGORY			VARCHAR2(20)	NOT NULL,
	PRODUCTNAME			VARCHAR2(200)	NOT NULL,
	STARTDATE			VARCHAR2(20)	NOT	NULL,
	ENDDATE				VARCHAR2(20)	NOT	NULL,
	THUMBIMG			VARCHAR2(1000)  NOT	NULL,
	PRODUCTCONTENT		VARCHAR2(4000)	NOT NULL,
	AREACODE			NUMBER			NOT	NULL,
	ADDRESS				VARCHAR2(200) 	NOT	NULL,
	TELLNUMBER			VARCHAR2(20)	NOT NULL,
	RUNTIME				VARCHAR2(20)	NOT	NULL,
	RATING				VARCHAR2(10)	NOT	NULL,
	LIKECOUNT			NUMBER,
	WISHCOUNT			NUMBER,
	PRODUCTCOUNT		NUMBER			

);

SELECT * FROM PRODUCT;