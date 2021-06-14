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

		,	clientStimwordCURRENT.clientContextError1		'clientContextError1_current'
		,	clientStimwordCURRENT.clientContextError2		'clientContextError2_current'
		,	clientStimwordCURRENT.clientContextError3		'clientContextError3_current'
		,	clientStimwordCURRENT.clientContextError4		'clientContextError4_current'
		,	clientStimwordREPLICATE.clientContextError1		'clientContextError1_replicate'
		,	clientStimwordREPLICATE.clientContextError2		'clientContextError2_replicate'
		,	clientStimwordREPLICATE.clientContextError3		'clientContextError3_replicate'
		,	clientStimwordREPLICATE.clientContextError4		'clientContextError4_replicate'

		FROM	stimwordPosition
		LEFT OUTER JOIN clientStimword clientStimwordCURRENT ON
		(	1
		AND	stimwordPosition.stimwordPositionLayoutName	=	clientStimwordCURRENT.clientMasterLayoutName
		AND	stimwordPosition.stimwordPositionPageNbr	=	clientStimwordCURRENT.clientStimwordPageNbr
		AND	stimwordPosition.stimwordPositionLineNbr	=	clientStimwordCURRENT.clientStimwordLineNbr
		AND	stimwordPosition.stimwordPositionWord 		=	clientStimwordCURRENT.clientStimwordWord

		AND	stimwordPosition.stimwordPositionName		=	clientStimwordCURRENT.clientContextPosition
		AND	stimwordPosition.stimwordPositionNbr		=	clientStimwordCURRENT.clientStimwordPositionNbr
		AND	stimwordPosition.stimwordPositionSetting	=	clientStimwordCURRENT.clientStimwordSetting

		AND	stimwordPosition.stimwordPositionPhoneme	=	clientStimwordCURRENT.clientContextPhoneme	
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
		AND	stimwordPosition.stimwordPositionLayoutName 	=	clientStimwordREPLICATE.clientMasterLayoutName
		AND	stimwordPosition.stimwordPositionPageNbr 	=	clientStimwordREPLICATE.clientStimwordPageNbr
		AND	stimwordPosition.stimwordPositionLineNbr	=	clientStimwordREPLICATE.clientStimwordLineNbr
		AND	stimwordPosition.stimwordPositionWord 		=	clientStimwordREPLICATE.clientStimwordWord

		AND	stimwordPosition.stimwordPositionName		=	clientStimwordREPLICATE.clientContextPosition
		AND	stimwordPosition.stimwordPositionNbr		=	clientStimwordREPLICATE.clientStimwordPositionNbr
		AND	stimwordPosition.stimwordPositionSetting	=	clientStimwordREPLICATE.clientStimwordSetting

		AND	stimwordPosition.stimwordPositionPhoneme	=	clientStimwordREPLICATE.clientContextPhoneme	
				## AND	stimwordPosition.stimwordPosition_target_sound_1	=	clientStimwordREPLICATE.clientStimword_target_sound_1	
				## AND	stimwordPosition.stimwordPosition_target_sound_2	=	clientStimwordREPLICATE.clientStimword_target_sound_2	
				## AND	stimwordPosition.stimwordPosition_target_sound_3	=	clientStimwordREPLICATE.clientStimword_target_sound_3	

		AND	clientStimwordREPLICATE.teacherEmail		=	'info@englishwithoutaccent.com'
		AND	clientStimwordREPLICATE.clientMasterEmail	=	'mark@edwardsmark.com'
		AND	clientStimwordREPLICATE.clientMasterSessionName	=	'Time1'
		AND	clientStimwordREPLICATE.clientMasterLayoutName	=	'P-ESL'
		)
		WHERE	1			/* dummy first one */
		AND	stimwordPosition.stimwordPositionLayoutName				=	'P-ESL'
		AND	stimwordPosition.stimwordPositionPageNbr				=	1
		AND	stimwordPosition.stimwordPositionLineNbr				=	1
		AND	stimwordPosition.stimwordPositionWord					=	'Horse'
		ORDER BY	stimwordPosition.stimwordPositionAutoIncr
		;

