1.
SELECT 
t.name 
FROM Teacher t
LEFT JOIN ClassSubject cs ON t.id = cs.teacher_id
LEFT JOIN Subject s ON s.id = cs.subject_id
WHERE s.name IS NULL

2. 
SELECT 
p.name
, count(p.name) as `pocet_petek` 
FROM Pupil p
LEFT JOIN PupilSubject ps ON p.id = ps.pupil_id 
LEFT JOIN Subject s ON s.id = ps.subject_id
WHERE ps.grade = 5
GROUP BY p.name

3.
SELECT 
c.id
, c.year AS `rocnik`
, c.name AS `trida`
, round(avg(ps.grade), 2) AS `prumer_tridy` 
FROM PupilSubject ps
LEFT JOIN Pupil p ON ps.pupil_id = p.id 
LEFT JOIN Class c ON p.class_id  = c.id
WHERE ps.grade >=1 and ps.grade <=5
GROUP BY c.id
ORDER BY `rocnik`, `trida`

4.
SELECT 
 c.year AS `rocnik`
, round(avg(ps.grade), 2) AS `prumer_rocniku` FROM PupilSubject ps
LEFT JOIN Pupil p ON ps.pupil_id = p.id 
LEFT JOIN Class c ON p.class_id  = c.id
WHERE ps.grade >=1 and ps.grade <=5
GROUP BY `rocnik`

5.
SELECT 
t.name as `ucitel` 
FROM Class c
JOIN Teacher t ON c.homeroom_teacher_id = t.id 
LEFT JOIN ClassSubject cs ON c.homeroom_teacher_id = cs.teacher_id
GROUP BY `ucitel`
HAVING count(subject_id) > 0

6.
SELECT 
s.name AS `predmet`
,c.year AS `rocnik`
, round(avg(ps.grade), 2) AS `prumer` 
FROM PupilSubject ps
LEFT JOIN Pupil p ON ps.pupil_id = p.id 
LEFT JOIN Subject s ON ps.subject_id  = s.id
LEFT JOIN Class c ON p.class_id  = c.id
WHERE ps.grade >=1 and ps.grade <=5
GROUP BY `predmet`,`rocnik`

7.
SELECT 
t.name AS `ucitel`
, s.name AS `predmet`
, round(avg(ps.grade), 2) AS `prumer_nejlepsi`
FROM PupilSubject ps
LEFT JOIN Subject s ON ps.subject_id  = s.id
JOIN ClassSubject cs ON cs.subject_id  = s.id
JOIN Teacher t ON cs.teacher_id  = t.id
WHERE ps.grade >=1 and ps.grade <=5
GROUP BY `ucitel`,`predmet`
ORDER BY `prumer_nejlepsi`
limit 5

SELECT 
t.name AS `ucitel`
, s.name AS `predmet`
, round(avg(ps.grade), 2) AS `prumer_nejhorsi`
FROM PupilSubject ps
LEFT JOIN Subject s ON ps.subject_id  = s.id
JOIN ClassSubject cs ON cs.subject_id  = s.id
JOIN Teacher t ON cs.teacher_id  = t.id
WHERE ps.grade >=1 and ps.grade <=5
GROUP BY `ucitel`,`predmet`
ORDER BY `prumer_nejhorsi` desc
limit 5



