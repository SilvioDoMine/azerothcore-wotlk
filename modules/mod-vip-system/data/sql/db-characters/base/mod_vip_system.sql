CREATE TABLE IF NOT EXISTS `character_vip_status` (
  `guid` INT UNSIGNED NOT NULL,
  `expires_at` BIGINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`guid`),
  KEY `idx_expires` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
