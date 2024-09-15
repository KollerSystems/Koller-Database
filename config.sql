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
  (1, 'user', 'UID', true),
  (1, 'user', 'Name', true),
  (1, 'user', 'Gender', true),
  (1, 'user', 'Picture', true),
  (1, 'user', 'Role', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'student', 'UID', true),
  (1, 'student', 'GroupID', true),
  (1, 'student', 'ClassID', true),
  (1, 'student', 'School', true),
  (1, 'student', 'RID', true),
  (1, 'student', 'ContactID', true),

  (1, 'student', 'Birthdate', false),
  (1, 'student', 'GuardianName', false),
  (1, 'student', 'GuardianPhone', false),
  (1, 'student', 'Country', false),
  (1, 'student', 'City', false);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'contacts', 'ID', true),
  (1, 'contacts', 'Discord', true),
  (1, 'contacts', 'Facebook', true),
  (1, 'contacts', 'Instagram', true),
  (1, 'contacts', 'Email', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'professions', 'PID', true),
  (1, 'professions', 'Name', true),
  (1, 'professions', 'Description', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'teacher', 'UID', true),
  (1, 'teacher', 'PID', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'mifare_tags', 'UID', false),
  (1, 'mifare_tags', 'Issued', false),
  (1, 'mifare_tags', 'Bytes', false);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'dorm_room', 'RID', true),
  (1, 'dorm_room', 'AID', true),
  (1, 'dorm_room', 'Floor', true),
  (1, 'dorm_room', 'GroupID', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'annexe', 'ID', true),
  (1, 'annexe', 'Annexe', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'resident', 'UID', true),
  (1, 'resident', 'RID', false),
  (1, 'resident', 'BedNum', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'program_types', 'ID', true),
  (1, 'program_types', 'Type', true),
  (1, 'program_types', 'Topic', true),
  (1, 'program_types', 'RID', true),
  (1, 'program_types', 'TUID', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'program', 'ID', true),
  (1, 'program', 'ProgramID', true),
  (1, 'program', 'Date', true),
  (1, 'program', 'Lesson', true),
  (1, 'program', 'Length', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'date', 'DateID', true),
  (1, 'date', 'DayTypeID', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'lessons', 'VersionID', true),
  (1, 'lessons', 'LessonNum', true),
  (1, 'lessons', 'StartTime', true),
  (1, 'lessons', 'EndTime', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'day_type', 'ID', true),
  (1, 'day_type', 'TypeID', true),
  (1, 'day_type', 'DayStart', true),
  (1, 'day_type', 'RoomRating', true),
  (1, 'day_type', 'MiddayAttendance', true),
  (1, 'day_type', 'DayArrival', true),
  (1, 'day_type', 'LessonsVersion', true),
  (1, 'day_type', 'NightArrivalRed', true),
  (1, 'day_type', 'NightArrivalYellow', true),
  (1, 'day_type', 'NightEnd', true),
  (1, 'day_type', 'EveningAttendance', true),
  (1, 'day_type', 'BreakfastStart', true),
  (1, 'day_type', 'BreakfastEnd', true),
  (1, 'day_type', 'DinnerStart', true),
  (1, 'day_type', 'DinnerEnd', true),
  (1, 'day_type', 'SupperStart', true),
  (1, 'day_type', 'SupperEnd', true),
  (1, 'day_type', 'ActiveOn', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'day_type_names', 'ID', true),
  (1, 'day_type_names', 'DayName', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'mandatory_program', 'ID', true),
  (1, 'mandatory_program', 'ClassID', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'study_group_program', 'ID', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'study_group_attendees', 'ID', true),
  (1, 'study_group_attendees', 'UID', true),
  (1, 'study_group_attendees', 'GroupID', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'class', 'ID', true),
  (1, 'class', 'Class', true),
  (1, 'class', 'Old', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (1, 'group', 'ID', true),
  (1, 'group', 'Group', true),
  (1, 'group', 'Old', true),
  (1, 'group', 'HeadTUID', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'user', 'UID', true),
  (2, 'user', 'Name', true),
  (2, 'user', 'Gender', true),
  (2, 'user', 'Picture', true),
  (2, 'user', 'Role', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'student', 'UID', true),
  (2, 'student', 'GroupID', true),
  (2, 'student', 'ClassID', true),
  (2, 'student', 'School', true),
  (2, 'student', 'RID', true),
  (2, 'student', 'ContactID', true),
  (2, 'student', 'Birthdate', true),
  (2, 'student', 'GuardianName', true),
  (2, 'student', 'GuardianPhone', true),
  (2, 'student', 'Country', true),
  (2, 'student', 'City', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'contacts', 'ID', true),
  (2, 'contacts', 'Discord', true),
  (2, 'contacts', 'Facebook', true),
  (2, 'contacts', 'Instagram', true),
  (2, 'contacts', 'Email', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'professions', 'PID', true),
  (2, 'professions', 'Name', true),
  (2, 'professions', 'Description', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'teacher', 'UID', true),
  (2, 'teacher', 'PID', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'mifare_tags', 'UID', true),
  (2, 'mifare_tags', 'Issued', true),
  (2, 'mifare_tags', 'Bytes', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'dorm_room', 'RID', true),
  (2, 'dorm_room', 'AID', true),
  (2, 'dorm_room', 'Floor', true),
  (2, 'dorm_room', 'GroupID', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'annexe', 'ID', true),
  (2, 'annexe', 'Annexe', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'resident', 'UID', true),
  (2, 'resident', 'RID', false),
  (2, 'resident', 'BedNum', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'date', 'DateID', true),
  (2, 'date', 'DayTypeID', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'lessons', 'VersionID', true),
  (2, 'lessons', 'LessonNum', true),
  (2, 'lessons', 'StartTime', true),
  (2, 'lessons', 'EndTime', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'day_type', 'ID', true),
  (2, 'day_type', 'TypeID', true),
  (2, 'day_type', 'DayStart', true),
  (2, 'day_type', 'RoomRating', true),
  (2, 'day_type', 'MiddayAttendance', true),
  (2, 'day_type', 'DayArrival', true),
  (2, 'day_type', 'LessonsVersion', true),
  (2, 'day_type', 'NightArrivalRed', true),
  (2, 'day_type', 'NightArrivalYellow', true),
  (2, 'day_type', 'NightEnd', true),
  (2, 'day_type', 'EveningAttendance', true),
  (2, 'day_type', 'BreakfastStart', true),
  (2, 'day_type', 'BreakfastEnd', true),
  (2, 'day_type', 'DinnerStart', true),
  (2, 'day_type', 'DinnerEnd', true),
  (2, 'day_type', 'SupperStart', true),
  (2, 'day_type', 'SupperEnd', true),
  (2, 'day_type', 'ActiveOn', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'day_type_names', 'ID', true),
  (2, 'day_type_names', 'DayName', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'class', 'ID', true),
  (2, 'class', 'Class', true),
  (2, 'class', 'Old', true);

INSERT INTO `permissions` (`Role`, `Table`, `Field`, `Read`) VALUES
  (2, 'group', 'ID', true),
  (2, 'group', 'Group', true),
  (2, 'group', 'Old', true),
  (2, 'group', 'HeadTUID', true);

INSERT INTO `route_access` VALUES (1, '/api/institution', true, false);
INSERT INTO `route_access` VALUES (2, '/api/institution', true, false);
INSERT INTO `route_access` VALUES (1, '/api/institution/annexes', true, false);
INSERT INTO `route_access` VALUES (2, '/api/institution/annexes', true, false);
INSERT INTO `route_access` VALUES (1, '/api/institution/annexes/:id', true, false);
INSERT INTO `route_access` VALUES (2, '/api/institution/annexes/:id', true, false);
INSERT INTO `route_access` VALUES (1, '/api/institution/groups', true, false);
INSERT INTO `route_access` VALUES (2, '/api/institution/groups', true, false);
INSERT INTO `route_access` VALUES (1, '/api/institution/classes', true, false);
INSERT INTO `route_access` VALUES (2, '/api/institution/classes', true, false);
INSERT INTO `route_access` VALUES (1, '/api/institution/groups/:id', true, false);
INSERT INTO `route_access` VALUES (2, '/api/institution/groups/:id', true, false);
INSERT INTO `route_access` VALUES (1, '/api/institution/classes/:id', true, false);
INSERT INTO `route_access` VALUES (2, '/api/institution/classes/:id', true, false);

INSERT INTO `route_access` VALUES (1, '/api/crossings/events', false, true);
INSERT INTO `route_access` VALUES (2, '/api/crossings/events', true, false);
INSERT INTO `route_access` VALUES (1, '/api/crossings/me', true, false);
INSERT INTO `route_access` VALUES (2, '/api/crossings/me', true, false);
INSERT INTO `route_access` VALUES (1, '/api/crossings/:id', false, true);
INSERT INTO `route_access` VALUES (2, '/api/crossings/:id', true, false);

INSERT INTO `route_access` VALUES (1, '/api/users', true, false);
INSERT INTO `route_access` VALUES (2, '/api/users', true, false);
INSERT INTO `route_access` VALUES (1, '/api/users/me', true, false);
INSERT INTO `route_access` VALUES (2, '/api/users/me', true, false);
INSERT INTO `route_access` VALUES (1, '/api/users/:id', true, false);
INSERT INTO `route_access` VALUES (2, '/api/users/:id', true, false);
INSERT INTO `route_access` VALUES (2, '/api/users/:id', true, false);
INSERT INTO `route_access` VALUES (1, '/api/users/mifare', false, false);
INSERT INTO `route_access` VALUES (2, '/api/users/mifare', true, false);

INSERT INTO `route_access` VALUES (1, '/api/rooms', true, false);
INSERT INTO `route_access` VALUES (2, '/api/rooms', true, false);
INSERT INTO `route_access` VALUES (1, '/api/rooms/me', true, false);
INSERT INTO `route_access` VALUES (2, '/api/rooms/me', false, true);
INSERT INTO `route_access` VALUES (1, '/api/rooms/:id', true, false);
INSERT INTO `route_access` VALUES (2, '/api/rooms/:id', true, false);

INSERT INTO `route_access` VALUES (1, '/api/timetable', true, false);
INSERT INTO `route_access` VALUES (2, '/api/timetable', false, true);
INSERT INTO `route_access` VALUES (1, '/api/timetable/mandatory', true, false);
INSERT INTO `route_access` VALUES (2, '/api/timetable/mandatory', false, true);
INSERT INTO `route_access` VALUES (1, '/api/timetable/mandatory/:id', true, false);
INSERT INTO `route_access` VALUES (2, '/api/timetable/mandatory/:id', false, true);
INSERT INTO `route_access` VALUES (1, '/api/timetable/mandatory/types', true, false);
INSERT INTO `route_access` VALUES (2, '/api/timetable/mandatory/types', true, false);
INSERT INTO `route_access` VALUES (1, '/api/timetable/mandatory/types/:id', true, false);
INSERT INTO `route_access` VALUES (2, '/api/timetable/mandatory/types/:id', true, false);
INSERT INTO `route_access` VALUES (1, '/api/timetable/studygroup', true, false);
INSERT INTO `route_access` VALUES (2, '/api/timetable/studygroup', false, true);
INSERT INTO `route_access` VALUES (1, '/api/timetable/studygroup/:id', true, false);
INSERT INTO `route_access` VALUES (2, '/api/timetable/studygroup/:id', false, true);
INSERT INTO `route_access` VALUES (1, '/api/timetable/studygroup/types', true, false);
INSERT INTO `route_access` VALUES (2, '/api/timetable/studygroup/types', true, false);
INSERT INTO `route_access` VALUES (1, '/api/timetable/studygroup/types/:id', true, false);
INSERT INTO `route_access` VALUES (2, '/api/timetable/studygroup/types/:id', true, false);
