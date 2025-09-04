-- Q1.
CREATE TABLE `departments` (
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Q2.
ALTER TABLE people
ADD COLUMN department_id INT UNSIGNED NULL
AFTER email;


-- Q3.
-- 追加する部署一覧(departments)
INSERT INTO departments (name)
  VALUES 
  ('営業'),
  ('開発'),
  ('経理'),
  ('人事'),
  ('情報システム');

-- 追加する人の条件(people)
INSERT INTO people (name, department_id)
  VALUES
  ('あああいいい', 1),
  ('うううえええ', 1),
  ('おおおかかか', 1),
  ('きききくくく', 2),
  ('けけけこここ', 2),
  ('さささししし', 2),
  ('すすすせせせ', 2),
  ('そそそたたた', 3),
  ('ちちちつつつ', 4),
  ('てててととと', 5);

-- 追加する日報の条件(reports)
INSERT INTO reports (person_id, content)
  VALUES
  (7, 'なななににに'),
  (8, 'ぬぬぬねねね'),
  (9, 'のののははは'),
  (10, 'ひひひふふふ'),
  (11, 'へへへほほほ'),
  (12, 'まままみみみ'),
  (13, 'むむむめめめ'),
  (14, 'もももややや'),
  (15, 'ゆゆゆよよよ'),
  (16, 'らららりりり');


-- Q4.
UPDATE people SET  department_id = 1 WHERE department_id IS NULL; 


-- Q5.
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;


-- Q6.
peopleテーブルからカラムdepartment_idの値が1の物のレコード(name, email, age)を取得してください。
また、レコードが作成された順番(昇順)で並べてください。


-- Q7.
SELECT name FROM people WHERE (gender = 1 AND age BETWEEN 40 AND 49 ) OR (gender = 2 AND age BETWEEN 20 AND 29);


-- Q8.
SELECT name FROM people WHERE department_id = 1 ORDER BY age ASC;


-- Q9.
SELECT AVG(age) AS average_age FROM people WHERE department_id = 2;


-- Q10.
SELECT p.name, d.name, r.content
FROM people p JOIN departments d JOIN reports r ON p.person_id = r.person_id AND p.department_id = d.department_id;


-- Q11
SELECT p.name FROM people p LEFT OUTER JOIN reports r ON p.person_id = r.person_id WHERE r.person_id IS NULL;