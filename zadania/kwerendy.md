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
