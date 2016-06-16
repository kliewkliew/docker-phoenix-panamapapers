
# Tableau Workbooks
Workbooks can be viewed and edited (while connected to a valid datasource) using [Tableau Desktop 9.3] (http://www.tableau.com/products/reader).
Packaged workbooks (twbx) can be viewed for free using [Tableau Reader 9.3] (http://www.tableau.com/products/reader). The data was extracted from Phoenix and packaged with the workbook.

One set of workbooks describes entities. Another set describes only Entities with Known Beneficiaries.

Some filters do not work due to incompatibilities with Tableau and Phoenix.
ie. I tried to make a Average Duration of Entity by Country workbook but had to exclude it from the packaged workbook.

[Definition of terms] (https://offshoreleaks.icij.org/pages/about).

# Entities (Offshore Companies) with Known Beneficiaries
```
SELECT BNAME, BCOUNTRIES, NAME, COUNTRIES, INCORPORATION_DATE, INACTIVATION_DATE, STRUCK_OFF_DATE, DORM_DATE, STATUS, SERVICE_PROVIDER, SOURCEID
FROM
	(
	SELECT COUNTRIES AS BCOUNTRIES, NAME AS BNAME, NODE_2
	FROM OFFICERS
	INNER JOIN
		(
		SELECT NODE_1, REL_TYPE, NODE_2
		FROM ALL_EDGES 
		WHERE REL_TYPE = 'beneficiary of'
		) bEdges
	ON NODE_ID = bEdges.NODE_1
	) intermediaries
INNER JOIN ENTITIES
ON ENTITIES.NODE_ID = intermediaries.NODE_2
```
