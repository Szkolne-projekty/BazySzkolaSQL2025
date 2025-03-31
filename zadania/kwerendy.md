# Kwerendy

1. Policz liczbę ocen wystawionych w kolejnych dniach poprzedniego tygodnia kalendarzowego.

```sql
SELECT
    DATE(data_utworzenia) AS dzien,
    COUNT(*) AS liczba_ocen
FROM oceny
WHERE YEARWEEK(data_utworzenia, 1) = YEARWEEK(CURDATE(), 1) - 1
GROUP BY dzien
ORDER BY dzien;
```
