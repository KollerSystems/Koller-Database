# TODO: dokumentáció
# TODO: multithreading
# TODO: optimalizáció -> for loopban fetchone helyett fetchmany és azokat használni míg "el nem fogy" a kapott lista

import mariadb
import sys
from random import randrange, randint, randbytes
from json import loads
from math import ceil
from datetime import date, timedelta, time as timeclass
from time import time


### CONFIG ###
# PARAMETERS

listed = []
isBlackList = True

# PARAMETERS
# GLOBAL CONSTANTS

USER_COUNT = 1000
TEACHER_COUNT = 50

PROFESSIONS_COUNT = 4

ROOM_COUNT = int((USER_COUNT - TEACHER_COUNT) / 4) + 100
GROUP_COUNT = int(ROOM_COUNT // 2 + 1)

BED_COUNT = 4

DATE_START_OFFSET = -25
DATE_PIVOT = [date.today().year, date.today().month, date.today().day] # [év, hónap, nap]
DATE_END_OFFSET = 200

CROSSINGS_PER_DAY_COUNT = 100

PROGRAM_TYPES_COUNT = 100
MANDATORY_PROGRAM_COUNT = 40
MAX_RID = 2**16 # smallint

PROGRAM_COUNT = (abs(DATE_START_OFFSET) + abs(DATE_END_OFFSET)) * 4 * 25 + 40

# GLOBAL CONSTANTS
### CONFIG ###


try:
  conn = mariadb.connect(
    user="root",
    password="",
    host="127.0.0.1",
    port=3306,
    database="kollegium"
  )
except mariadb.Error as e:
  print(f"Error connecting to MariaDB Platform: {e}")
  sys.exit(1)

cur = conn.cursor()
insertionCur = conn.cursor()


datajson = {}
with open("./data.json", "r") as f:
  datajson = loads("".join(f.readlines()))
  datajson = datajson["data"]
def randomValue(key):
  randomIndex = randrange(0, len(datajson))
  return datajson[randomIndex][key]

def bstb(bitstring):
  return bitstring == b'\x01'

def itShouldAdd(name):
  verdict = name in listed
  return (not verdict if isBlackList else verdict)


TESTCOUNT = 18
curTestNum = -1
def progress():
  global curTestNum
  curTestNum += 1
  print(chr(8) * 10, end="")
  print(("(%i/%i)" % (TESTCOUNT, curTestNum)).ljust(8, " "), end="| ")
progress()
def logger():
  now = time()
  progress()
  def log(name: str):
    took = time() - now
    print(name.ljust(30, " ") + "| ~%i ms" % round(took * 1000))
  return log


class dbfunction:
  def __init__(self, value):
    self.value = str(value)
  def __str__(self):
    return self.value
  def __repr__(self):
    return self.value

def insert(table, *args):
  if not itShouldAdd(table):
    return

  fields = []
  values = []
  if (len(args) == 1):
    fields = list(args[0].keys())
    values = list(args[0].values())
  else:
    fields = list(args[0])
    values = list(args[1])

  if len(fields) != len(values):
    raise("Number of fields is not the same as the number of values!")

  for i in range(len(values)):
    fields[i] = f"`{fields[i]}`"

    if type(values[i]) == bool:
      values[i] = f"b'{int(values[i])}'"
    elif type(values[i]) == str:
      values[i] = f"\"{values[i]}\""
    elif type(values[i]) == dbfunction:
      pass
    elif values[i] == None:
      values[i] = "NULL"
    else:
      values[i] = str(values[i])

  insertionCur.execute(f"INSERT INTO `{table}` ({','.join(fields)}) VALUES ({','.join(map(str, values))})")
  conn.commit()



# professions
l = logger()
for professionN in range(1, PROFESSIONS_COUNT+1):
  value = randomValue("topic")
  insert("professions", ["PID", "Name", "Description"], [professionN, value, f"Egy nagyon menő leírás: {value}, mint mindig!"])
l("professions")

# class
l = logger()
for classNumber in range(9, 13+1):
  for classLetter in [chr(v).upper() for v in range(ord('a'), ord('j')+1)]:
    insert("class", ["Class"], [str(classNumber) + "." + classLetter])
l("class")

# user + login_data
l = logger()
for userN in range(1, USER_COUNT+1):
  # user
  user = {
    "UID": userN,
    "Name": randomValue("name"),
    "OM": "".join([str(randrange(0, 10) if v != 0 else randrange(1, 10)) for v in range(11)]),
    "Gender": bool(randrange(0,2)),
    "Picture": randomValue("picture"),
    "Role": 2 if userN < TEACHER_COUNT else 1
  }
  insert("user", user)

  # login_data
  insert("login_data", ["UID", "Username", "Password"], [userN, randomValue("username"), ["Asajtfinom1", "porcica1"][randrange(0,2)]])
l("user, login_data")

# teacher
l = logger()
for teacherN in range(1, TEACHER_COUNT+1):
  insert("teacher", ["UID", "PID"], [teacherN, randrange(1, PROFESSIONS_COUNT+1)])
l("teacher")

# group
l = logger()
for groupN in range(1, GROUP_COUNT+1):
  cur.execute("SELECT UID FROM teacher ORDER BY RAND() LIMIT 1")
  group = {
    "ID": groupN,
    "Group": ('F' if bool(groupN % 2) else 'L') + str(ceil(groupN / 2)),
    "Old": False,
    "HeadTUID": cur.fetchone()[0]
  }
  insert("group", group)
l("group")

# annexe -- static
l = logger()
insert("annexe", ["ID", "Annexe"], [1, "Főépület"])
l("annexe")

# dorm_room
# numbering system: Floor(1) + Room?(10) -> 110
l = logger()
cur.execute("SELECT ID FROM `group`")
conn.commit()
for roomN in range(1, ROOM_COUNT+1):
  identifier = cur.fetchone()
  if identifier == None:
    cur.execute("SELECT ID FROM `group`")
    conn.commit()
    identifier = cur.fetchone()

  room = {
    "RID": roomN,
    "AID": 1,
    "Floor": roomN // 100,
    "GroupID": identifier[0]
  }
  insert("dorm_room", room)
l("dorm_room")

# resident + contacts + student
l = logger()
contactN = 1
for studentN in range(50, 1000 + 1):
  cur.execute(f"SELECT * FROM user WHERE UID = {studentN}")
  user = cur.fetchone()

  # resident
  tried = []
  (rid, groupid) = (0, 0)
  bedsTaken = []
  while (len(tried) < ROOM_COUNT):
    cur.execute(f"SELECT RID, GroupID FROM dorm_room LEFT JOIN `group` ON GroupID=ID WHERE `Group` LIKE \"{'F' if bool(user[5]) else 'L'}%\"{''.join([(' AND RID <> %s' % t) for t in tried ])} ORDER BY RAND() LIMIT 1")

    (rid, groupid) = cur.fetchone()
    cur.execute(f"SELECT BedNum FROM resident WHERE RID = {rid} ORDER BY BedNum ASC")
    bedsTaken = cur.fetchall()
    if len(bedsTaken) < BED_COUNT:
      break
    tried.append(rid)

  available = []
  for n in range(1, BED_COUNT + 1):
    if (n,) not in bedsTaken:
      available.append(n)

  resident = {
    "UID": user[0],
    "RID": rid,
    "BedNum": available[randrange(0, len(available))]
  }
  insert("resident", resident)

  # contacts
  contacts = {
    "ID": contactN,
    "Discord": randomValue("discord"),
    "Facebook": user[2],
    "Instagram": randomValue("instagram"),
    "Email": randomValue("email")
  }
  insert("contacts", contacts)

  # student
  cur.execute("SELECT ID FROM class ORDER BY RAND()")
  student = {
    "UID": studentN,
    "GroupID": groupid,
    "RID": rid,
    "ContactID": contactN,
    "ClassID": cur.fetchone()[0]
  }
  for field in ["School", "Birthplace", "Birthdate", "GuardianName", "GuardianPhone", "Country", "City", "Street", "PostCode", "Address"]:
    student[field] = randomValue(field.lower())
  insert("student", student)

  contactN += 1
l("resident, contacts, student")

# crossings
# TODO: efficient query egyszerre lekérni: UID & legutolsó direction(vagy NULL)
l = logger()
for offset in range(DATE_START_OFFSET, DATE_END_OFFSET + 1):
  for dailyN in range(1, CROSSINGS_PER_DAY_COUNT + 1):
    cur.execute("SELECT UID FROM user ORDER BY RAND() LIMIT 1")
    crossing = {
      "UID": cur.fetchone()[0],
      "Time": dbfunction(f"ADDDATE(\'{'-'.join(map(str, DATE_PIVOT))}\', {str(offset)})"),
    }
    cur.execute(f"SELECT Direction FROM crossings WHERE UID={crossing['UID']} ORDER BY Time DESC LIMIT 1")
    direction = cur.fetchone()
    if direction != None:
      crossing["Direction"] = not bstb(direction[0])
    else:
      crossing["Direction"] = False
    insert("crossings", crossing)
l("crossings")

# TODO: mifare_tags
# cur.execute("SELECT UID FROM user")
# for (uid,) in cur:
#   insert("mifare_tags", ["UID", "Issued", "Bytes"], [uid, dbfunction(f"ADDDATE(\'{'-'.join(map(str, DATE_PIVOT))}\', {randrange(DATE_START_OFFSET, 0)})"), randbytes(32)])

# day_type_names
l = logger()
keys = ["ID", "DayName"]
insert("day_type_names", keys, (1, 'tanulásra készülő nap'))
insert("day_type_names", keys, (2, 'tanuló nap'))
insert("day_type_names", keys, (3, 'tanulást befejező nap'))
insert("day_type_names", keys, (4, 'tanulásmentes nap'))
l("day_type_names")

# lessons
l = logger()
keys = ["VersionID", "LessonNum", "StartTime", "EndTime"]
insert("lessons", keys, (1, 1, '16:00:00', '16:45:00'))
insert("lessons", keys, (1, 2, '16:50:00', '16:35:00'))
insert("lessons", keys, (1, 3, '16:40:00', '17:25:00'))
insert("lessons", keys, (1, 4, '17:30:00', '18:15:00'))
insert("lessons", keys, (2, 1, '16:05:00', '16:50:00'))
insert("lessons", keys, (2, 2, '16:55:00', '16:40:00'))
insert("lessons", keys, (2, 3, '16:45:00', '17:30:00'))
insert("lessons", keys, (2, 4, '17:35:00', '18:20:00'))
l("lessons")

# day_type
# TODO: nem logikus a szerkesztettsége az "órarendnek" -> fix
l = logger()
keys = ["ID", "TypeID", "DayStart", "RoomRating", "MiddayAttendance", "DayArrival", "LessonsVersion", "NightArrivalRed", "NightArrivalYellow", "NightEnd", "EveningAttendance", "BreakfastStart", "BreakfastEnd", "DinnerStart", "DinnerEnd", "SupperStart", "SupperEnd", "ActiveOn"]
insert("day_type", keys, (1, 1, '8:00:00', '8:00:00', '12:00:00', '15:45:00', 1, '20:15:00', '21:00:00', '22:00:00', '22:30:00', '6:00:00', '8:00:00', '13:00:00', '15:45:00', '18:00:00', '20:00:00', dbfunction("ADDDATE(CURDATE(), -1)")))
insert("day_type", keys, (2, 2, '6:00:00', '8:00:00', '12:00:00', '15:45:00', 2, '20:15:00', '21:00:00', '22:00:00', '22:30:00', '6:00:00', '8:00:00', '13:00:00', '15:45:00', '18:00:00', '20:00:00', dbfunction("CURDATE()")))
insert("day_type", keys, (3, 3, '8:00:00', '8:00:00', '12:00:00', '15:45:00', 1, '20:15:00', '21:00:00', '22:00:00', '22:30:00', '6:00:00', '8:00:00', '13:00:00', '15:45:00', '18:00:00', '20:00:00', dbfunction("ADDDATE(CURDATE(), 3)")))
insert("day_type", keys, (4, 4, '8:00:00', '8:00:00', '12:00:00', '15:45:00', 1, '20:15:00', '21:00:00', '22:00:00', '22:30:00', '6:00:00', '8:00:00', '13:00:00', '15:45:00', '18:00:00', '20:00:00', dbfunction("ADDDATE(CURDATE(), 3)")))
l("day_type")

# date
l = logger()
for offset in range(DATE_START_OFFSET, DATE_END_OFFSET):
  d = (date(*DATE_PIVOT) + timedelta(days=offset)).weekday()
  dtype = -1
  try:
    dtype = [6, -1, 4, 5].index(d) + 1
  except ValueError:
    dtype = 2
  insert("date", ["DateID", "DayTypeID"], [dbfunction(f"ADDDATE(\'{'-'.join(map(str, DATE_PIVOT))}\', {offset})"), dtype])
l("date")

# program_types
l = logger()
cur.execute("SELECT RID FROM dorm_room")
rids = set(range(1, MAX_RID))
for (rid,) in cur:
  rids.remove(rid)
for programTypeN in range(1, PROGRAM_TYPES_COUNT + 1):
  cur.execute("SELECT UID FROM teacher ORDER BY RAND() LIMIT 1")
  programType = {
    "ID": programTypeN,
    "Type": 1 if programTypeN <= MANDATORY_PROGRAM_COUNT else 2,
    "Topic": randomValue("topic"),
    "RID": rids.pop(),
    "TUID": cur.fetchone()[0]
  }
  insert("program_types", programType)
l("program_types")

# program
l = logger()
for programN in range(1, PROGRAM_COUNT + 1):
  cur.execute("SELECT ID FROM program_types ORDER BY RAND() LIMIT 1")
  program = {
    "ID": programN,
    "ProgramID": cur.fetchone()[0],
    "Date": dbfunction(f"ADDDATE(\'{'-'.join(map(str, DATE_PIVOT))}\', {randrange(DATE_START_OFFSET, DATE_END_OFFSET)})"),
  }
  program["Length"] = randint(1, 2)
  program["Lesson"] = randint(1, (4 - program["Length"] + 1))
  insert("program", program)
l("program")

# mandatory_program
# TODO: SQL query egyből(INSERT INTO SELECT...)
l = logger()
helperCur = conn.cursor()
cur.execute("SELECT program.ID FROM program LEFT JOIN program_types ON program.ProgramID = program_types.ID WHERE Type = 1")
for (mandatoryID,) in cur:
  helperCur.execute("SELECT ID FROM class ORDER BY RAND() LIMIT 1")
  insert("mandatory_program", ["ID", "ClassID"], [mandatoryID, helperCur.fetchone()[0]])
l("mandatory_program")

# study_group_program
l = logger()
cur.execute("INSERT INTO study_group_program SELECT program.ID FROM program LEFT JOIN program_types ON program.ProgramID = program_types.ID WHERE Type = 2")
conn.commit()
l("study_group_program")

# study_group_attendees
l = logger()
cur.execute("SELECT ID FROM study_group_program")
for (studyGroupID,) in cur:
  helperCur.execute("SELECT ID FROM `program_types` WHERE Type=2 ORDER BY RAND() LIMIT 1")
  attendees = {
    "ID": studyGroupID,
    "GroupID": helperCur.fetchone()[0]
  }
  helperCur.execute(f"SELECT UID FROM student WHERE GroupID = {attendees['GroupID']} ORDER BY RAND() LIMIT 1")
  attendees["UID"] = helperCur.fetchone()[0] # None lehet kis eséllyel, ha random módón nem osztja ki az adott programot
  insert("study_group_attendees", attendees)
l("study_group_attendees")


helperCur.close()
cur.close()
insertionCur.close()
conn.close()