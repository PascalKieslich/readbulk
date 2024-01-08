# readbulk 1.1.4
* `read_bulk`: Introduced `name_contains` argument, an optional character string. If specified, only files whose name contains this string will be merged.
* `read_bulk`: Introduced `name_filter` argument, an optional regular expression. If specified, only files whose name matches this regular expression will be merged.

# readbulk 1.1.3
* Updated package description and documentation

# readbulk 1.1.2
* Improved speed of `read_bulk` and `read_opensesame` by binding data together only once (for every subdirectory)

# readbulk 1.1.1
* Online documentation added using the `pkgdown` package - it can be found at http://pascalkieslich.github.io/readbulk/
* As this release does not include any changes in the code or the function documentation, no new version was released on CRAN

# readbulk 1.1.0
* Introduced `verbose` argument so users can decide whether `read_bulk` and `read_opensesame` report its progress or not

# readbulk 1.0.0
* First release
