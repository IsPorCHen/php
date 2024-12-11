-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 11 2024 г., 16:56
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `users`
--

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `author` varchar(25) NOT NULL,
  `genre` varchar(25) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `publishing house` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id`, `name`, `author`, `genre`, `date`, `publishing house`) VALUES
(2, 'Серебряные глаза', 'Скотт Коутон', 'Хоррор', '2015-12-17', 'Кира Брид-Райсли'),
(3, 'Четвертый шкаф', 'Скотт Коутон', 'Хоррор', '2024-12-11', 'Кира Брид-Райсли'),
(4, 'Гарри Поттер', 'Роулинг', 'Фентези', '2014-07-26', 'Махаон'),
(5, 'Колодец и бабочка', 'Елена Михалкова', 'Детектив', '2024-10-15', 'АСТ'),
(6, 'Война и мир', 'Толстой', 'Роман', '1865-12-01', 'Толстой'),
(7, 'Большое путешествие по те', 'Фарндон Джон', 'Анатомия', '2020-12-01', 'Лабиринт'),
(8, 'Oshi no Ko', 'Shueisha', 'сэйнэн', '2023-11-17', 'Jump J-Books');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `birthday` date NOT NULL DEFAULT current_timestamp(),
  `mail` varchar(25) NOT NULL,
  `login` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `surname`, `name`, `birthday`, `mail`, `login`, `password`) VALUES
(3, 'Юнусов', 'Руслан', '2006-07-21', 'fazy2019@gmail.com', 'ipch', '81YUanT93352');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
