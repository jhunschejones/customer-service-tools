SELECT DISTINCT TOP 500														
LTrim([SBSB_ID])+'-0'+LTrim([MEME_SFX]) AS 'Member Number', LTrim([MEME_FIRST_NAME]) AS 'First', LTrim([MEME_LAST_NAME]) AS 'Last', 													
CONVERT (VARCHAR,MEPE.MEPE_EFF_DT,101) AS 'Eff Date', 													
CONVERT (VARCHAR,MEPE.MEPE_TERM_DT,101) AS 'Term Date', 													
MEPE.MEPE_ELIG_IND AS ELIG,													
GRGR.GRGR_ID AS 'Group #', 													
GRGR.GRGR_NAME AS 'Group Name', 	 												
MEPE.CSCS_ID AS 'Class', 													
MEPE.CSPI_ID AS 'Plan ID', 													
MEPE.PDPD_ID AS 'Product ID' 																								
                                                                                                                                                    
FROM CMCV_GRGR_BASE AS GRGR													
INNER JOIN CMCV_SBSB_BASE AS SBSB ON GRGR.GRGR_CK = SBSB.GRGR_CK 													
INNER JOIN CMCV_MEME_BASE AS MEME ON SBSB.SBSB_CK = MEME.SBSB_CK 													
INNER JOIN CMCV_MEPE_BASE AS MEPE ON MEME.MEME_CK = MEPE.MEME_CK													
INNER JOIN CMCV_CSPI_BASE AS CSPI ON MEME.GRGR_CK = CSPI.GRGR_CK													
INNER JOIN CMCV_PDDS_BASE AS PDDS ON CSPI.PDPD_ID = PDDS.PDPD_ID													
LEFT OUTER JOIN #VAL_CODES ON PDDS.PDDS_MCTR_VAL2 = #VAL_CODES.[Value Code] AND PDDS.PDDS_MCTR_BCAT = #VAL_CODES.[BCAT]													
                                                    
                                                                                                     
WHERE 													
MEPE.MEPE_ELIG_IND = 'Y'  													
AND MEPE.MEPE_EFF_DT >= '1/1/2016' 													
--AND MEPE.MEPE_TERM_DT >= '12/31/2014' 													
--AND GRGR.GRGR_ID = 'GROUP NUMBER' 													
--AND GRGR.GRGR_NAME LIKE '%ALASKA%'													
--AND MEPE.PDPD_ID Like '%PHSWELLE%' 													
--AND #VAL_CODES.[Value Code] = '4 DIGIT Alpha-numeric VAL CODE'													
--AND #VAL_CODES.[Long Code] = '7 DIGIT VAL CODE'													
--AND #VAL_CODES.[CS Team] = 'Commercial/ASO/Public Programs'     --sellect one													
