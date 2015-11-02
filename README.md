Bgum
====

The unit of generation is the page. A page is a *.eex file in the source
folder. Each page will be rendered, then injected into the layout file.

A page can support partials nested to an arbitrary depth.

Logic in the config.exs file will be run prior to build, allowing
additional pages to be generated in preparation for build.
