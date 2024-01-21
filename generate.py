# TODO: kevesbe osszecsapott es kesobb is hasznalhatova tetel + jobban parametizalas

from json import loads
from random import randint as rand

data = None
with open('data.json') as f:
  data = loads(''.join(f.readlines()))['data']

dummy = {
  'user': [],
  'class': [],
  'group': [],
  'annexe': [],
  'dorm_room': [],
  'resident' : [],
  'login_data': [],
  'teacher': [],
  'contacts': [],
  'student': [],
  'program_types': [],
  'day_type': [],
  'date': [],
  'program': [],
  'study_group_program': [],
  'study_group_attendees': [],
  'mandatory_program': []
}
LEN = len(data)
TEACHERCOUNT = 50

studentIDs = list(range(1, LEN+1))
teacherIDs = []
for _ in range(TEACHERCOUNT):
  rnd = rand(0, LEN-len(teacherIDs))
  teacherIDs.append(studentIDs.pop(rnd)) # IndexError: pop index out of range


for i in range(1, LEN+1):
  dummy['user'].append({})
  dummy['user'][-1]['UID'] = i
  dummy['user'][-1]['Role'] = 2 if (i in teacherIDs) else 1


classes = []
for n in range(9,13):
  for l in ['A', 'B', 'C', 'E']:
    classes.append(str(n) + '.' + l)
    dummy['class'].append({})
    dummy['class'][-1]['ID'] = len(dummy['class'])
    dummy['class'][-1]['Class'] = classes[-1]


