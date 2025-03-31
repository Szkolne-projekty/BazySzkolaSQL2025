# Kwerendy

### 1. Policz liczbę ocen wystawionych w kolejnych dniach poprzedniego tygodnia kalendarzowego.

```sql
SELECT
    DATE(data_utworzenia) AS dzien,
    COUNT(*) AS liczba_ocen
FROM oceny
WHERE YEARWEEK(data_utworzenia, 1) = YEARWEEK(CURDATE(), 1) - 1
GROUP BY dzien
ORDER BY dzien;
```

### 2. Którzy nauczyciele nie wystawili oceny dłużej niż 10 dni?

```sql
SELECT n.id_nauczyciel
FROM (SELECT id_nauczyciel, MAX(data_utworzenia) AS ostatnia_ocena FROM oceny GROUP BY id_nauczyciel) n
WHERE n.ostatnia_ocena < CURDATE() - INTERVAL 10 DAY;
```

### 3. Ile było ocen z każdego przedmiotu w ciągu poprzedniego miesiąca kalendarzowego?

```sql
SELECT
    p.nazwa AS przedmiot,
    COUNT(o.id) AS liczba_ocen
FROM oceny o
JOIN oceny_kolumny ok ON o.id_kolumna = ok.id
JOIN przedmioty p ON ok.id_przedmiot = p.id
WHERE
    YEAR(o.data_utworzenia) = YEAR(CURDATE() - INTERVAL 1 MONTH)
    AND MONTH(o.data_utworzenia) = MONTH(CURDATE() - INTERVAL 1 MONTH)
GROUP BY p.nazwa
ORDER BY liczba_ocen DESC;

```

### 4. Którzy uczniowie otrzymywali oceny wyższe niż średnia w poprzednim roku kalendarzowym?

```sql
SELECT DISTINCT u.id, u.imie, u.nazwisko
FROM uczniowie u
JOIN oceny o ON u.id = o.id_uczen
WHERE o.wartosc > (
    SELECT AVG(wartosc)
    FROM oceny
    WHERE YEAR(data_utworzenia) = YEAR(CURDATE()) - 1
)
AND YEAR(o.data_utworzenia) = YEAR(CURDATE()) - 1;
```

### 5. Podaj klasy w których uczy nauczyciel XXX (Grzegorz Brzęczyszczykiewicz).

```sql
SELECT DISTINCT k.id, k.nazwa
FROM klasy k
JOIN klasy_przedmioty kp ON k.id = kp.id_klasa
JOIN nauczyciele_przedmioty np ON kp.id_nauczyciel_przedmiot = np.id
JOIN nauczyciele n ON np.id_nauczyciel = n.id
WHERE n.imie = 'Grzegorz' AND n.nazwisko = 'Brzęczyszczykiewicz';
```

### 6. Podaj nauczycieli i uczniów którzy mieszkają w tej samej miejscowości i na tej samej ulicy.

```sql
SELECT
    n.id AS id_nauczyciel,
    n.imie AS imie_nauczyciela,
    n.nazwisko AS nazwisko_nauczyciela,
    u.id AS id_uczen,
    u.imie AS imie_ucznia,
    u.nazwisko AS nazwisko_ucznia,
    n.miejscowosc,
    n.ulica
FROM nauczyciele n
JOIN uczniowie u ON n.miejscowosc = u.miejscowosc AND n.ulica = u.ulica;
```
