/* combine the phonetic spelliing into ONE field  */

SELECT DISTINCT Eval_master.Eval_master_layout_name
,      Phonetic_spelling.Phonetic_spelling_layout_name
,     Eval_master.Eval_master_page_nbr
,     Phonetic_spelling.Phonetic_spelling_page_nbr
,     Eval_master.Eval_master_line_nbr
,     Phonetic_spelling.Phonetic_spelling_line_nbr
,     Eval_master.Eval_master_stimulus_word
,     CONVERT(GROUP_CONCAT(  
          DISTINCT  Phonetic_spelling.Phonetic_spelling_target_sound ORDER BY Phonetic_spelling.Phonetic_spelling_order_nbr SEPARATOR '  ' 
          )
        USING utf8)
FROM comptonTransAnlys.Eval_master
,  comptonTransAnlys.Phonetic_spelling
WHERE 1
AND  Eval_master.Eval_master_layout_name         = Phonetic_spelling.Phonetic_spelling_layout_name
AND  Eval_master.Eval_master_page_nbr            = Phonetic_spelling.Phonetic_spelling_page_nbr
AND  Eval_master.Eval_master_line_nbr            = Phonetic_spelling.Phonetic_spelling_line_nbr
AND  Eval_master.Eval_master_stimulus_word       = Phonetic_spelling.Phonetic_spelling_stimulus_word
AND Eval_master.Eval_master_stimulus_word = 'potatoes'

GROUP BY Phonetic_spelling.Phonetic_spelling_layout_name
		, Phonetic_spelling.Phonetic_spelling_page_nbr
		, Phonetic_spelling.Phonetic_spelling_line_nbr
        , Phonetic_spelling.Phonetic_spelling_stimulus_word
        
ORDER BY Eval_master.Eval_master_layout_name
,     Eval_master.Eval_master_page_nbr
,     Eval_master.Eval_master_line_nbr
,     Eval_master.Eval_master_stimulus_word
;
