
TRUNCATE TABLE PARTIES;

SELECT @SNAPSHOT_ID := MAX(snapshotid) FROM SNAPSHOTS;

SELECT NOW() FROM DUAL;

LOAD DATA INFILE 'parties.tsv'
   INTO TABLE PARTIES
    FIELDS TERMINATED BY '\t' OPTIONALLY ENCLOSED BY '"' ESCAPED BY '\\'
    SET snapshotid= @SNAPSHOT_ID
;

SELECT NOW() FROM DUAL;
