-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Mar 30, 2025 at 07:19 PM
-- Wersja serwera: 8.0.41
-- Wersja PHP: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `szkola`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasy`
--

CREATE TABLE `klasy` (
  `id` bigint NOT NULL,
  `nazwa` text NOT NULL,
  `rok_zaczenia_nauki` year NOT NULL,
  `rozpoczynajaca` int NOT NULL,
  `konczaca` int NOT NULL,
  `aktywna` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasy_wychowawcy`
--

CREATE TABLE `klasy_wychowawcy` (
  `id` bigint NOT NULL,
  `id_klasa` bigint NOT NULL,
  `id_nauczyciel` bigint NOT NULL,
  `od` year NOT NULL,
  `do` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `konta`
--

CREATE TABLE `konta` (
  `id` bigint NOT NULL,
  `nazwa` text NOT NULL,
  `email` text NOT NULL,
  `data_weryfikacji_email` timestamp NOT NULL,
  `haslo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `konta_relacja_uczniowie`
--

CREATE TABLE `konta_relacja_uczniowie` (
  `id` bigint NOT NULL,
  `id_uczen` bigint NOT NULL,
  `id_konto` bigint NOT NULL,
  `typ` enum('uczen','opiekun') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekcje`
--

CREATE TABLE `lekcje` (
  `id` bigint NOT NULL,
  `id_klasa` bigint NOT NULL,
  `id_numer` bigint NOT NULL,
  `id_nauczyciel` bigint NOT NULL,
  `id_przemiot` bigint NOT NULL,
  `zastepstwo` tinyint(1) NOT NULL,
  `temat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekcje_numer`
--

CREATE TABLE `lekcje_numer` (
  `id` tinyint(1) NOT NULL,
  `numer` int NOT NULL,
  `godzina_zaczecia` text NOT NULL,
  `godzina_zakonczenia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciele`
--

CREATE TABLE `nauczyciele` (
  `id` bigint NOT NULL,
  `imie` text NOT NULL,
  `drugie_imie` text NOT NULL,
  `nazwisko` text NOT NULL,
  `plec` enum('K','M') NOT NULL,
  `pesel` text NOT NULL,
  `nr_tel` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciele_przedmioty`
--

CREATE TABLE `nauczyciele_przedmioty` (
  `id` bigint NOT NULL,
  `id_nauczyciel` bigint NOT NULL,
  `id_przedmiot` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny`
--

CREATE TABLE `oceny` (
  `id` bigint NOT NULL,
  `ocena` text NOT NULL,
  `wartosc` float DEFAULT NULL,
  `id_uczen` bigint NOT NULL,
  `id_nauczyciel` bigint NOT NULL,
  `id_kolumna` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `oceny_kolumny`
--

CREATE TABLE `oceny_kolumny` (
  `id` bigint NOT NULL,
  `kod` text NOT NULL,
  `opis` text NOT NULL,
  `kolor` text NOT NULL,
  `waga` int NOT NULL,
  `kategoria` text NOT NULL,
  `id_semestr` bigint NOT NULL,
  `id_klasa` bigint NOT NULL,
  `id_nauczyciel` bigint NOT NULL,
  `id_przedmiot` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opiekunowie`
--

CREATE TABLE `opiekunowie` (
  `id` bigint NOT NULL,
  `imie` text NOT NULL,
  `drugie_imie` text NOT NULL,
  `nazwisko` text NOT NULL,
  `pesel` varchar(11) NOT NULL,
  `plec` enum('K','M') NOT NULL,
  `nr_tel` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `opiekunowie_relacje`
--

CREATE TABLE `opiekunowie_relacje` (
  `id` bigint NOT NULL,
  `id_uczen` bigint NOT NULL,
  `id_opiekun` bigint NOT NULL,
  `relacja` enum('ojciec','matka','opiekun') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `profile`
--

CREATE TABLE `profile` (
  `id` bigint NOT NULL,
  `nazwa` text NOT NULL,
  `kod` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmioty`
--

CREATE TABLE `przedmioty` (
  `id` bigint NOT NULL,
  `nazwa` text NOT NULL,
  `rozszerzony` tinyint(1) NOT NULL,
  `obowiazkowy` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `id` bigint NOT NULL,
  `imie` text NOT NULL,
  `drugie_imie` text NOT NULL,
  `nazwisko` text NOT NULL,
  `pesel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `plec` enum('K','M') NOT NULL,
  `data_urodzenia` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `data_miejsce` text NOT NULL,
  `narodowosc` text NOT NULL,
  `polskie_obywatelstwo` tinyint(1) NOT NULL,
  `imie_ojca` text NOT NULL,
  `imie_matki` text NOT NULL,
  `nazwisko_panienskie_matki` text NOT NULL,
  `adres_zamieszkania` text NOT NULL,
  `adres_zameldowania` text NOT NULL,
  `adres_korespondencyjny` text NOT NULL,
  `nr_tel` text NOT NULL,
  `email` text NOT NULL,
  `dodatkowe_informacje` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `id_klasa` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uwagi`
--

CREATE TABLE `uwagi` (
  `id` bigint NOT NULL,
  `tytul` text NOT NULL,
  `opis` text NOT NULL,
  `pozytywna` tinyint(1) NOT NULL,
  `id_uczen` bigint NOT NULL,
  `id_nauczyciel` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klasy`
--
ALTER TABLE `klasy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `klasy_wychowawcy`
--
ALTER TABLE `klasy_wychowawcy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `konta`
--
ALTER TABLE `konta`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `konta_relacja_uczniowie`
--
ALTER TABLE `konta_relacja_uczniowie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `lekcje`
--
ALTER TABLE `lekcje`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `lekcje_numer`
--
ALTER TABLE `lekcje_numer`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `nauczyciele`
--
ALTER TABLE `nauczyciele`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `nauczyciele_przedmioty`
--
ALTER TABLE `nauczyciele_przedmioty`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `oceny`
--
ALTER TABLE `oceny`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `oceny_kolumny`
--
ALTER TABLE `oceny_kolumny`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `opiekunowie`
--
ALTER TABLE `opiekunowie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `opiekunowie_relacje`
--
ALTER TABLE `opiekunowie_relacje`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uwagi`
--
ALTER TABLE `uwagi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `klasy`
--
ALTER TABLE `klasy`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `klasy_wychowawcy`
--
ALTER TABLE `klasy_wychowawcy`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `konta`
--
ALTER TABLE `konta`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `konta_relacja_uczniowie`
--
ALTER TABLE `konta_relacja_uczniowie`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `lekcje`
--
ALTER TABLE `lekcje`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `lekcje_numer`
--
ALTER TABLE `lekcje_numer`
  MODIFY `id` tinyint(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `nauczyciele`
--
ALTER TABLE `nauczyciele`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `nauczyciele_przedmioty`
--
ALTER TABLE `nauczyciele_przedmioty`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `oceny`
--
ALTER TABLE `oceny`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `oceny_kolumny`
--
ALTER TABLE `oceny_kolumny`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `opiekunowie`
--
ALTER TABLE `opiekunowie`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `opiekunowie_relacje`
--
ALTER TABLE `opiekunowie_relacje`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `profile`
--
ALTER TABLE `profile`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `uwagi`
--
ALTER TABLE `uwagi`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
