INSERT INTO `role_name` (`Role`, `Table`, `FullName`) VALUES
  (1, 'student', 'kollégiumi diák'),
  (2, 'teacher', 'nevelőtanár');

INSERT INTO `user` (`UID`, `Role`, `Name`, `Gender`, `OM`) VALUES
  (1, 1, 'Várnagy Miklós Tamás', b'1', '73454685362'),
  (2, 1, 'Katona Márton Barnabás', b'1', '72745678344'),
  (3, 1, 'Bende Ákos György', b'1', '74583725375'),
  (4, 1, 'Bencsik Gergő', b'1', '72345456628'),
  (5, 2, 'Dobos József', b'1', '72237485955'),
  (6, 1, 'Varró Liza', b'0', '77685796872'),
  (7, 1, 'Páter Zsófia Édua', b'0', '77348695718');

INSERT INTO `auth` (`UID`, `access_token`, `refresh_token`, `expires`, `expired`) VALUES
  (1, 'P8kj-8K7kJM-hT9RQDUH8L-v..01.yy2', NULL, 4294967295, b'0'),
  (3, '/HSM/Jgh74lf7ygp3_Id6C4~~xe5M53R', NULL, 4294967295, b'0'),
  (6, '/5.Q~RhtNkd.M/w4txuP35rmDKkddXu2', 'VZ7R0ChS93Sr46y7lXYQUSnb0A7Np/ZT', 4294967295, b'0'),
  (5, 'Anca577M3u.~un7z~j9pj3/67rsF/~/3', NULL, 4294967295, b'0');

INSERT INTO `class` (`ID`, `Class`) VALUES
  (1, '11.B'),
  (2, '9.A'),
  (3, '12.E');
INSERT INTO `group` (`ID`, `Group`, `HeadTUID`) VALUES
  (1, 'F1', 5),
  (2, 'F3', 5),
  (3, 'F8', 5);

INSERT INTO `annexe` VALUES
  (1, 'A Épület'),
  (2, 'B Épület');

INSERT INTO `dorm_room` VALUES
  (172, 1, 1, 3),
  (131, 1, 1, 1),
  (17, 2, 0, 2);

INSERT INTO `login_data` (`UID`, `Username`, `Password`) VALUES
  (1, 'Miki', 'almafa1234'),
  (2, 'Barnabás', 'almafa1234'),
  (3, 'Gyuri', 'almafa1234'),
  (4, 'Gergő', 'almafa1234'),
  (5, 'DJ', 'almafa1234'),
  (6, 'Lizz', 'almafa1234');

INSERT INTO `professions` VALUES
  (1, 'Általános Pedagógus', 'Bármi amit csak akarsz, ezermester, tanár.');

INSERT INTO `teacher` VALUES 
  (5, 1);

INSERT INTO `contacts` VALUES
  (7773, 'TheBigVMT', 'Várnagy Miklós Tamás', '@Josh', 'xdxd1243@gmail.com');

INSERT INTO `student` (`UID`, `GroupID`, `ClassID`, `School`, `Birthplace`, `Birthdate`, `GuardianName`, `GuardianPhone`, `RID`, `Country`, `City`, `Street`, `PostCode`, `Address`, `Floor`, `Door`, `ContactID`) VALUES
  (1, 3, 1, 'BMSZC Puskás Tivadar Távközlési Technikum', 'Budapest', '2023-02-26', 'Papp Lajos', '36 64 865 3423', 172, 'Új-Zéland', 'Hamilton', 'Clarkin Road', 3214, 2, NULL, NULL, 7773),
  (2, 3, 1, 'BMSZC Puskás Tivadar Távközlési Technikum', 'Budapest', '2005-07-22', 'Kis Gazsiné', '213 676 33 87 93', 172, 'Afganistan', 'Kabul', 'Asmayi Road', 553, 8, 3, NULL, NULL),
  (3, 1, 1, 'BMSZC Puskás Tivadar Távközlési Technikum', 'Budapest', '2005-08-15', 'Kalapos József', '43 673 527890180', 131, 'Austria', 'Graz', 'Plüddemanngasse', 8010, 62, 32, 3, NULL),
  (4, 1, 1, 'BMSZC Puskás Tivadar Távközlési Technikum', 'Budapest', '2004-02-28', 'Tóth András', '36 90 343 5454', 131, 'Uganda', 'Kampala', 'Kabalega Close', NULL, 16, NULL, NULL, NULL),
  (6, 2, 2, 'BMSZC Puskás Tivadar Távközlési Technikum', 'Budapest', '2008-07-08', 'Magyar Béla', '36 20 387 5254', 17, 'Dél-Kórea', 'Seoul', 'Opaesan-ro', NULL, 11, NULL, NULL, NULL),
  (7, 2, 3, 'BMSZC Puskás Tivadar Távközlési Technikum', 'Budapest', '2004-11-30', 'Kisfaludy Zoltán', '36 70 322 9834', 17, 'Japán', 'Tokió', 'Sekiguchi', NULL, 3, NULL, NULL, NULL);

