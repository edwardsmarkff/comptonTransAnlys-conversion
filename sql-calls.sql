		SELECT	DISTINCT ''
		,	stimwordPosition.stimwordPositionPageNbr
		,	stimwordPosition.stimwordPositionLineNbr
		,	stimwordPosition.stimwordPositionWord
		FROM	stimwordPosition
		WHERE	1
		AND	stimwordPositionLayoutName		= 'P-ESL'
		AND	stimwordPositionPageNbr			BETWEEN	 0 AND	1000
		ORDER BY
			stimwordPosition.stimwordPositionAutoIncr
		;






		SELECT	ALL ''
		,	stimwordPosition.stimwordPositionWord			'StimwordPositionWord'
		,	stimwordPosition.stimwordPositionName			'stimwordPositionName'
		,	stimwordPosition.stimwordPositionNbr			'stimwordPositionNbr'
		,	stimwordPosition.stimwordPositionSetting
		,	stimwordPosition.stimwordPositionBackgroundColor
		,	stimwordPosition.stimwordPositionBdrColor
		,	stimwordPosition.stimwordPositionBdrStyle
		,	stimwordPosition.stimwordPositionBdrThickness
		,	stimwordPosition.stimwordPositionPhoneme
							--	,	stimwordPosition.stimwordPosition_target_sound_1
							--	,	stimwordPosition.stimwordPosition_target_sound_2
							--	,	stimwordPosition.stimwordPosition_target_sound_3
		,	stimwordPosition.stimwordPositionPageNbr		'Eval_masterPageNbr'
		,	stimwordPosition.stimwordPositionAutoIncr		'Eval_masterAutoIncr'

		,	clientStimwordCURRENT.clientStimwordError1		'clientStimwordError1_current'
		,	clientStimwordCURRENT.clientStimwordError2		'clientStimwordError2_current'
		,	clientStimwordCURRENT.clientStimwordError3		'clientStimwordError3_current'
		,	clientStimwordCURRENT.clientStimwordError4		'clientStimwordError4_current'
		,	clientStimwordREPLICATE.clientStimwordError1		'clientStimwordError1_replicate'
		,	clientStimwordREPLICATE.clientStimwordError2		'clientStimwordError2_replicate'
		,	clientStimwordREPLICATE.clientStimwordError3		'clientStimwordError3_replicate'
		,	clientStimwordREPLICATE.clientStimwordError4		'clientStimwordError4_replicate'

		FROM	stimwordPosition
		LEFT OUTER JOIN clientStimword clientStimwordCURRENT ON
		(	1
		AND	stimwordPosition.stimwordPositionLayoutName	=	clientStimwordCURRENT.clientMasterLayoutName
		AND	stimwordPosition.stimwordPositionPageNbr	=	clientStimwordCURRENT.clientStimwordPageNbr
		AND	stimwordPosition.stimwordPositionLineNbr	=	clientStimwordCURRENT.clientStimwordLineNbr
		AND	stimwordPosition.stimwordPositionWord 		=	clientStimwordCURRENT.clientStimwordWord
		AND	stimwordPosition.stimwordPositionName		=	clientStimwordCURRENT.clientStimwordName
		AND	stimwordPosition.stimwordPositionNbr		=	clientStimwordCURRENT.clientStimwordNbr
		AND	stimwordPosition.stimwordPositionSetting	=	clientStimwordCURRENT.clientStimwordSetting
		AND	stimwordPosition.stimwordPositionPhoneme	=	clientStimwordCURRENT.clientStimwordPhoneme	
				## AND	stimwordPosition.stimwordPosition_target_sound_1	=	clientStimwordCURRENT.clientStimword_target_sound_1	
				## AND	stimwordPosition.stimwordPosition_target_sound_2	=	clientStimwordCURRENT.clientStimword_target_sound_2	
				## AND	stimwordPosition.stimwordPosition_target_sound_3	=	clientStimwordCURRENT.clientStimword_target_sound_3	

		AND	clientStimwordCURRENT.teacherEmail		=	'info@englishwithoutaccent.com'
		AND	clientStimwordCURRENT.clientMasterEmail		=	'mark@edwardsmark.com'
		AND	clientStimwordCURRENT.clientMasterSessionName	=	'Time1'
		AND	clientStimwordCURRENT.clientMasterLayoutName	=	'P-ESL'
		)
		LEFT OUTER JOIN clientStimword clientStimwordREPLICATE ON
		(	1
		AND	stimwordPosition.stimwordPositionLayoutName 	=	clientStimwordREPLICATE.clientStimwordLayoutName
		AND	stimwordPosition.stimwordPositionPageNbr 	=	clientStimwordREPLICATE.clientStimwordPageNbr
		AND	stimwordPosition.stimwordPositionLineNbr	=	clientStimwordREPLICATE.clientStimwordLineNbr
		AND	stimwordPosition.stimwordPositionWord 		=	clientStimwordREPLICATE.clientStimwordWord
		AND	stimwordPosition.stimwordPositionName		=	clientStimwordREPLICATE.clientStimwordName
		AND	stimwordPosition.stimwordPositionNbr		=	clientStimwordREPLICATE.clientStimwordNbr
		AND	stimwordPosition.stimwordPositionSetting	=	clientStimwordREPLICATE.clientStimwordSetting
		AND	stimwordPosition.stimwordPositionPhoneme	=	clientStimwordREPLICATE.clientStimwordPhoneme	
				## AND	stimwordPosition.stimwordPosition_target_sound_1	=	clientStimwordREPLICATE.clientStimword_target_sound_1	
				## AND	stimwordPosition.stimwordPosition_target_sound_2	=	clientStimwordREPLICATE.clientStimword_target_sound_2	
				## AND	stimwordPosition.stimwordPosition_target_sound_3	=	clientStimwordREPLICATE.clientStimword_target_sound_3	

		AND	clientStimwordREPLICATE.teacherEmail		=	'info@englishwithoutaccent.com'
		AND	clientStimwordREPLICATE.clientMasterrEmail	=	'mark@edwardsmark.com'
		AND	clientStimwordREPLICATE.clientMasterSessionName	=	'Time1'
		AND	clientStimwordREPLICATE.clientMastrdLayoutName	=	'P-ESL'
		)
		WHERE	1			/* dummy first one */
		AND	stimwordPosition.stimwordPositionLayoutName				=	'P-ESL'
		AND	stimwordPosition.stimwordPositionPageNbr				=	1
		AND	stimwordPosition.stimwordPositionLineNbr				=	1
		AND	stimwordPosition.stimwordPosition_stimulus_word				=	'Horse'
		ORDER BY	stimwordPosition.stimwordPositionAutoIncr
		;
