# pdflatex Docker

A simple Docker container to compile a TeX file into PDF using [pdflatex](https://en.wikipedia.org/wiki/PdfTeX).

## Running

When running the container, all additional options are passed to `pdflatex`.
For example, you can get the help prompt with:
```sh
docker run --rm -it ghcr.io/edulinq/pdflatex-docker --help
```

You should mount your directory containing your TeX file and all the resources it refers to (using a relative path) to the `/work` directory.
The container will be run with `/work` as the WORKDIR (working directory), so you can refer to your TeX file with a relative path.
A full invocation using compiling a `sample.tex` file in the `src` directory may look something like:
```sh
docker run --rm -it -v "./src:/work" ghcr.io/edulinq/pdflatex-docker sample.tex
```

After compilation, everything will the mounted directory will have their owner and group set to the owner and group of the passed-in TeX file.

See the [entrypoint.sh](./scripts/entrypoint.sh) script for exact details on how `pdflatex` is invoked.
