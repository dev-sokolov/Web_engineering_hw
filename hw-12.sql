
-- 1 Вывести id департамента , в котором работает сотрудник, в зависимости от Id сотрудника

SELECT department_id FROM employees_r WHERE id = 7;


-- 2 Создайте хранимую процедуру get_employee_age, которая принимает id сотрудника (IN-параметр) и возвращает его возраст через OUT-параметр.

DELIMITER //
CREATE PROCEDURE get_employee_age_hw
(
    IN empl_id INT,
    OUT empl_age INT
)
BEGIN
    SELECT age
    INTO empl_age
    FROM employees_r
    WHERE id = empl_id;
END //

DELIMITER ;

SET @age = 0;
CALL get_employee_age24(2, @age);
SELECT @age AS employee_age;



-- 3 Создайте хранимую процедуру increase_salary, которая принимает зарплату сотрудника (INOUT-параметр) и уменьшает ее на 10%.

DELIMITER //
CREATE PROCEDURE decrease_salary_empl(INOUT salary INT)
BEGIN
    SET salary = salary * 0.9;
END //

DELIMITER ;

SET @salary = 1200;
CALL decrease_salary__empl(@salary);
SELECT @salary AS employee_salary;

















