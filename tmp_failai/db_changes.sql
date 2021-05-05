-- Klietnų db pakeitimas 04-27

ALTER TABLE `klientai` CHANGE `traumosLigos` `traumos_ligos` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

ALTER TABLE `raumenys` ADD FOREIGN KEY (`id_raumenu_grupes`) REFERENCES `raumenu_grupes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE `treniruociu_planai` ADD `rusis` ENUM('cardio','jegos','bfp','ištvermes','mases auginimas','raumenu ryškinimas','atstatomoji','lankstumo','svorio metimo','kita') NULL DEFAULT 'kita' AFTER `pav`, ADD INDEX (`rusis`);

