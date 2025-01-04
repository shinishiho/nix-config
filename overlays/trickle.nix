(final: prev: {
  trickle = prev.trickle.overrideAttrs (oldAttrs: {

    preConfigure = ''
      sed -i 's|libevent.a|libevent.so|' configure
      sed -i 's/if test "$HAVEMETHOD" = "no"; then/if false; then/' configure
      sed -i 's/exit(1)/exit(0)/' configure

      sed -i '1i#define DLOPENLIBC "${final.stdenv.cc.libc}/lib/libc.so.6"' trickle-overload.c
    '';

    env = (oldAttrs.env or {}) // {
      NIX_CFLAGS_COMPILE = toString [
        "-I${final.libtirpc.dev}/include/tirpc"
        "-Wno-pointer-sign"
      ];
    };

    patches = (oldAttrs.patches or []) ++ [
      ./trickle.patch
    ];
  });
})
