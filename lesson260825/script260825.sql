-- Таблица students:

create table students (
    student_id int primary key auto_increment,
    first_name varchar(128) not null,
    last_name varchar(128) not null,
    age int,
    grade varchar(10),
    city varchar(128)
);

insert into students(first_name, last_name, age, grade, city) values
("Anna", "Petrova", 20, "A", "Berlin"),
("Ivan", "Sidorov", 22, "B", "Munich"),
("Maria", "Ivanova", 19, "C", "Hamburg"),
("Dmitry", "Smirnov", 21, "A", "Berlin"),
("Olga", "Kuznetsova", 23, "B", "Cologne"),
("Nikolay", "Popov", 20, "C", "Frankfurt"),
("Elena", "Volkova", 22, "A", "Berlin"),
("Sergey", "Morozov", 19, "B", "Stuttgart"),
("Irina", "Sokolova", 21, "C", "Dresden"),
("Pavel", "Lebedev", 20, "A", "Leipzig");

select * from students;

-- Задания:

-- 1. Найдите самого старшего студента.
select * from students
order by age desc
limit 1;

-- 2. Найдите самого младшего студента.
select * from students
order by age 
limit 1;

-- 3. Выведите первых двух студентов из города Berlin, отсортировав по возрасту.
select * from students
where city = 'Berlin'
order by age desc
limit 2;

-- 4. Выведите трёх студентов, которым больше 20 лет, но пропустите первых двух из списка.
select * from students
where age > 20
limit 2, 3;

-- 5. Выведите список уникальных городов, в которых живут студенты.
select distinct city from students;

-- 6. Выведите имена и фамилии студентов, отсортировав их по возрасту по возрастанию.
select first_name, last_name from students
order by age;

-- 7. Выведите студентов с оценкой "A", отсортировав по фамилии.
select * from students
where grade = 'A'
order by last_name;

-- 8. Выведите студентов младше 21 года, отсортировав их по имени по алфавиту.
select * from students
where age < 21
order by first_name;

set sql_safe_updates = 0;

-- 9. Измените фамилию студента Maria Ivanova на Petrova.
update students
set last_name = 'Petrova'
where first_name = 'Maria' and last_name = 'Ivanova';

-- 10. Всем студентам из города Berlin увеличьте возраст на 1 год.
update students
set age = age + 1
where city = 'Berlin';

-- 11. Переведите студента Ivan Sidorov в группу с оценкой "A".
update students
set grade = 'A'
where first_name = 'Ivan' and last_name = 'Sidorov';

-- 12. Всем студентам с оценкой "C" измените оценку на "B".
update students
set grade = 'B'
where grade = 'C';

-- 13. Удалите студента Pavel Lebedev.
delete from students
where first_name = 'Pavel' and last_name = 'Lebedev';

-- 14. Удалите всех студентов из города Hamburg.
delete from students
where city = 'Hamburg';

-- 15. Очистите таблицу students.
delete from students;