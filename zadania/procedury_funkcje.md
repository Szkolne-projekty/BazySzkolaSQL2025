# Procedury i funkcje

### 1. Zrealizować procedurę, która będzie zwiększać wszystkim uczniom ocenę o wartość podaną przy wywołaniu jako dana wejściowa z przedmiotu też podanego przy wywołaniu.

```sql
DELIMITER //

CREATE PROCEDURE zwieksz_oceny(
    IN p_id_przedmiot BIGINT,
    IN p_wartosc_zmiany FLOAT
)
BEGIN
    UPDATE oceny o
    JOIN oceny_kolumny ok ON o.id_kolumna = ok.id
    SET o.wartosc = o.wartosc + p_wartosc_zmiany
    WHERE ok.id_przedmiot = p_id_przedmiot;
END //

DELIMITER ;
```

### 2. Wykorzystując funkcję IF zrealizować zapytanie, po wywołaniu którego wyświetlać się będzie przy każdej klasie jedna z 3 informacji: ‘super’, ‘jako taka’, ‘marna’ w zależności od wartości średniej klasy z wszystkich ocen.

```sql
DELIMITER //

CREATE FUNCTION ocena_klasy(p_id_klasy BIGINT)
RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE srednia FLOAT;

    SELECT AVG(o.wartosc) INTO srednia
    FROM oceny o
    JOIN uczniowie u ON o.id_uczen = u.id
    WHERE u.id_klasa = p_id_klasy;

    RETURN IF(srednia >= 4.0, 'super',
              IF(srednia >= 3.0, 'jako taka', 'marna'));
END //

DELIMITER ;
```
