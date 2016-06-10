set -e
set -x

ocamlc -version

if [ -d ../opam-cache-$COMPILER ]
then
    cp -r ../opam-cache-$COMPILER ~/.opam
    eval `opam config env`
else
    opam pin add -y --no-action .
    opam install -y --deps-only lwt

    cp -r ~/.opam ../opam-cache-$COMPILER
fi

opam install -y --build-test --keep-build-dir lwt
