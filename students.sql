CREATE TABLE `students` (
    `id` INT NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    `year` CHAR(4) NOT NULL,
    `major` VARCHAR(20) NOT NULL,
    `phone_number` CHAR(12),
    `address` VARCHAR(30),
    `total_grade` INT DEFAULT 0,
    `gpa` FLOAT,
    `register` BOOLEAN DEFAULT true
) ENGINE=InnoDB DEFAULT CHARSET=utf8;