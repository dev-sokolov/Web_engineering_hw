
-- 1 Подключитесь к своей базе данных созданной на уроке
-- 2 Создайте таблицу, которая отражает погоду в Вашем городе за последние 5 дней и включает следующее столбцы
-- Id - первичный ключ, заполняется автоматически
-- Дата - не может быть пропуском
-- Дневная температура - целое число, принимает значения от -30 до 30
-- Ночная температура - целое число, принимает значения от -30 до 30
-- Скорость ветра - подумайте какой тип данных и ограничения необходимы для этого столбца
-- 3 Заполните таблицу 5 строками - за последние 5 дней 
-- 4 Увеличьте значения ночной температуры на градус если скорость ветра не превышала 3 м/с
-- 5 На основе полученной таблицы создайте представление в своей базе данных - включите все строки Вашей таблицы и дополнительно
--  рассчитанные столбцы
-- Средняя суточная температура - среднее арифметическое между ночной и дневной температурами
-- Столбец на основе скорости ветра - если скорость ветра не превышала 2 м/с то значение ‘штиль’, от 2 включительно до 5 - ‘умеренный ветер’,
--  в остальных случаях - ‘сильный ветер’

CREATE TABLE `Weater_hw` (
	ID INT NOT NULL AUTO_INCREMENT,
    date DATE NOT NULL,
    day_temperature INT NOT NULL,
	night_temperature INT NOT NULL,
    speed_of_wind_ms INT NOT NULL ,
    PRIMARY KEY (`ID`),
	CONSTRAINT check_day_temperature CHECK (day_temperature between -(30) and 30),
	CONSTRAINT check_night_temperature CHECK (night_temperature between -(30) and 30),
	CONSTRAINT check_speed_of_wind_ms CHECK (speed_of_wind_ms >= 0)
); 


INSERT INTO Weater_hw_4 (date, day_temperature, night_temperature, speed_of_wind_ms)
VALUES
	(DATE_SUB(CURDATE(), INTERVAL 4 DAY), 20, 10, 1),
	(DATE_SUB(CURDATE(), INTERVAL 3 DAY), 15, 5, 8),
	(DATE_SUB(CURDATE(), INTERVAL 2 DAY), 8, -1, 2),
	(DATE_SUB(CURDATE(), INTERVAL 1 DAY), 10, 2, 5),
	(CURDATE(), 12, -2, 3);   

        
UPDATE Weater_hw_4
SET 
	night_temperature = night_temperature + 1	
WHERE
	speed_of_wind_ms <= 3;
    
    
CREATE VIEW Weater_hw_4_view AS
SELECT
	*,
    (day_temperature + night_temperature) / 2 AS avg_temperatute,
    CASE
		WHEN speed_of_wind_ms < 2 THEN "штиль"
        WHEN speed_of_wind_ms >= 2 AND speed_of_wind_ms < 5 THEN "умеренный ветер"
        ELSE  "сильный ветер"
	END AS wind_category
FROM
	Weater_hw_4;
    
    


