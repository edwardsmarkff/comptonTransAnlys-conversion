               Eval_master             =>      stimwordPosition
                Client_anlys_detail     =>      clientContext
                Client_eval_detail      =>      clientStimword


                                stimwordPosition                        clientStimword
                                ================                        ==============
Eval_master_stimulus_word    => stimwordPositionWord            ==      clientPositionWord
Eval_master_position         => stimwordPostionName             ==      clientContextPositionName (!!!!!)  clientContextPosition                (????)
Eval_master_position_nbr     => stimwordPositionNbr             ==      clientStimwordPostionNbr
Eval_master_context          => stimwordPositionSetting         ==      clientStimwordSetting


`stimwordPositionWord` char(25) NOT NULL,
`stimwordPositionName` varchar(20) NOT NULL,
`stimwordPositionNbr` tinyint(3) unsigned NOT NULL,
`stimwordPositionSetting` char(20) NOT NULL,

`clientStimwordWord` char(25) NOT NULL,
`clientContextPositionName` varchar(20) NOT NULL,
`clientStimwordPositionNbr` tinyint(3) unsigned NOT NULL,
`clientStimwordSetting` char(20) NOT NULL,





                SELECT  DISTINCT ''
                ,       stimwordPosition.stimwordPositionPageNbr
                ,       stimwordPosition.stimwordPositionLineNbr
                ,       stimwordPosition.stimwordPositionWord
                FROM    stimwordPosition
                WHERE   1
                AND     layoutName                              = 'PESL'
                AND     stimwordPositionPageNbr                 BETWEEN  0 AND  1000
                ORDER BY
                        stimwordPosition.stimwordPositionAutoIncr
                ;





                SELECT  ALL ''
                ,       stimwordPosition.stimwordPositionWord                   'StimwordPositionWord'
                ,       stimwordPosition.stimwordPositionName                   'stimwordPositionName'
                ,       stimwordPosition.stimwordPositionNbr                    'stimwordPositionNbr'
                ,       stimwordPosition.stimwordPositionSetting
                ,       stimwordPosition.stimwordPositionBackgroundColor
                ,       stimwordPosition.stimwordPositionBdrColor
                ,       stimwordPosition.stimwordPositionBdrStyle
                ,       stimwordPosition.stimwordPositionBdrThickness
                ,       stimwordPosition.stimwordPositionPhoneme
                ,       stimwordPosition.stimwordPositionPageNbr                'stimwordPositionPageNbr'
                ,       stimwordPosition.stimwordPositionAutoIncr               'stimwordPositionAutoIncr'
                
                ,       clientStimwordCURRENT.clientContextError                'clientContextError CURRENT'

                --                ,       clientStimwordCURRENT.clientContextError1               'clientContextError1_current'
                --                ,       clientStimwordCURRENT.clientContextError2               'clientContextError2_current'
                --                ,       clientStimwordCURRENT.clientContextError3               'clientContextError3_current'
                --                ,       clientStimwordCURRENT.clientContextError4               'clientContextError4_current'

                ,       clientStimwordREPLICATE.clientContextError                'clientContextError REPLICATE'
                --                ,       clientStimwordREPLICATE.clientContextError1             'clientContextError1_replicate'
                --                ,       clientStimwordREPLICATE.clientContextError2             'clientContextError2_replicate'
                --                ,       clientStimwordREPLICATE.clientContextError3             'clientContextError3_replicate'
                --                ,       clientStimwordREPLICATE.clientContextError4             'clientContextError4_replicate'

                FROM    stimwordPosition
                LEFT OUTER JOIN clientStimword clientStimwordCURRENT ON
                (       1
                AND     stimwordPosition.stimwordPositionAutoIncr       =       clientStimwordCURRENT.clientStimwordAutoIncr
                AND     stimwordPosition.layoutName                     =       clientStimwordCURRENT.layoutName
                AND     stimwordPosition.stimwordPositionPageNbr        =       clientStimwordCURRENT.stimwordPositionPageNbr
                AND     stimwordPosition.stimwordPositionLineNbr        =       clientStimwordCURRENT.stimwordPositionLineNbr
                AND     stimwordPosition.stimwordPositionWord           =       clientStimwordCURRENT.stimwordPositionWord

                AND     stimwordPosition.stimwordPositionName           =       clientStimwordCURRENT.clientContextPositionName
                AND     stimwordPosition.stimwordPositionNbr            =       clientStimwordCURRENT.clientStimwordPositionNbr
                AND     stimwordPosition.stimwordPositionSetting        =       clientStimwordCURRENT.clientStimwordSetting

                AND     stimwordPosition.stimwordPositionPhoneme        =       clientStimwordCURRENT.clientContextPhoneme

                AND     clientStimwordCURRENT.teacherEmail              =       'info@englishwithoutaccent.com'
                AND     clientStimwordCURRENT.clientMasterEmail         =       'mark@edwardsmark.com'
                AND     clientStimwordCURRENT.clientMasterSessionName   =       'Time1'
                AND     clientStimwordCURRENT.layoutName                =       'PESL'
                )
                LEFT OUTER JOIN clientStimword clientStimwordREPLICATE ON
                (       1
                AND     stimwordPosition.stimwordPositionAutoIncr       =       clientStimwordREPLICATE.clientStimwordAutoIncr
                AND     stimwordPosition.layoutName                     =       clientStimwordREPLICATE.layoutName
                AND     stimwordPosition.stimwordPositionPageNbr        =       clientStimwordREPLICATE.stimwordPositionPageNbr
                AND     stimwordPosition.stimwordPositionLineNbr        =       clientStimwordREPLICATE.stimwordPositionLineNbr
                AND     stimwordPosition.stimwordPositionWord           =       clientStimwordREPLICATE.stimwordPositionWord

                AND     stimwordPosition.stimwordPositionName           =       clientStimwordREPLICATE.clientContextPositionName
                AND     stimwordPosition.stimwordPositionNbr            =       clientStimwordREPLICATE.clientStimwordPositionNbr
                AND     stimwordPosition.stimwordPositionSetting        =       clientStimwordREPLICATE.clientStimwordSetting

                AND     stimwordPosition.stimwordPositionPhoneme        =       clientStimwordREPLICATE.clientContextPhoneme

                AND     clientStimwordREPLICATE.teacherEmail            =       'info@englishwithoutaccent.com'
                AND     clientStimwordREPLICATE.clientMasterEmail       =       'mark@edwardsmark.com'
                AND     clientStimwordREPLICATE.clientMasterSessionName =       'Time1'
                AND     clientStimwordREPLICATE.clientMasterLayoutName  =       'P-ESL'
                )
                WHERE   1                       /* dummy first one */
                AND     stimwordPosition.layoutName                                             =       'PESL'
                AND     stimwordPosition.stimwordPositionPageNbr                                =       1
                AND     stimwordPosition.stimwordPositionLineNbr                                =       1
                AND     stimwordPosition.stimwordPositionWord                                   =       'Horse'
                ORDER BY        stimwordPosition.stimwordPositionAutoIncr
                ;







                SELECT  Session_names.Session_replicate
                ,       Session_names.Session_beginLineNbr
                ,       Session_names.Session_endLineNbr
                ,       Session_names.Session_error_sounds_css_normal_class
                ,       Session_names.Session_error_sounds_css_replicate_class
                FROM    Session_names
                WHERE   1=1
                AND     Session_names.Session_name                              =       'Time1'
                ;


