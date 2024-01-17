INSERT INTO `errors` (`Keyword`, `Code`, `Description`) VALUES
  ('missing_permissions', 403, 'You do not have sufficient permissions for the resource.'),
  ('missing_data', 400, 'No data was provided in POST request body.'),
  ('invalid_data', 400, 'Data provided in POST body was invalid.'),
  ('invalid_content_type', 400, 'Invalid Content-Type value or header missing.'),
  ('missing_resource', 404, 'The resource requested was not found.'),
  ('missing_auth_field', 400, 'The Authorization header field is not present.'),
  ('missing_bearer_prefix', 400, 'The Authorization header is not prefixed by "Bearer".'),
  ('invalid_token', 401, 'The provided token was incorrect or missing.'),
  ('token_expired', 401, 'The token used has expired.'),
  ('invalid_grant', 400, 'The grant_type parameter is missing or wrong.'),
  ('missing_credentials', 400, 'Some of the credentials provided are missing.'),
  ('invalid_password', 400, 'The password provided was incorrect.'),
  ('invalid_username', 400, 'The username provided was incorrect.');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'student', 'UID', b'1'),
  (1, 'student', 'Name', b'1'),
  (1, 'student', 'Gender', b'1'),
  (1, 'student', 'Picture', b'1'),
  (1, 'student', 'GroupID', b'1'),
  (1, 'student', 'ClassID', b'1'),
  (1, 'student', 'School', b'1'),
  (1, 'student', 'RID', b'1'),
  (1, 'student', 'ContactID', b'1'),

  (1, 'student', 'Birthdate', b'0'),
  (1, 'student', 'GuardianName', b'0'),
  (1, 'student', 'GuardianPhone', b'0'),
  (1, 'student', 'Country', b'0'),
  (1, 'student', 'City', b'0');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'contacts', 'ID', b'1'),
  (1, 'contacts', 'Discord', b'1'),
  (1, 'contacts', 'Facebook', b'1'),
  (1, 'contacts', 'Instagram', b'1'),
  (1, 'contacts', 'Email', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'teacher', 'UID', b'1'),
  (1, 'teacher', 'Name', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'mifare_tags', 'UID', b'0'),
  (1, 'mifare_tags', 'Issued', b'0'),
  (1, 'mifare_tags', 'Bytes', b'0');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'dorm_room', 'RID', b'1'),
  (1, 'dorm_room', 'AID', b'1'),
  (1, 'dorm_room', 'GroupID', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'annexe', 'ID', b'1'),
  (1, 'annexe', 'Annexe', b'1'),
  (1, 'annexe', 'Gender', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'resident', 'UID', b'1'),
  (1, 'resident', 'RID', b'0'),
  (1, 'resident', 'BedNum', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'program_types', 'ID', b'1'),
  (1, 'program_types', 'Type', b'1'),
  (1, 'program_types', 'Topic', b'1'),
  (1, 'program_types', 'RID', b'1'),
  (1, 'program_types', 'TUID', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'program', 'ID', b'1'),
  (1, 'program', 'ProgramID', b'1'),
  (1, 'program', 'Date', b'1'),
  (1, 'program', 'Lesson', b'1'),
  (1, 'program', 'Length', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'date', 'DateID', b'1'),
  (1, 'date', 'DayTypeID', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'lessons', 'VersionID', b'1'),
  (1, 'lessons', 'LessonNum', b'1'),
  (1, 'lessons', 'StartTime', b'1'),
  (1, 'lessons', 'EndTime', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'day_type', 'ID', b'1'),
  (1, 'day_type', 'TypeID', b'1'),
  (1, 'day_type', 'DayStart', b'1'),
  (1, 'day_type', 'RoomRating', b'1'),
  (1, 'day_type', 'MiddayAttendance', b'1'),
  (1, 'day_type', 'DayArrival', b'1'),
  (1, 'day_type', 'LessonsVersion', b'1'),
  (1, 'day_type', 'NightArrivalRed', b'1'),
  (1, 'day_type', 'NightArrivalYellow', b'1'),
  (1, 'day_type', 'NightEnd', b'1'),
  (1, 'day_type', 'EveningAttendance', b'1'),
  (1, 'day_type', 'BreakfastStart', b'1'),
  (1, 'day_type', 'BreakfastEnd', b'1'),
  (1, 'day_type', 'DinnerStart', b'1'),
  (1, 'day_type', 'DinnerEnd', b'1'),
  (1, 'day_type', 'SupperStart', b'1'),
  (1, 'day_type', 'SupperEnd', b'1'),
  (1, 'day_type', 'ActiveOn', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'day_type_names', 'ID', b'1'),
  (1, 'day_type_names', 'DayName', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'mandatory_program', 'ID', b'1'),
  (1, 'mandatory_program', 'ClassID', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'study_group_program', 'ID', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'study_group_attendees', 'ID', b'1'),
  (1, 'study_group_attendees', 'UID', b'1'),
  (1, 'study_group_attendees', 'GroupID', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'class', 'ID', b'1'),
  (1, 'class', 'Class', b'1'),
  (1, 'class', 'Old', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'group', 'ID', b'1'),
  (1, 'group', 'Group', b'1'),
  (1, 'group', 'Old', b'1'),
  (1, 'group', 'HeadTUID', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'student', 'UID', b'1'),
  (2, 'student', 'Name', b'1'),
  (2, 'student', 'Gender', b'1'),
  (2, 'student', 'Picture', b'1'),
  (2, 'student', 'GroupID', b'1'),
  (2, 'student', 'ClassID', b'1'),
  (2, 'student', 'School', b'1'),
  (2, 'student', 'RID', b'1'),
  (2, 'student', 'ContactID', b'1'),
  (2, 'student', 'Birthdate', b'1'),
  (2, 'student', 'GuardianName', b'1'),
  (2, 'student', 'GuardianPhone', b'1'),
  (2, 'student', 'Country', b'1'),
  (2, 'student', 'City', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'contacts', 'ID', b'1'),
  (2, 'contacts', 'Discord', b'1'),
  (2, 'contacts', 'Facebook', b'1'),
  (2, 'contacts', 'Instagram', b'1'),
  (2, 'contacts', 'Email', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'teacher', 'UID', b'1'),
  (2, 'teacher', 'Name', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'mifare_tags', 'UID', b'1'),
  (2, 'mifare_tags', 'Issued', b'1'),
  (2, 'mifare_tags', 'Bytes', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'dorm_room', 'RID', b'1'),
  (2, 'dorm_room', 'AID', b'1'),
  (2, 'dorm_room', 'GroupID', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'annexe', 'ID', b'1'),
  (2, 'annexe', 'Annexe', b'1'),
  (2, 'annexe', 'Gender', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'resident', 'UID', b'1'),
  (2, 'resident', 'RID', b'0'),
  (2, 'resident', 'BedNum', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'date', 'DateID', b'1'),
  (2, 'date', 'DayTypeID', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'lessons', 'VersionID', b'1'),
  (2, 'lessons', 'LessonNum', b'1'),
  (2, 'lessons', 'StartTime', b'1'),
  (2, 'lessons', 'EndTime', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'day_type', 'ID', b'1'),
  (2, 'day_type', 'TypeID', b'1'),
  (2, 'day_type', 'DayStart', b'1'),
  (2, 'day_type', 'RoomRating', b'1'),
  (2, 'day_type', 'MiddayAttendance', b'1'),
  (2, 'day_type', 'DayArrival', b'1'),
  (2, 'day_type', 'LessonsVersion', b'1'),
  (2, 'day_type', 'NightArrivalRed', b'1'),
  (2, 'day_type', 'NightArrivalYellow', b'1'),
  (2, 'day_type', 'NightEnd', b'1'),
  (2, 'day_type', 'EveningAttendance', b'1'),
  (2, 'day_type', 'BreakfastStart', b'1'),
  (2, 'day_type', 'BreakfastEnd', b'1'),
  (2, 'day_type', 'DinnerStart', b'1'),
  (2, 'day_type', 'DinnerEnd', b'1'),
  (2, 'day_type', 'SupperStart', b'1'),
  (2, 'day_type', 'SupperEnd', b'1'),
  (2, 'day_type', 'ActiveOn', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'day_type_names', 'ID', b'1'),
  (2, 'day_type_names', 'DayName', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'class', 'ID', b'1'),
  (2, 'class', 'Class', b'1'),
  (2, 'class', 'Old', b'1');

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'group', 'ID', b'1'),
  (2, 'group', 'Group', b'1'),
  (2, 'group', 'Old', b'1'),
  (2, 'group', 'HeadTUID', b'1');