INSERT INTO `resident` VALUES
  (1, 172, 0),
  (2, 172, 1),
  (3, 131, 0),
  (4, 131, 1),
  (6, 17, 0),
  (7, 17, 1);

INSERT INTO `program_types` VALUES
  (1, 1, 'Honismeret', 33, 5),
  (2, 1, 'Asztrofizika', 23, 5),
  (3, 2, 'Falfestés', 18, 5),
  (4, 2, 'Felelőtlen Gyermeknevelés', 19, 5);

INSERT INTO `day_type_names` VALUES
  (1, 'tanulásra készülő nap'),
  (2, 'tanuló nap'),
  (3, 'tanulást befejező nap'),
  (4, 'tanulásmentes nap');

INSERT INTO `lessons` VALUES
  (1, 1, '16:00:00', '16:45:00'),
  (1, 2, '16:50:00', '16:35:00'),
  (1, 3, '16:40:00', '17:25:00'),
  (1, 4, '17:30:00', '18:15:00'),
  (2, 1, '16:05:00', '16:50:00'),
  (2, 2, '16:55:00', '16:40:00'),
  (2, 3, '16:45:00', '17:30:00'),
  (2, 4, '17:35:00', '18:20:00');

INSERT INTO `day_type` VALUES
  (1, 1, '8:00:00', '8:00:00', '12:00:00', '15:45:00', 1, '20:15:00', '21:00:00', '22:00:00', '22:30:00', '6:00:00', '8:00:00', '13:00:00', '15:45:00', '18:00:00', '20:00:00', ADDDATE(CURDATE(), -1)),
  (2, 2, '6:00:00', '8:00:00', '12:00:00', '15:45:00', 2, '20:15:00', '21:00:00', '22:00:00', '22:30:00', '6:00:00', '8:00:00', '13:00:00', '15:45:00', '18:00:00', '20:00:00', CURDATE()),
  (3, 1, '8:00:00', '8:00:00', '12:00:00', '15:45:00', 1, '20:15:00', '21:00:00', '22:00:00', '22:30:00', '6:00:00', '8:00:00', '13:00:00', '15:45:00', '18:00:00', '20:00:00', ADDDATE(CURDATE(), 3));

INSERT INTO `date` VALUES
  (CURDATE(), 2),
  (ADDDATE(CURDATE(), 1), 1);

INSERT INTO `program` VALUES
  (1, 1, CURDATE(), 0, 1),
  (2, 1, CURDATE(), 2, 2),
  (3, 2, CURDATE(), 4, 1),
  (4, 2, ADDDATE(CURDATE(), 1), 0, 2),
  (5, 3, CURDATE(), 0, 1),
  (6, 4, CURDATE(), 2, 1);

INSERT INTO `mandatory_program` VALUES
  (1, 1),
  (2, 2),
  (3, 1),
  (4, 1);

INSERT INTO `study_group_program` VALUES
  (5),
  (6);

INSERT INTO `study_group_attendees` VALUES 
  (1, 1, 3),
  (2, 3, 3),
  (3, 1, 4);


INSERT INTO `mifare_tags` (UID, Bytes) VALUES (1, x'b69f6669d72c5ce0f0c4bac027cd961c9c9ad06fdaf5e93244297a64fc555a7a');
