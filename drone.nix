with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "node";
    buildInputs = [
        git
        cmake
        openssl
        zeromq
        jq
        rustc
        cargo
        nodejs
    ];
    shellHook = ''
        export PATH="$PWD/node_modules/.bin/:$PATH"
    '';
}
