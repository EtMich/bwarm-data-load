
SET snapshotid=ifnull((SELECT max(snapshotid) from MLC_SNAPSHOTS),0);

TRUNCATE MLC_ALTERNATIVE_WORK_TITLES;

COPY INTO MLC_ALTERNATIVE_WORK_TITLES
FROM (
    SELECT $1, $2, $3, $4, $5, $snapshotid
    FROM @IMPORTSTAGE
)
FILES = ('/mlc/workalternativetitles.tsv.gz')
FILE_FORMAT = TSV_FILE_FORMAT
ON_ERROR = CONTINUE
;
