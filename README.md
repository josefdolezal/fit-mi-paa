# MI-PAA: Problémy a algoritmy 2017/18 [![Build Status](https://travis-ci.org/josefdolezal/fit-mi-paa.svg?branch=master)](https://travis-ci.org/josefdolezal/fit-mi-paa)

Repozitář s domácími úlohami předmětu MI-PAA, vyučovaného na FIT ČVUT (@FIT_CTU).
Seznam materiálů k ostatním předmětům je v [samostatném repozitáři](https://github.com/josefdolezal/fit-cvut).

| Přednášející | Cvičící         | Běh předmětu |
|--------------|-----------------|--------------|
| Jan Schmidt  | Jiří Dostál     | ZS 2017/18   |


## Řešené úlohy
* [Problém batohu](backpack-problem)
  * Metoda hrubé síly a heurisitka poměr cena/váha (úloha 1)
  * Metoda větví a hranic, dynamické programování (úloha 2)
  * Zkoumání vlivu změny parametrů generování na čas/odchylku (úloha 3)
  * Pokročilá heuristika - Simulované ochlazování (úloha 4)
* [Problém splnitelnosti vážené booleovské formule](three-sat)
  * Implementace s využitím metody *Simulované ochlazování* (úloha 5)

## Závěrečné zprávy

Zdrojové kódy k závěrečným zprávám jsou umístěné v adresáři [repots](reports). Kompilace všech zpráv je možná pomocí příkazu:

```bash
make reports
```

Jednotlivé reporty je možné zkompilovat příkazem `make report-<number>` kde `<number>` je číslo příslušného reportu, např:

```bash
make report-1
```

Zkompilované zprávy jsou dostupné na GitHubu v záložce [Releases](https://github.com/josefdolezal/fit-mi-paa/releases).

## Výpisky

Výpisky na semestrální test (cca do 6. přednášky) jsou v adresáři [notes](notes). Zkompilovat je lze příkazem:

```bash
make lecture-notes
```

Zkompilované se nachází v záložce [Releases](https://github.com/josefdolezal/fit-mi-paa/releases).

## Poznámka
Uvedené zdrojové kódy nebo jejich části slouží pro inspiraci a jako demonstrace
možného řešení problému. Důrazně nedoporučuji cizí zdrojové kódy odevzdávat/vydávat za vlastní. Pokud budete přebírat část kódu, uveďte řádně autora - předejdete tím možnému obvinění z plagiátorství ze strany školy.

Zveřejněné kódy a úlohy se mohou lišit od těch, které jsem ve škole odevzdal, nenesu tedy odpovědnost za jejich funkčnost.

## Licence
Repozitář je šířený pod licencí [MIT](LICENSE).
