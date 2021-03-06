CREATE TABLE SP_CLAIM_DIALECT (
	    	ID INTEGER,
	    	TENANT_ID INTEGER NOT NULL,
	    	SP_DIALECT VARCHAR (512) NOT NULL,
	   		APP_ID INTEGER NOT NULL,
        PRIMARY KEY (ID))
/
CREATE SEQUENCE SP_CLAIM_DIALECT_SEQ START WITH 1 INCREMENT BY 1 CACHE 20 ORDER
/
CREATE OR REPLACE TRIGGER SP_CLAIM_DIALECT_SEQ
            BEFORE INSERT
            ON SP_CLAIM_DIALECT
            REFERENCING NEW AS NEW
            FOR EACH ROW
               BEGIN
                   SELECT SP_CLAIM_DIALECT_SEQ.nextval INTO :NEW.ID FROM dual;
               END;
/
ALTER TABLE SP_CLAIM_DIALECT ADD CONSTRAINT DIALECTID_APPID_CONSTRAINT FOREIGN KEY (APP_ID) REFERENCES SP_APP (ID) ON DELETE CASCADE
/
