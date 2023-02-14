CREATE SCHEMA IF NOT EXISTS `pokerfinal` DEFAULT CHARACTER SET utf8 ;
USE `pokerfinal` ;

-- -----------------------------------------------------
-- Table `pokerfinal`.`cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`cards` (
  `cardID` VARCHAR(2) NOT NULL,
  `cardName` VARCHAR(45) NOT NULL,
  `cardnumber` INT NOT NULL,
  `cardSuit` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cardID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`hands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`hands` (
  `handid` INT NOT NULL,
  `card1` VARCHAR(45) NULL,
  `card2` VARCHAR(45) NULL,
  `card3` VARCHAR(45) NULL,
  `card4` VARCHAR(45) NULL,
  `card5` VARCHAR(45) NULL,
  `cards_cardID` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`handid`),
  INDEX `fk_hands_cards_idx` (`cards_cardID` ASC) VISIBLE,
  CONSTRAINT `fk_hands_cards`
    FOREIGN KEY (`cards_cardID`)
    REFERENCES `pokerfinal`.`cards` (`cardID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`hands_hirearchy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`hands_hirearchy` (
  `id_hand_hirearchy` INT NOT NULL,
  `handrank` INT NOT NULL,
  `hands_handid` INT NOT NULL,
  PRIMARY KEY (`id_hand_hirearchy`),
  INDEX `fk_hands hirearchy_hands1_idx` (`hands_handid` ASC) VISIBLE,
  CONSTRAINT `fk_hands hirearchy_hands1`
    FOREIGN KEY (`hands_handid`)
    REFERENCES `pokerfinal`.`hands` (`handid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`Table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`Table` (
  `tableID` INT NOT NULL,
  `player1` VARCHAR(45) NULL,
  `player2` VARCHAR(45) NULL,
  `player3` VARCHAR(45) NULL,
  `player4` VARCHAR(45) NULL,
  `player5` VARCHAR(45) NULL,
  `player6` VARCHAR(45) NULL,
  `player7` VARCHAR(45) NULL,
  `player8` VARCHAR(45) NULL,
  `Players_playerid` INT NOT NULL,
  PRIMARY KEY (`tableID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`tourney_holdem_player_combinations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`tourney_holdem_player_combinations` (
  `id_hand` INT NOT NULL,
  `id_player` INT NOT NULL,
  `flg_f_highcard` TINYINT NULL,
  `flg_f_1pair` TINYINT NULL,
  `flg_f_2pair` TINYINT NULL,
  `flg_f_threeoak` TINYINT NULL,
  `flg_f_straight` TINYINT NULL,
  `flg_f_flush` TINYINT NULL,
  `flg_f_fullhouse` TINYINT NULL,
  `flg_f_fouroak` TINYINT NULL,
  `flg_f_strflush` TINYINT NULL,
  `flg_t_highcard` TINYINT NULL,
  `flg_t_1pair` TINYINT NULL,
  `flg_t_2pair` TINYINT NULL,
  `flg_t_threeoak` TINYINT NULL,
  `flg_t_straight` TINYINT NULL,
  `flg_t_flush` TINYINT NULL,
  `flg_t_fullhouse` TINYINT NULL,
  `flg_t_fouroak` TINYINT NULL,
  `flg_t_strflush` TINYINT NULL,
  `flg_r_highcard` TINYINT NULL,
  `flg_r_1pair` TINYINT NULL,
  `flg_r_2pair` TINYINT NULL,
  `flg_r_threeoak` TINYINT NULL,
  `flg_r_straight` TINYINT NULL,
  `flg_r_flush` TINYINT NULL,
  `flg_r_fullhouse` TINYINT NULL,
  `flg_r_fouroak` TINYINT NULL,
  `flg_r_strflush` TINYINT NULL,
  `id_f_hand_strength` SMALLINT NULL COMMENT 'Hand strength identifier on the flop',
  `id_f_kicker_strength` SMALLINT NULL COMMENT 'card identifier for the flop kicker.',
  `id_r_hand_strength` SMALLINT NULL,
  `id_r_kicker_strength` SMALLINT NULL,
  `id_t_hand_stength` SMALLINT NULL,
  `id_t_kicker_strength` VARCHAR(45) NULL,
  `val_f_hole_card_used` SMALLINT NULL,
  `val_t_hole_card_used` SMALLINT NULL,
  `val_r_hole_card_used` SMALLINT NULL,
  PRIMARY KEY (`id_hand`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`tourney_holdem_hand_summary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`tourney_holdem_hand_summary` (
  `id_hand` INT NOT NULL,
  `id_table` INT NULL,
  `cnt_players` SMALLINT NULL,
  `id_win_hand` SMALLINT NULL,
  `id_winner` INT NULL,
  `button` SMALLINT NULL,
  `card_1` SMALLINT NULL,
  `card_2` SMALLINT NULL,
  `card_3` SMALLINT NULL,
  `card_4` SMALLINT NULL,
  `card_5` SMALLINT NULL,
  PRIMARY KEY (`id_hand`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`holdem_hand_player_statistics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`holdem_hand_player_statistics` (
  `id_hand` INT NOT NULL,
  `id_player` INT NULL,
  `id_holecard` SMALLINT NULL,
  `flg_won_hand` TINYINT NULL,
  `amt_won` DECIMAL NULL,
  PRIMARY KEY (`id_hand`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`holdem_hand_summary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`holdem_hand_summary` (
  `id_hand` INT NOT NULL,
  `id_site` SMALLINT NOT NULL,
  `Id_limit` SMALLINT NOT NULL,
  `id_table` INT NOT NULL,
  `pot_amount` INT NULL,
  `id_win_hand` SMALLINT NOT NULL,
  `id_winner` INT NOT NULL,
  `button` INT NULL,
  `card1` SMALLINT NULL,
  `card2` SMALLINT NULL,
  `card3` SMALLINT NULL,
  `card4` SMALLINT NULL,
  `card5` SMALLINT NULL,
  `tourney_holdem_player_combinations_id_hand` INT NOT NULL,
  `tourney_holdem_hand_summary_id_hand` INT NOT NULL,
  `holdem_hand_player_statistics_id_hand` INT NOT NULL,
  PRIMARY KEY (`id_hand`),
  INDEX `fk_holdem_hand_summary_tourney_holdem_player_combinations1_idx` (`tourney_holdem_player_combinations_id_hand` ASC) VISIBLE,
  INDEX `fk_holdem_hand_summary_tourney_holdem_hand_summary1_idx` (`tourney_holdem_hand_summary_id_hand` ASC) VISIBLE,
  INDEX `fk_holdem_hand_summary_holdem_hand_player_statistics1_idx` (`holdem_hand_player_statistics_id_hand` ASC) VISIBLE,
  CONSTRAINT `fk_holdem_hand_summary_tourney_holdem_player_combinations1`
    FOREIGN KEY (`tourney_holdem_player_combinations_id_hand`)
    REFERENCES `pokerfinal`.`tourney_holdem_player_combinations` (`id_hand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_holdem_hand_summary_tourney_holdem_hand_summary1`
    FOREIGN KEY (`tourney_holdem_hand_summary_id_hand`)
    REFERENCES `pokerfinal`.`tourney_holdem_hand_summary` (`id_hand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_holdem_hand_summary_holdem_hand_player_statistics1`
    FOREIGN KEY (`holdem_hand_player_statistics_id_hand`)
    REFERENCES `pokerfinal`.`holdem_hand_player_statistics` (`id_hand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`holdem_table_session_summary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`holdem_table_session_summary` (
  `id_session` INT NOT NULL,
  `id_player` INT NOT NULL,
  `id_played_real` INT NOT NULL,
  `id_table` INT NOT NULL,
  `amt_pot` INT NULL,
  `amt_won` INT NULL,
  `cnt_hands` INT NULL,
  `cnt_hands_won` INT NULL,
  `cnt_ttl_players` INT NULL,
  `cnt_ttl_players_flop` INT NULL,
  PRIMARY KEY (`id_session`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`holdem_tabe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`holdem_tabe` (
  `id_table` INT NOT NULL,
  `table_name` TEXT NULL,
  `holdem_hand_summary_id_hand` INT NOT NULL,
  `holdem_table_session_summary_id_session` INT NOT NULL,
  `tourney_holdem_hand_summary_id_hand` INT NOT NULL,
  PRIMARY KEY (`id_table`),
  INDEX `fk_holdem_tabe_holdem_hand_summary1_idx` (`holdem_hand_summary_id_hand` ASC) VISIBLE,
  INDEX `fk_holdem_tabe_holdem_table_session_summary1_idx` (`holdem_table_session_summary_id_session` ASC) VISIBLE,
  INDEX `fk_holdem_tabe_tourney_holdem_hand_summary1_idx` (`tourney_holdem_hand_summary_id_hand` ASC) VISIBLE,
  CONSTRAINT `fk_holdem_tabe_holdem_hand_summary1`
    FOREIGN KEY (`holdem_hand_summary_id_hand`)
    REFERENCES `pokerfinal`.`holdem_hand_summary` (`id_hand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_holdem_tabe_holdem_table_session_summary1`
    FOREIGN KEY (`holdem_table_session_summary_id_session`)
    REFERENCES `pokerfinal`.`holdem_table_session_summary` (`id_session`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_holdem_tabe_tourney_holdem_hand_summary1`
    FOREIGN KEY (`tourney_holdem_hand_summary_id_hand`)
    REFERENCES `pokerfinal`.`tourney_holdem_hand_summary` (`id_hand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`holdem_hand_player_combinations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`holdem_hand_player_combinations` (
  `id_hand` INT NOT NULL,
  `id_player` INT NULL,
  `flg_f_highcard` TINYINT NULL,
  `flg_f_1pair` TINYINT NULL,
  `flg_f_2pair` TINYINT NULL,
  `flg_f_threeoak` TINYINT NULL,
  `flg_f_straight` TINYINT NULL,
  `flg_f_flush` TINYINT NULL,
  `flg_f_fullhouse` TINYINT NULL,
  `flg_f_fouroak` TINYINT NULL,
  `flg_f_strflush` TINYINT NULL,
  `id_f_hand_strength` SMALLINT NULL,
  `id_f_kicker_strength` SMALLINT NULL,
  `val_f_hole_cards_used` SMALLINT NULL,
  `flg_r_highcard` TINYINT NULL,
  `flg_r_1pair` TINYINT NULL,
  `flg_r_2pair` TINYINT NULL,
  `flg_r_threeoak` TINYINT NULL,
  `flg_r_straight` TINYINT NULL,
  `flg_r_flush` TINYINT NULL,
  `flg_r_fullhouse` TINYINT NULL,
  `flg_r_fouroak` TINYINT NULL,
  `flg_r_strflush` TINYINT NULL,
  `id_r_hand_strength` SMALLINT NULL,
  `id_r_kicker_strength` SMALLINT NULL,
  `val_r_hole_cards_used` SMALLINT NULL,
  `holdem_hand_player_combinationscol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_hand`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`player` (
  `id_player` INT NOT NULL,
  `player_name` VARCHAR(45) NULL,
  `player_country` VARCHAR(45) NULL,
  PRIMARY KEY (`id_player`))
  
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`table_notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`table_notes` (
  `id_note` INT NOT NULL,
  `id_x` INT NULL,
  `enum_type` VARCHAR(45) NULL,
  `date_note` TIMESTAMP NULL,
  `notes` VARCHAR(500) NULL,
  PRIMARY KEY (`id_note`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`lookup_hand_ranks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`lookup_hand_ranks` (
  `id_hand_rank` INT NOT NULL,
  `id_group` INT NULL,
  `group_name(FK)` VARCHAR(20) NULL,
  PRIMARY KEY (`id_hand_rank`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`lookup_hand_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`lookup_hand_groups` (
  `id_group` INT NOT NULL,
  `group_name` VARCHAR(20) NOT NULL,
  `tourney_holdem_player_combinations_id_hand` INT NOT NULL,
  `holdem_hand_player_combinations_id_hand` INT NOT NULL,
  `lookup_hand_ranks_id_hand_rank` INT NOT NULL,
  PRIMARY KEY (`id_group`, `lookup_hand_ranks_id_hand_rank`),
  INDEX `fk_lookup_hand_groups_tourney_holdem_player_combinations1_idx` (`tourney_holdem_player_combinations_id_hand` ASC) VISIBLE,
  INDEX `fk_lookup_hand_groups_holdem_hand_player_combinations1_idx` (`holdem_hand_player_combinations_id_hand` ASC) VISIBLE,
  INDEX `fk_lookup_hand_groups_lookup_hand_ranks1_idx` (`lookup_hand_ranks_id_hand_rank` ASC) VISIBLE,
  CONSTRAINT `fk_lookup_hand_groups_tourney_holdem_player_combinations1`
    FOREIGN KEY (`tourney_holdem_player_combinations_id_hand`)
    REFERENCES `pokerfinal`.`tourney_holdem_player_combinations` (`id_hand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lookup_hand_groups_holdem_hand_player_combinations1`
    FOREIGN KEY (`holdem_hand_player_combinations_id_hand`)
    REFERENCES `pokerfinal`.`holdem_hand_player_combinations` (`id_hand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lookup_hand_groups_lookup_hand_ranks1`
    FOREIGN KEY (`lookup_hand_ranks_id_hand_rank`)
    REFERENCES `pokerfinal`.`lookup_hand_ranks` (`id_hand_rank`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pokerfinal`.`lookup_position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokerfinal`.`lookup_position` (
  `cnt_players` INT NOT NULL,
  `position` INT NULL,
  `flg_blinds` TINYINT NULL,
  `flg_ep` TINYINT NULL,
  `flg_mp` TINYINT NULL,
  `flg_lp` TINYINT NULL,
  PRIMARY KEY (`cnt_players`))
ENGINE = InnoDB;

insert into cards values
(13,"Ace of hearts", 1, 'heart'),
(1,"2 of hearts", 2, 'heart'),
(2,"3 of hearts", 3, 'heart'),
(3,"4 of hearts", 4, 'heart'),
(4,"5 of hearts", 5, 'heart'),
(5,"6 of hearts", 6, 'heart'),
(6,"7 of hearts", 7, 'heart'),
(7,"8 of hearts", 8, 'heart'),
(8,"9 of hearts", 9, 'heart'),
(9,"10 of hearts", 10, 'heart'),
(10,"Jack of hearts", 11, 'heart'),
(11,"Queen of hearts", 12, 'heart'),
(12,"King of hearts", 13, 'heart'),
(14,"Ace of clubs", 1, 'club'),
(15,"2 of clubs", 2, 'club'),
(16,"3 of clubs", 3, 'club'),
(17,"4 of clubs", 4, 'club'),
(18,"5 of clubs", 5, 'club'),
(19,"6 of clubs", 6, 'club'),
(20,"7 of clubs", 7, 'club'),
(21,"8 of clubs", 8, 'club'),
(22,"9 of clubs", 9, 'club'),
(23,"10 of clubs", 10, 'club'),
(24,"Jack of clubs", 11, 'club'),
(25,"Queen of clubs", 12, 'club'),
(26,"King of clubs", 13, 'club'),
(27,"Ace of spades", 1, 'spade'),
(28,"2 of spades", 2, 'spade'),
(29,"3 of spades", 3, 'spade'),
(30,"4 of spades", 4, 'spade'),
(31,"5 of spades", 5, 'spade'),
(32,"6 of spades", 6, 'spade'),
(33,"7 of spades", 7, 'spade'),
(34,"8 of spades", 8, 'spade'),
(35,"9 of spades", 9, 'spade'),
(36,"10 of spades", 10, 'spade'),
(37,"Jack of spades", 11, 'spade'),
(38,"Queen of spades", 12, 'spade'),
(39,"King of spades", 13, 'spade'),
(40,"Ace of diamonds", 1, 'diamond'),
(41,"2 of diamonds", 2, 'diamond'),
(42,"3 of diamonds", 3, 'diamond'),
(43,"4 of diamonds", 4, 'diamond'),
(44,"5 of diamonds", 5, 'diamond'),
(45,"6 of diamonds", 6, 'diamond'),
(46,"7 of diamonds", 7, 'diamond'),
(47,"8 of diamonds", 8, 'diamond'),
(48,"9 of diamonds", 9, 'diamond'),
(49,"10 of diamonds", 10, 'diamond'),
(50,"Jack of diamonds", 11, 'diamond'),
(51,"Queen of diamonds", 12, 'diamond'),
(52,"King of diamonds", 13, 'diamond');

insert into player values
(01,"Doyle Brunson", "USA"),
(02,"Stephen Chidwick","Britain"),
(03,"Phil Hellmuth","USA"),
(04,"Timothy Adams","Canada"),
(05,"Benjamin Pollak","France");

insert into lookup_position values
(05,02,1,0,0,0),
(06,01,1,0,0,0),
(07,03,0,0,0,0),
(08,05,0,0,0,0),
(09,04,0,0,0,0);

insert into lookup_hand_ranks values 
(01, 1, "straighflush"),
(02, 2, "fullhouse"),
(03, 3, "flush"),
(04, 4, "straight"),
(05, 5, "threeofakind"),
(06, 6, "twopair"),
(07, 7, "onepair"),
(08, 8, "highcard");


insert into holdem_hand_player_statistics values
( 44,01,02,00,10000),
(55,02,01,01,25000),
(33,04,00,01,30000),
(22,03,02,00,7000),
(11,05,01,02,13000);



insert into holdem_hand_player_combinations values
(51,01,0,1,0,0,0,0,0,0,0,2,1,0,1,0,0,0,0,0,0,0,2,0,1,0,1),
(41,02,1,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,2,0,0,1,0),
(31,03,0,1,0,0,0,0,0,0,0,2,1,0,1,0,0,0,0,0,0,0,2,0,1,0,2),
(21,04,0,1,0,0,0,0,0,0,0,2,1,0,1,0,0,0,0,0,0,0,2,0,1,0,3),
(11,05,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,0,0,04),
(52,01,1,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,2,0,1,0,05),
(42,02,1,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,2,0,1,0,6),
(32,03,1,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,0,0,0,2,0,0,1,7),
(22,04,0,1,0,0,0,0,0,0,0,2,1,0,1,0,0,0,0,0,0,0,2,0,1,0,8),
(12,05,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,0,0,9),
(53,01,1,0,0,0,0,0,0,0,0,1,0,1,1,0,0,0,0,0,0,0,2,0,1,0,11),
(43,02,1,0,0,0,0,0,0,0,0,1,0,1,0,1,0,0,0,0,0,0,2,0,0,0,12),
(33,03,1,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,0,0,0,0,2,0,1,0,13),
(23,04,0,1,0,0,0,0,0,0,0,2,0,1,0,0,0,1,0,0,0,0,0,1,0,0,14),
(13,05,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,1,1,0,0,0,15),
(54,01,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,2,0,1,0,0,16),
(44,02,1,0,0,0,0,0,0,0,0,1,0,1,1,0,0,0,0,0,0,2,0,1,0,0,17),
(34,03,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,2,0,0,1,0,18),
(24,04,0,1,0,0,0,0,0,0,0,2,0,1,0,0,0,0,0,0,1,2,0,1,0,0,19),
(14,05,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,20),
(55,01,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,2,0,1,1,0,0,21),
(45,02,1,0,0,0,0,0,0,0,0,1,0,1,1,0,0,0,0,0,0,2,0,1,0,0,22),
(35,03,1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,2,0,0,0,0,23),
(25,04,0,1,0,0,0,0,0,0,0,2,1,0,0,0,1,0,0,0,0,2,0,1,0,0,24),
(15,05,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1,1,0,1,0,25),
(56,01,1,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,0,2,0,1,0,0,26),
(46,02,1,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,1,0,2,0,1,0,0,27),
(36,03,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,1,2,0,0,1,0,0,28),
(26,04,0,1,0,0,0,0,0,0,2,0,1,0,0,0,0,0,0,0,2,1,0,1,0,0,29),
(16,05,1,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,1,0,0,0,30);


