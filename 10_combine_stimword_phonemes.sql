
ALTER TABLE stimword
   ADD COLUMN stimwordPhonetic varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT ''
       AFTER stimwordWord
;

DROP TABLE IF EXISTS tempPhonetic
;

CREATE TABLE tempPhonetic 
SELECT DISTINCT stimword.stimwordLayoutName
         ,      stimword.stimwordPageNbr
         ,      stimword.stimwordlineNbr
         ,      stimword.stimwordWord
         ,      CONVERT(GROUP_CONCAT(  
                  DISTINCT  phoneticSpelling.phoneticSpellingTargetSound ORDER BY phoneticSpelling.phoneticSpellingOrderNbr SEPARATOR '' 
                  ) 
                  USING utf8)  'stimwordPhonetic'
FROM comptonTransAnlys.stimword
,  comptonTransAnlys.phoneticSpelling
WHERE 1
AND  stimword.stimwordLayoutName      = phoneticSpelling.phoneticSpellingLayoutName
AND  stimword.stimwordPageNbr         = phoneticSpelling.phoneticSpellingPageNbr
AND  stimword.stimwordLineNbr         = phoneticSpelling.phoneticSpellingLineNbr
AND  stimword.stimwordWord            = phoneticSpelling.phoneticSpellingStimword
GROUP BY  phoneticSpelling.phoneticSpellingLayoutName
		, phoneticSpelling.phoneticSpellingPageNbr
		, phoneticSpelling.phoneticSpellingLineNbr
        , phoneticSpelling.phoneticSpellingStimword
ORDER BY stimword.stimwordLayoutName
,       stimword.stimwordPageNbr
,       stimword.stimwordLineNbr
,       stimword.stimwordWord
;

UPDATE stimword, tempPhonetic
  SET stimword.stimwordPhonetic  = tempPhonetic.stimwordPhonetic
WHERE 1
AND  stimword.stimwordLayoutName    = tempPhonetic.stimwordLayoutName
AND  stimword.stimwordPageNbr       = tempPhonetic.stimwordPageNbr
AND  stimword.stimwordLineNbr       = tempPhonetic.stimwordLineNbr
AND  stimword.stimwordWord          = tempPhonetic.stimwordWord
;

DROP TABLE IF EXISTS tempPhonetic
;
