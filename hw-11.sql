
-- 1. Функция для расчета площади круга

DELIMITER //
CREATE FUNCTION circle_area(radius DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
	RETURN (PI() * (radius * radius));
END 

-- 2. Функция для расчета гипотенузы треугольника

CREATE FUNCTION hypotenuse_length (cathetus_a DOUBLE, cathetus_b DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
	RETURN SQRT((cathetus_a * cathetus_a) + (cathetus_b * cathetus_b));
END 
DELIMITER ;

SELECT circle_area(10);

SELECT hypotenuse_length(5, 6);	