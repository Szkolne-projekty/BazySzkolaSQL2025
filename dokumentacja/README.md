# Projekt bazy danych - dokumentacja

## Tematyka projektu - Szkoła

### Założenia

Projekt miał polegać na utworzeniu przykładowej bazy danych szkoły (dziennika elektronicznego). W projekcie brali udział Rostyslav Honcharenko, Adam Kurzawa i Michał Muzyka. Prace odbywały się bez szczegółowych podziałów ról.

### Audyt

Zalążkiem projektu były rozmowy z dużą ilością pracowników szkoły (dyrektorem, nauczycielami). W ich trakcie przeprowadzono ankietę, której wynikiem są przedstawione poniżej dane:

!Link do danych

## Faktyczny projekt

### Praktyczne założenia

-   Baza obejmuje jedną szkołę podstawową

-   Użytkownikami bazy są:

    -   dyrektor, wicedyrektorzy itp.
    -   nauczyciele
    -   starsi uczniowie
    -   rodzice uczniów

-   Szkoła znajduje się w średniej wielkości mieście, posiada ok. 400 uczniów, co przekłada się na ok. 20 klas.

### Przypływ danych

Dziennie odbywa się średnio 6 \* liczba_klas lekcji i jest wpisywane ok. 15 ocen, co przekłada się na ok. 100-120 nowych wierszy dziennie.

### Kopia zapasowa

Jest to dosyć ważny aspekt w tym wypadku, ponieważ szkoły są instytucjami publicznymi i bezpieczeństwo danych musi zostać zapewnione. Dlatego kopie zapasowe nowych wierszy będą wykonywane codziennie. Przechowywane będą kopie z 3 ostatnich dni, oraz archiwizowane co tydzień w celu prowadzenia dokumentacji.

## Struktura bazy

Baza nie należy do najmniejszych, posiada 16 tabel, które dobrze pokazane są na poniższym diagramie

!Diagram.

Informacje z wszelkimi szczegółami można znaleźć w pliku struktury bazy: !Link do pliku

## Użytkownicy

Użytkownikami bazy będą zarówno pracownicy szkoły (dyrektor, nauczyciele, wychowawcy itp.) jak i uczniowie i ich rodzice.

W celu uniknięcia nieautoryzowanego dostępu do określonych danych, stworzono podział na rolę:

-   dyrektor - posiada możliwość odczytu, wprowadzania, modyfikacji i usuwania danych związanych z uczniami, lekcjami itp.

-   wicedyrektor - posiada zasób permisji podobny do dyrektora

-   nauczyciel - ma możliwość edytowania tematów lekcji, wpisywania ocen z przedmiotów, których uczy w danych klasach itp.

-   wychowawca - ma wgląd do np. ocen swojej klasy itp.

-   uczeń i rodzic - widzą swoich dzieci/swoje oceny itp.

## Przykładowe polecenia

Przykładowe polecenia można znaleźć w pliku: !Kwerendy

## Procedury i funkcje

Przykładowe procedury i funkcje można znaleźć w pliku: !Procedury i funkcje

## Wyzwalacze

Przykładowe wyzwalacze można znaleźć w pliku: !wyzwalacze
