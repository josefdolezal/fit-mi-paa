# fit-mi-paa [![Build Status](https://travis-ci.com/josefdolezal/fit-mi-paa.svg?token=AxpSW7yys3aiQpPG9zMW&branch=master)](https://travis-ci.com/josefdolezal/fit-mi-paa)

# Repozitář k předmětu MI-PAA 2017/18

## Řešené úlohy
* [Problém batohu](backpack-problem)

## Kompilace a testování
Zdrojové kódy jsou psané v jazyce Swift 4, ke kompilaci je nutné využít Xcode 9.

Pro kompilaci i testování je připraven Makefile, který využívá `xcodebuild`.

### Kompilace

Pro kompilaci pomocí Makefile slouží příkaz:

```bash
$ make build
```

### Testování

Část aplikace je pokryta Unit testy, lze je spustit příkazem:

```bash
$ make test
```
