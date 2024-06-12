

if stage_param != '' then

if date_start_param =  ''  OR date_end_param = '' then 

SELECT
		_business.TOKEN,
		_business.NAME,
		_stage.STAGE_NAME

	
	FROM WISELINK_BUSINESS.BUSINESS AS _business
		
		LEFT JOIN WISELINK_BUSINESS.STAGES AS _stage ON _stage.TOKEN = _business.STAGE_TOKEN
		JOIN WISELINK_BUSINESS.TIME_STAMP_REGISTRATIONS tm  ON tm.TOKEN= 	_business.CREATION_DATE
			
	WHERE 
		_business.COMPANY_TOKEN=CompanyToken_p and
		_business.CONTACT_TOKEN = contact_token_param and
		_stage.STAGE_NAME = stage_param
		ORDER BY 	FROM_UNIXTIME(	tm.TIME_STAMP)   DESC  ;

ELSE 



SELECT
		_business.TOKEN,
		_business.NAME,
		_stage.STAGE_NAME

	
	FROM WISELINK_BUSINESS.BUSINESS AS _business
		
		LEFT JOIN WISELINK_BUSINESS.STAGES AS _stage ON _stage.TOKEN = _business.STAGE_TOKEN
		JOIN WISELINK_BUSINESS.TIME_STAMP_REGISTRATIONS tm  ON tm.TOKEN= 	_business.CREATION_DATE
			
	WHERE 
		_business.COMPANY_TOKEN=CompanyToken_p and
		_business.CONTACT_TOKEN = contact_token_param and
		_stage.STAGE_NAME = stage_param
		AND ( FROM_UNIXTIME(date_start_param)   <=  FROM_UNIXTIME(tm.TIME_STAMP) AND FROM_UNIXTIME(tm.TIME_STAMP)     <=      FROM_UNIXTIME(date_end_param)    )
		
		
		ORDER BY 	FROM_UNIXTIME(	tm.TIME_STAMP)   DESC  ;


END  if ;


ELSE 


if date_start_param =  ''  OR date_end_param = '' then 
	SELECT
		_business.TOKEN,
		_business.NAME,
		_stage.STAGE_NAME
	FROM WISELINK_BUSINESS.BUSINESS AS _business
		
		LEFT JOIN WISELINK_BUSINESS.STAGES AS _stage ON _stage.TOKEN = _business.STAGE_TOKEN
	JOIN WISELINK_BUSINESS.TIME_STAMP_REGISTRATIONS tm  ON tm.TOKEN= 	_business.CREATION_DATE
			
	WHERE 
		_business.COMPANY_TOKEN=CompanyToken_p and
		_business.CONTACT_TOKEN = contact_token_param
		ORDER BY   	FROM_UNIXTIME(	tm.TIME_STAMP) DESC  ;
ELSE 


	if date_start_param =  ''  OR date_end_param = '' then 
	SELECT
		_business.TOKEN,
		_business.NAME,
		_stage.STAGE_NAME
	FROM WISELINK_BUSINESS.BUSINESS AS _business
		
		LEFT JOIN WISELINK_BUSINESS.STAGES AS _stage ON _stage.TOKEN = _business.STAGE_TOKEN
	JOIN WISELINK_BUSINESS.TIME_STAMP_REGISTRATIONS tm  ON tm.TOKEN= 	_business.CREATION_DATE
			
	WHERE 
		_business.COMPANY_TOKEN=CompanyToken_p and
		_business.CONTACT_TOKEN = contact_token_param AND
		 ( FROM_UNIXTIME(date_start_param) <=  FROM_UNIXTIME(tm.TIME_STAMP) AND FROM_UNIXTIME(tm.TIME_STAMP) <=  FROM_UNIXTIME(date_end_param) )
		ORDER BY   	FROM_UNIXTIME(	tm.TIME_STAMP) DESC  ;
		
		END if ;
	
END if ;		
