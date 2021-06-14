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

