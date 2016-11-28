<!-- README.md is generated from README.Rmd. Please edit that file -->
readbulk
========

[![cran version](http://www.r-pkg.org/badges/version/readbulk)](https://CRAN.R-project.org/package=readbulk) [![DOI](https://zenodo.org/badge/51659562.svg)](https://zenodo.org/badge/latestdoi/51659562)

**readbulk** is an `R` package that facilitates loading multiple data files with a similar structure and combining them into a single `data.frame`, using the `read_bulk` function. It wraps most common `R` functions for reading data, retaining the flexiblity of the available tools.

For (experimental) psychologists, the package provides the `read_opensesame` function which wraps the above, providing the appropriate defaults for loading the many files created by [OpenSesame](http://osdoc.cogsci.nl/).

General Information
-------------------

The `readbulk` package was developed by Pascal Kieslich, with contributions by Felix Henninger. It is published under the GNU General Public License (version 3).

An overview of the functions in this package can be found [online](http://pascalkieslich.github.io/readbulk/reference). Please see [news](http://pascalkieslich.github.io/readbulk/news) for a summary of changes in the package.

Installation
------------

The current stable version is available on CRAN and can be installed via `install.packages("readbulk")`.
