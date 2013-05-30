# From actions to stat
INSERT INTO actions (action_at, player_id, deploy_ap, destroy_ap, deployes, destroyes)
SELECT
	FROM_UNIXTIME(FLOOR(TIME/3600)*3600) `at`, player_id,
	SUM(IF(ACTION='deployed an', resonator,0)) `deploy_ap`,
	SUM(IF(ACTION='destroyed an', resonator, 0)) `destroy_ap`,
	COUNT(IF(ACTION='deployed an', resonator,NULL)) `deployes`,
	COUNT(IF(ACTION='destroyed an', resonator, NULL)) `destroyes`
FROM `ingress_tmp`.event_res
GROUP BY `at`, player_id