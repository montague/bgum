Bgum
====

The unit of generation is the page. A page is a *.eex file in the src
folder. Each page will be rendered, then injected into the layout file.

A page can support partials nested to an arbitrary depth.

Logic in the config.exs file will be run prior to build, allowing
additional pages to be generated in preparation for build.

When building, copy existing src/*.eex into a build dir (_src_build).
This way generated pages can be placed into that same dir prior to the
build step and we won't have to generate those files into the src
directory.
