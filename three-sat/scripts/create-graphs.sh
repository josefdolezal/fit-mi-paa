#!/bin/bash

gnuplot scripts/annealing-factor.gp > Measurement/annealing-factor.png
gnuplot scripts/equilibrium.gp > Measurement/equilibrium.png
gnuplot scripts/initial-temperature.gp > Measurement/initial-temperature.png
