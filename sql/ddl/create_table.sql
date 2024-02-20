CREATE TABLE PointList (
ID       INT(3)       NOT NULL PRIMARY KEY,
Name     VARCHAR(50)  NOT NULL,
Class    VARCHAR(1),
Japanese INT(3),
Math     INT(3),
English  INT(3)
);
/* 出来上がったテーブルがこちら
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| ID       | int(3)      | NO   | PRI | NULL    |       |←主キーが設定されている
| Name     | varchar(50) | NO   |     | NULL    |       |
| Class    | varchar(1)  | YES  |     | NULL    |       |
| Japanese | int(3)      | YES  |     | NULL    |       |
| Math     | int(3)      | YES  |     | NULL    |       |
| English  | int(3)      | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
*/