GROUPCOUNT = 50
groups = []
groupIDs = range(1, GROUPCOUNT+1)
for n in range(0, GROUPCOUNT):
  pref = 'L' if n+1 > GROUPCOUNT//2 else 'F'
  group = pref + str(n%(GROUPCOUNT//2)+1)
  groups.append(group)
  dummy['group'].append({})
  dummy['group'][-1]['ID'] = n + 1
  dummy['group'][-1]['Group'] = group
  dummy['group'][-1]['HeadTUID'] = teacherIDs[n % TEACHERCOUNT]


ANNEXCOUNT = 4
annexIDs = range(1, ANNEXCOUNT+1)
for n in range(ANNEXCOUNT):
  dummy['annexe'].append({})
  dummy['annexe'][-1]['ID'] = n+1
  dummy['annexe'][-1]['Annexe'] = [chr(b) for b in range(65, 91)][n] + ' Épület'


ROOMCOUNT = 250
for n in range(ROOMCOUNT):
  d = {}
  d['RID'] = n+1
  d['AID'] = n % ANNEXCOUNT + 1
  d['GroupID'] = n % GROUPCOUNT + 1
  dummy['dorm_room'].append(d)


c = 0
for studentID in studentIDs:
  d = {}
  d['UID'] = studentID
  d['RID'] = c % ROOMCOUNT + 1
  d['BedNum'] = c//ROOMCOUNT + 1
  dummy['resident'].append(d)
  c += 1


for i in range(LEN):
  d = {}
  d['UID'] = i+1
  d['Username'] = data[i]['username']
  d['Password'] = data[i]['password']
  dummy['login_data'].append(d)


for teacherID in teacherIDs:
  d = {}
  d['UID'] = teacherID
  d['Name'] = data[teacherID-1]['name']
  d['OM'] = str(rand(70000000000, 80000000000-1))
  dummy['teacher'].append(d)


for i in range(LEN):
  if i not in studentIDs:
    continue
  d = {}
  d['ID'] = i+1
  for k in ['Discord', 'Email', 'Instagram']:
    d[k] = data[i][k.lower()]
  dummy['contacts'].append(d)

c = 0
for i in range(LEN):
  if i not in studentIDs:
    continue
  d = {}
  d['UID'] = i
  d['OM'] = str(rand(70000000000, 80000000000-1))
  d['RID'] = c % ROOMCOUNT + 1
  d['GroupID'] = (c % ROOMCOUNT + 1) % GROUPCOUNT + 1
  d['ContactID'] = i+1
  d['ClassID'] = c % len(classes) + 1
  d['Gender'] = 'b\'0\'' if d['GroupID'] > GROUPCOUNT//2 else 'b\'1\''
  for k in ['Name', 'Picture', 'School', 'Birthplace', 'Birthdate', 'GuardianName', 'GuardianPhone', 'Country', 'City', 'Street', 'PostCode', 'Address']:
    d[k] = data[i][k.lower()]
  c += 1
  dummy['student'].append(d)


TOPICSCOUNT = 100
MANDATORYCOUNT = 60
topics = [ data[rnd]['topic'] for rnd in [ rand(0, LEN-1) for _ in range(TOPICSCOUNT) ] ]
for n in range(TOPICSCOUNT):
  d = {}
  d['ID'] = n+1
  d['Type'] = 2 if n > 60 else 1
  d['Topic'] = topics[n]
  d['RID'] = n % ROOMCOUNT
  d['TUID'] = teacherIDs[n % TEACHERCOUNT]
  dummy['program_types'].append(d)


multipleDayTypes = {
  'ID': [1,2,3,4],
  'TypeID': [1,2,3,4],
  'DayStart': ['8:00:00', '6:00:00', '6:00:00', '8:00:00'],
  'RoomRating': ['8:00:00', '8:00:00', '8:00:00', '8:00:00'],
  'MiddayAttendance': ['12:00:00', '12:00:00', '12:00:00', '12:00:00'],
  'DayArrival': ['15:45:00', '15:45:00', '15:45:00', '15:45:00'],
  'LessonsVersion': [1,1,1,1],
  'NightArrivalRed': ['20:15:00', '20:15:00', '20:15:00', '20:15:00'],
  'NightArrivalYellow': ['21:00:00', '21:00:00', '21:00:00', '21:00:00'],
  'NightEnd': ['22:00:00', '22:00:00', '22:00:00', '22:00:00'],
  'EveningAttendance': ['22:30:00', '22:30:00', '22:30:00', '22:30:00'],
  'BreakfastStart': ['6:00:00', '6:00:00', '6:00:00', '6:00:00'],
  'BreakfastEnd': ['8:00:00', '8:00:00', '8:00:00', '8:00:00'],
  'DinnerStart': ['13:00:00', '13:00:00', '13:00:00', '13:00:00'],
  'DinnerEnd': ['15:45:00', '15:45:00', '15:45:00', '15:45:00'],
  'SupperStart': ['18:00:00', '18:00:00', '18:00:00', '18:00:00'],
  'SupperEnd': ['20:00:00', '20:00:00', '20:00:00', '20:00:00'],
  'ActiveOn': ['ADDDATE(CURDATE(), -1)', 'ADDDATE(CURDATE(), -1)', 'ADDDATE(CURDATE(), -1)', 'ADDDATE(CURDATE(), -1)']
}
for key in multipleDayTypes:
  for i in range(len(multipleDayTypes[key])):
    if len(dummy['day_type']) <= i:
      dummy['day_type'].append({})
    dummy['day_type'][i][key] = multipleDayTypes[key][i]


DEFINERANDOMNUMPERDAY = 40
mandatoryProgramTypes = list(filter(lambda v: v['Type'] == 1, dummy['program_types']))
studygroupProgramTypes = list(filter(lambda v: v['Type'] == 2, dummy['program_types']))
for n in range(-7, 14+1):
  for classObj in dummy['class']:
    for i in range(1,3):
      programType = mandatoryProgramTypes[rand(0, len(mandatoryProgramTypes)-1)]
      p = {
        'ID': len(dummy['program'])+1,
        'ProgramID': programType['ID'],
        'Date': 'ADDDATE(CURDATE(), %s)' % n,
        'Lesson': i,
        'Length': 1
      }
      dummy['program'].append(p)
      m = {
        'ID': len(dummy['mandatory_program'])+1,
        'ClassID': classObj['ID']
      }
      dummy['mandatory_program'].append(m)

defined = []
for studygroup in studygroupProgramTypes:
  for n in range(-7, 14):
    p = {
      'ProgramID': studygroup['ID'],
      'Date': 'ADDDATE(CURDATE(), %s)' % n,
      'Lesson': rand(3,4),
      'Length': rand(1,2)
    }
    outside = p not in defined
    p['ID'] = len(dummy['program'])+1
    sp = {
      'ID': p['ID']
    }
    if outside:
      dummy['program'].append(p)
      dummy['study_group_program'].append(sp)

for studentUID in studentIDs:
  for n in range(1):
    sa = {}
    sa['ID'] = len(dummy['study_group_attendees'])+1
    sa['UID'] = studentUID
    sa['GroupID'] = studygroupProgramTypes[rand(0, len(studygroupProgramTypes)-1)]['ID']
    dummy['study_group_attendees'].append(sa)


for n in range(-7, 14+1):
  d = {}
  d['DateID'] = 'ADDDATE(CURDATE(), %s)' % n
  if (n % 7 == 0):
    d['DayTypeID'] = 1
  elif (n % 7 == 4):
    d['DayTypeID'] = 3
  elif (n % 7 > 4):
    d['DayTypeID'] = 4
  else:
    d['DayTypeID'] = 2
  dummy['date'].append(d)


print('''INSERT INTO `role_name` (`Role`, `Table`, `FullName`) VALUES
(1, 'student', 'kollégiumi diák'),
(2, 'teacher', 'nevelőtanár');''')

print('''INSERT INTO `day_type_names` VALUES
(1, 'tanulásra készülő nap'),
(2, 'tanuló nap'),
(3, 'tanulást befejező nap'),
(4, 'tanulásmentes nap');''')

print('''INSERT INTO `lessons` VALUES
(1, 1, '16:00:00', '16:45:00'),
(1, 2, '16:50:00', '16:35:00'),
(1, 3, '16:40:00', '17:25:00'),
(1, 4, '17:30:00', '18:15:00');''')


for table in dummy:
  for obj in dummy[table]:
    line = 'INSERT INTO `' + table + '` ('
    for v in list(obj.keys()):
      line += '`' + v + '`, '
    line = line[:-2]
    line += ') VALUES ('
    for v in obj.values():
      if type(v) == str and not v.startswith('b\'') and not (v.startswith('ADDDATE') or v.startswith('CURDATE')):
        line += '\'' + v.replace('\\', '\\\\').replace('\'', '\\\'') + '\''
      elif type(v) == str and (v.startswith('ADDDATE') or v.startswith('CURDATE')):
        line += v
      elif type(v) == str:
        line += v
      else:
        line += str(v)
      line += ', '
    line = line[:-2]
    line += ');'
    print(line)