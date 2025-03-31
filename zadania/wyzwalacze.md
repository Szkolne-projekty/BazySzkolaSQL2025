# Wyzwalacze

### 1. Zrealizować wyzwalacz, który będzie dla uczniów otrzymujących piątą jedynkę wpisywał do jego statusu „potrzebujący pomocy”.

```sql
DELIMITER //

CREATE TRIGGER uczen_potrzebuje_pomocy
AFTER INSERT ON oceny
FOR EACH ROW
BEGIN
    DECLARE liczba_jedynek INT;

    SELECT COUNT(*) INTO liczba_jedynek
    FROM oceny
    WHERE id_uczen = NEW.id_uczen AND wartosc = 1;

    IF liczba_jedynek = 5 THEN
        UPDATE uczniowie
        SET dodatkowe_informacje = 'potrzebujący pomocy'
        WHERE id = NEW.id_uczen;
    END IF;
END //

DELIMITER ;
```
