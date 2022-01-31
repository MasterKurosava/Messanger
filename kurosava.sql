-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 31 2022 г., 13:47
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kurosava`
--

-- --------------------------------------------------------

--
-- Структура таблицы `group1_messages`
--

CREATE TABLE `group1_messages` (
  `ID` int NOT NULL,
  `USER_ID` int NOT NULL,
  `TIME` date NOT NULL,
  `CONTENT` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `group1_messages`
--

INSERT INTO `group1_messages` (`ID`, `USER_ID`, `TIME`, `CONTENT`) VALUES
(1, 1, '2022-01-01', 'Первое сообщение, которое работает'),
(1, 1, '2022-01-01', 'Первое сообщение, которое работает');

-- --------------------------------------------------------

--
-- Структура таблицы `group1_users`
--

CREATE TABLE `group1_users` (
  `user_id` int NOT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `group1_users`
--

INSERT INTO `group1_users` (`user_id`, `status`) VALUES
(1, 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `group_chats`
--

CREATE TABLE `group_chats` (
  `id` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `user_list_id` int NOT NULL,
  `message_list_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `private1_messages`
--

CREATE TABLE `private1_messages` (
  `id` int NOT NULL,
  `author_id` int NOT NULL,
  `time` date NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `private_chats`
--

CREATE TABLE `private_chats` (
  `id` int NOT NULL,
  `partner_id` int NOT NULL,
  `messages_list_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user1_contact_list`
--

CREATE TABLE `user1_contact_list` (
  `user_id` int NOT NULL,
  `own_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user1_contact_list`
--

INSERT INTO `user1_contact_list` (`user_id`, `own_name`) VALUES
(1, 'Пипка');

-- --------------------------------------------------------

--
-- Структура таблицы `user1_group_list`
--

CREATE TABLE `user1_group_list` (
  `chat_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user1_private_list`
--

CREATE TABLE `user1_private_list` (
  `chat_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `ID` int NOT NULL,
  `LOGIN` varchar(40) NOT NULL,
  `PASSWORD` varchar(40) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `CONTACTS_LIST_ID` int NOT NULL,
  `GROUP_CHAT_LIST_ID` int NOT NULL,
  `PRIVATE_CHAT_LIST_ID` int NOT NULL,
  `IMG_PROFILE_ID` int NOT NULL,
  `verification` int NOT NULL DEFAULT '0',
  `token` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`ID`, `LOGIN`, `PASSWORD`, `EMAIL`, `CONTACTS_LIST_ID`, `GROUP_CHAT_LIST_ID`, `PRIVATE_CHAT_LIST_ID`, `IMG_PROFILE_ID`, `verification`, `token`) VALUES
(1, 'Kurosava', '5989559895', 'mihailkalachiov@mail.ru', 1, 1, 1, 1, 0, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `group1_messages`
--
ALTER TABLE `group1_messages`
  ADD KEY `group_message_user_constraint` (`USER_ID`);

--
-- Индексы таблицы `group1_users`
--
ALTER TABLE `group1_users`
  ADD KEY `group_chat_user_constraint` (`user_id`);

--
-- Индексы таблицы `group_chats`
--
ALTER TABLE `group_chats`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `private1_messages`
--
ALTER TABLE `private1_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `private_messages_user_constraint` (`author_id`);

--
-- Индексы таблицы `private_chats`
--
ALTER TABLE `private_chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `private_chat_user_constraint` (`partner_id`);

--
-- Индексы таблицы `user1_contact_list`
--
ALTER TABLE `user1_contact_list`
  ADD KEY `users_contacts_constraint` (`user_id`);

--
-- Индексы таблицы `user1_group_list`
--
ALTER TABLE `user1_group_list`
  ADD KEY `users_group_list_constraint` (`chat_id`);

--
-- Индексы таблицы `user1_private_list`
--
ALTER TABLE `user1_private_list`
  ADD KEY `users_private_list_constraint` (`chat_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `group_chats`
--
ALTER TABLE `group_chats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `private1_messages`
--
ALTER TABLE `private1_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `private_chats`
--
ALTER TABLE `private_chats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `group1_messages`
--
ALTER TABLE `group1_messages`
  ADD CONSTRAINT `group_message_user_constraint` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `group1_users`
--
ALTER TABLE `group1_users`
  ADD CONSTRAINT `group_chat_user_constraint` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `private1_messages`
--
ALTER TABLE `private1_messages`
  ADD CONSTRAINT `private_messages_user_constraint` FOREIGN KEY (`author_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `private_chats`
--
ALTER TABLE `private_chats`
  ADD CONSTRAINT `private_chat_user_constraint` FOREIGN KEY (`partner_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user1_contact_list`
--
ALTER TABLE `user1_contact_list`
  ADD CONSTRAINT `users_contacts_constraint` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user1_group_list`
--
ALTER TABLE `user1_group_list`
  ADD CONSTRAINT `users_group_list_constraint` FOREIGN KEY (`chat_id`) REFERENCES `group_chats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user1_private_list`
--
ALTER TABLE `user1_private_list`
  ADD CONSTRAINT `users_private_list_constraint` FOREIGN KEY (`chat_id`) REFERENCES `private_chats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
