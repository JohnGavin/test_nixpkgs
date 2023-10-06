let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/edd2e49f9904e5c377d76bf74351e1d12e5b9016.tar.gz") {};
 rpkgs = builtins.attrValues {
   inherit (pkgs.rPackages) quarto;
};
 system_packages = builtins.attrValues {
   inherit (pkgs) R quarto;
};
in
 pkgs.mkShell {
   buildInputs = [  rpkgs system_packages  ];
     shellHook = ''
       Rscript -e 'quarto::quarto_version()'
     '';
}
