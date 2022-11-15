{ nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false, strip ? true }:

let

  pkgs = nixpkgs.pkgsMusl;

  f = { mkDerivation, base, blaze-html, clay, lib, scotty, text, wai-extra, wai-middleware-static, warp, wai, }:
      mkDerivation {
        pname = "9k";
        version = "0.1.0.0";
        src = ./.;
        isLibrary = false;
        isExecutable = true;
        executableHaskellDepends = [ base blaze-html clay scotty text wai-extra wai-middleware-static warp wai ];
        license = "unknown";
        configureFlags = [
          "--ghc-option=-optl=-static"
          "--extra-lib-dirs=${pkgs.gmp6.override { withStatic = true; }}/lib"
          "--extra-lib-dirs=${pkgs.zlib.static}/lib"
          "--extra-lib-dirs=${pkgs.libffi.overrideAttrs (old: { dontDisableStatic = true; })}/lib"
        ] ++ pkgs.lib.optionals (!strip) [
          "--disable-executable-stripping"
        ] ;
        mainProgram = "9k";
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage f {});

in

  if pkgs.lib.inNixShell then drv.env else drv