OLD OLD OLD OLD OLD OLD OLD
                SELECT  COUNT(*)
                        FROM stimwordPosition
                        WHERE   1=1
                        AND     stimwordPositionLayoutName                      = 'P-ESL'
                        AND     stimwordPositionPageNbr                 = 1
                        AND     stimwordPositionLineNbr                 = 1
                        AND     stimwordPosition_stimulus_word          = 'Horse'
                UNION ALL
                SELECT COUNT(*)
                        FROM Language_norms
                        RIGHT JOIN (stimwordPosition)
                        ON      (       1
                                AND     stimwordPositionLayoutName              /* added 05-19-2006 */
                                    =   Language_normsLayoutName                /* added 05-19-2006 */
                                AND     stimwordPosition_position
                                    =   Language_norms_position
                                AND     stimwordPosition_target_sound_1
                                    =   Language_norms_target_sound_1
                                AND     stimwordPosition_target_sound_2
                                    =   Language_norms_target_sound_2
                                AND     stimwordPosition_target_sound_3
                                    =   Language_norms_target_sound_3

                                AND     stimwordPositionLayoutName              = 'P-ESL'
                                AND     stimwordPositionPageNbr         = 1
                                AND     stimwordPositionLineNbr         = 1
                                AND     stimwordPosition_stimulus_word  = 'Horse'
                                )
                        WHERE   Language_norms_language_name            = 'Filipino'

                SELECT  COUNT(*)
                        FROM stimwordPosition
                        WHERE   1=1
                        AND     stimwordPositionLayoutName                      = 'P-ESL'
                        AND     stimwordPositionPageNbr                 = 1
                        AND     stimwordPositionLineNbr                 = 1
                        AND     stimwordPositionWord            = 'Horse'
                UNION ALL
                SELECT COUNT(*)
                        FROM languageNorms
                        RIGHT JOIN (stimwordPosition)
                        ON      (       1
                                AND     stimwordPosition.stimwordPositionLayoutName
                                    =   languageNorms.languageNormsLayoutName
                                AND     stimwordPosition.stimwordPositionName
                                    =   languageNorms.languageNormsPosition
                                AND     stimwordPosition.stimwordPositionPhoneme
                                    =   languageNorms.languageNormsPhoneme
                                AND     stimwordPosition.stimwordPositionLayoutName             = 'P-ESL'
                                AND     stimwordPosition.stimwordPositionPageNbr                = 1
                                AND     stimwordPosition.stimwordPositionLineNbr                = 1
                                AND     stimwordPosition.stimwordPositionWord   = 'Horse'
                                )
                        WHERE   languageNormsName               = 'Filipino'