INSERT INTO `route_access` VALUES (1, '/api/institution', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/institution', b'1', b'0');
-- INSERT INTO `route_access` VALUES (1, '/api/institution/annexes', b'1', b'0');
-- INSERT INTO `route_access` VALUES (2, '/api/institution/annexes', b'1', b'0');
-- INSERT INTO `route_access` VALUES (1, '/api/institution/annexes/:id', b'1', b'0');
-- INSERT INTO `route_access` VALUES (2, '/api/institution/annexes/:id', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/institution/groups', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/institution/groups', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/institution/classes', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/institution/classes', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/institution/groups/:id', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/institution/groups/:id', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/institution/classes/:id', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/institution/classes/:id', b'1', b'0');

INSERT INTO `route_access` VALUES (1, '/api/crossings/events', b'0', b'1');
INSERT INTO `route_access` VALUES (2, '/api/crossings/events', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/crossings/me', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/crossings/me', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/crossings/:id', b'0', b'1');
INSERT INTO `route_access` VALUES (2, '/api/crossings/:id', b'1', b'0');

INSERT INTO `route_access` VALUES (1, '/api/users', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/users', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/users/me', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/users/me', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/users/:id', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/users/:id', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/users/:id', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/users/mifare', b'0', b'0');
INSERT INTO `route_access` VALUES (2, '/api/users/mifare', b'1', b'0');

INSERT INTO `route_access` VALUES (1, '/api/rooms', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/rooms', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/rooms/me', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/rooms/me', b'0', b'1');
INSERT INTO `route_access` VALUES (1, '/api/rooms/:id', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/rooms/:id', b'1', b'0');

INSERT INTO `route_access` VALUES (1, '/api/timetable', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/timetable', b'0', b'1');
INSERT INTO `route_access` VALUES (1, '/api/timetable/mandatory', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/timetable/mandatory', b'0', b'1');
INSERT INTO `route_access` VALUES (1, '/api/timetable/mandatory/:id', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/timetable/mandatory/:id', b'0', b'1');
INSERT INTO `route_access` VALUES (1, '/api/timetable/mandatory/types', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/timetable/mandatory/types', b'1', b'0');
INSERT INTO `route_access` VALUES (1, '/api/timetable/mandatory/types/:id', b'1', b'0');
INSERT INTO `route_access` VALUES (2, '/api/timetable/mandatory/types/:id', b'1', b'0');