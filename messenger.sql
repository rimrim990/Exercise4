CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(20) NOT NULL,
    `password` VARCHAR(15) NOT NULL,
    `nickname` VARCHAR(15),
    `photo_uRL` VARCHAR(30),
    `profile_msg` VARCHAR(50),
    `unsubscribe` TINYINT(1) DEFAULT 0,
    `registered_at` DATE,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(10),
    `owner` INT,
    `link` VARCHAR(30),
    `capacity` INT,
    `unsubscribe` TINYINT(1) DEFAULT 0,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`owner`)
    REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `content` VARCHAR(40),
    `author` INT NOT NULL,
    `channel_id` INT NOT NULL,
    `created_at` DATE,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`channel_id`)
    REFERENCES `channels` (`id`) ON DELETE CASCADE,
    FOREIGN KEY (`author`)
    REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `follow_at` DATE,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`)
    REFERENCES `users` (`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee`)
    REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `block_req` INT NOT NULL,
    `block_target` INT NOT NULL,
    `block_at` DATE,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`block_req`)
    REFERENCES `users` (`id`) ON DELETE CASCADE,
    FOREIGN KEY (`block_target`)
    REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;