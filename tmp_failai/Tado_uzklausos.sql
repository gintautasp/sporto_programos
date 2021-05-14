SELECT `raumenys`.`id_raumens`,`raumenys`.`pav`,`raumenys`.`id_raumenu_grupes`,
`pratimai`.`id`,`pratimai`.`pav`,`pratimai`.`lygis_sunkumo`,`pratimai`.`id_kito_lygio`,
FROM `raumenys`,`pratimai`
LEFT JOIN `pratimai` ON `raumenys`.`id_raumens` = `pratimai`.`lygis_sunkumo`
GROUP BY `raumenys`.`id_raumens`,`pratimai`.`lygis_sunkumo`


SELECT `raumenys`.`id_raumens`,`raumenys`.`pav`,`raumenys`.`id_raumenu_grupes`,
`pratimai`.`id`,`pratimai`.`pav`,`pratimai`.`lygis_sunkumo`,`pratimai`.`id_kito_lygio`
FROM `raumenys`
LEFT JOIN `pratimai_raumenys` ON `raumenys`.`id_raumens` = `pratimai_raumenys`.`id_raumenys`
LEFT JOIN `pratimai` ON `pratimai_raumenys`.`id_pratimai` = `pratimai_raumenys`.`id`
GROUP BY `raumenys`.`id_raumens`,`pratimai`.`lygis_sunkumo`

SELECT `raumenys`.`id_raumens`,`raumenys`.`pav`,`raumenys`.`id_raumenu_grupes`,
`pratimai`.`id`,`pratimai`.`pav`,`pratimai`.`lygis_sunkumo`,`pratimai`.`id_kito_lygio`
FROM `pratimai`
LEFT JOIN `pratimai_raumenys` ON `pratimai_raumenys`.`id_pratimai` = `pratimai_raumenys`.`id`
LEFT JOIN `raumenys` ON `raumenys`.`id_raumens` = `pratimai_raumenys`.`id_raumenys`
GROUP BY `raumenys`.`id_raumens`,`pratimai`.`lygis_sunkumo`

SELECT `raumenys`.`id_raumens`,`raumenys`.`pav`,`raumenys`.`id_raumenu_grupes`,
`pratimai`.`id`,`pratimai`.`pav`,`pratimai`.`lygis_sunkumo`,`pratimai`.`id_kito_lygio`
FROM `pratimai`
LEFT JOIN `pratimai_raumenys` ON `pratimai_raumenys`.`id_pratimai` = `pratimai`.`id`
LEFT JOIN `raumenys` ON `raumenys`.`id_raumens` = `pratimai_raumenys`.`id_raumenys`
