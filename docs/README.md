# Koller-Database

Adatbázissal kapcsolatos fájlok a Koller-hez.

### Adatbázis beállítása

A fejlesztés során a **MariaDB Community 10.10.3**-as verziójával dolgozunk, ami letölthető manuálisan a [MariaDB hivatalos oldaláról](https://mariadb.com/downloads/community/), vagy a használt diszribúció csomagkezelőjének segítségével.

MariaDB szerver futtatásához fordulj a hivatalos oldalukhoz, illetve a diszribúció wiki-jéhez!

Parancssorból importáljuk a táblákat a `schema.sql` fájl segítségével. Ez a fájl tartalmazza az adatbázis sémáját, de fel szükséges tölteni alapvető információkkal, a felhasználói adatok mellett[^1], mint például engedélyekkel. Erre az általunk fejlesztéskor használt konfiguráció a `config.sql` fájlban található. Azonban saját konfiguráció is készíthető, sőt ajánlott!

[^1]: A `testdata.sql` például tartalmaz felhasználói adatokat. Ezt a fájlt a [Koller-Server](https://github.com/KollerSystems/Koller-Server) tesztelése során használjuk. Nem betöltendő produkciós környezetben!

Az adatbázisból való "dump"-olásról, és az sql fájl betöltéséről a [MariaDB weboldalán olvashatunk](https://mariadb.com/kb/en/mariadb-dumpmysqldump/).

A kívánt eredmény elérése után nyissuk meg a szerver fájljain belül található `options.json` fájlt egy szövegszerkesztő programmal. Írjuk át a `user` értékét a felhasználónevünkre (ha más felhasználónak hoztuk létre az adatbázist akkor annak a nevére), illetve a `password` értékét a jelszóra, ha be lett állítva, egyébként maradjon üresen.

### dummy adatok generálása - `generate.py`

Amennyiben szükség van számos (_kizárólag tesztelésre használandó_) adatra, a [`generate.py`](../generate.py) megfelelő eszköznek bizonyulhat az adatbázis populárása.

Fejlesztés során a **python 3.11**-es verzióját használjuk, külső függősége a [mariadb](https://pypi.org/project/mariadb/) csomag. Ez telepíthető a `pip install mariadb` parancs segítségével.

A script futtatáskor rákapcsolódik a mariadb szerverre és elkezdi feltölteni azt adattal. Emiatt szükséges lehet konfigurálni az adatbázist birtokló felhasználónevével és jelszavával(továbbá egy porttal amin az adatbázis elérhető).

Mielőtt azonban futtatnánk, **töröljünk minden adatot** az adatbázisból, kivéve amik a következő táblák valamelyikében vannak: `route_access`, `permissions`, `errors`

Konfigurálható továbbá maga a generáció is. Ehhez a megfelelő(NAGYBETŰS) változókat kell beállítani. Minden ilyen változó felett található rövid magyarázat(kommentben), hogy mit csinál.

Futtatás közben a program kiírja éppen hol tart, mit generál. A folyamat végére az adatbázisban fellelhetőek lesznek a generált adatok, konfigurációnk szerint.