OLD OLD OLD OLD OLD OLD OLD OLD OLD OLD
        SELECT  Language_norms_error_sound_1
        ,       Language_norms_error_sound_2
        ,       Language_norms_error_sound_3
        ,       Language_norms_error_sound_4
        FROM    Language_norms
        WHERE   1
        AND     Language_normsLayoutName        =       'P-ESL'
        AND     Language_norms_language_name    =       'Filipino'
        AND     Language_norms_position         =       'blend'
        AND     Language_norms_target_sound_1   =       'd'
        AND     Language_norms_target_sound_2   =       'r'
        AND     Language_norms_target_sound_3   =       ''
        ;


      SELECT    languageNorms.languageNormsError1
        ,       languageNorms.languageNormsError2
        ,       languageNorms.languageNormsError3
        ,       languageNorms.languageNormsError4
        FROM    languageNorms
        WHERE   1
        AND     languageNorms.languageNormsLayoutName        =       'P-ESL'
        AND     languageNorms.languageNormsName           =       'Filipino'
        AND     languageNorms.languageNormsPosition         =       'blend'
        AND     languageNorms.languageNormsPhoneme       =       'dr'
        ;




UNUSED UNUSED UNUSED UNUSED
                SELECT  Phonetic_spelling_target_sound
                FROM    Phonetic_spelling
                WHERE   1
                AND     Phonetic_spellingLayoutName     =       'P-ESL'
                AND     Phonetic_spellingPageNbr        =       1
                AND     Phonetic_spellingLineNbr        =       1
                AND     Phonetic_spelling_stimulus_word =       'Horse'
                ORDER BY
                        Phonetic_spelling_order_nbr
                ;
UNUSED UNUSED UNUSED UNUSED
