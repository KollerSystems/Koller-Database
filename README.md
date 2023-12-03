# Koller-Database

Adatbázissal kapcsolatos fájlok a Koller-hez.

### Adatbázis beállítása

A fejlesztés során a **MariaDB Community 10.10.3**-as verziójával dolgozunk, ami letölthető manuálisan a [MariaDB hivatalos oldaláról](https://mariadb.com/downloads/community/), vagy a használt diszribúció csomagkezelőjének segítségével.

MariaDB szerver futtatásához fordulj a hivatalos oldalukhoz, illetve a diszribúció wiki-jéhez!

Parancssorból importáljuk a táblákat a `schema.sql` fájl segítségével. Ez a fájl tartalmazza az adatbázis sémáját, de fel szükséges tölteni alapvető információkkal, a felhasználói adatok mellett, mint például engedélyekkel.

Ha más felhasználónak hoztuk létre az adatbázist, akkor annak a felhasználónak az adatbázisába töltsük be.

Az adatbázisból való "dump"-olásról, és az sql fájl betöltéséről a [MariaDB weboldalán olvashatunk](https://mariadb.com/kb/en/mariadb-dumpmysqldump/).

Nyissuk meg a szerver fájljain belül található `options.json` fájlt egy szövegszerkesztő programmal, és írjuk át a `user` értékét a felhasználónevünkre (ha más felhasználónak hoztuk létre az adatbázist akkor annak a nevére), illetve a `password` értékét a jelszóra, ha be lett állítva, egyébként maradjon üresen.