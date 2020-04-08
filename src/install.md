---
  author:
    - name : Vincent Cheval
      webpage : https://members.loria.fr/vcheval
    - name : Steve Kremer
      webpage : https://members.loria.fr/SKremer
    - name : Itsaka Rakotonirina
      webpage : https://members.loria.fr/IRakotonirina

  title: DeepSec prover
  pagetitle: Manual - Installation
  mainpagetitle: Manual of DeepSec

  depth: ../

  navigation: true

  next_page: Tutorial
  next_page_url: manual/tutorial.html
  prev_page: Introduction
  prev_page_url: manual.html
---

## Download and installation

In this section we will guide you through the installation of the
**DeepSec** prover and its graphical user interface **DeepSec UI**.
**DeepSec** can be used independently of **DeepSec UI** but the latter
requires the former to be installed.  Please install both so that you
can test as many feature as possible.


### Installation of DeepSec

**DeepSec** requires **OCaml > 4.05**.  It is highly recommended to install **OCaml** through `opam` instead of a native package manager, such as `apt-get` (the latest version on `apt-get may` not be the latest release of OCaml). `opam` itself may however be safely installed using your favorite package manager (see instructions for installing `opam`).
To know your current version of **OCaml**, just run `ocaml --version`.

### Upgrading OCaml using OPAM 1.x.x (Can be skipped if you already have ocaml 4.05 or later)

1. Run `opam switch list` (The version 4.05.0 should be displayed in the list. Otherwise run first `opam update`).
2. Run `opam switch 4.05.0` (or a more recent version).
3. Follow the instructions (at the end do not forget to set the environment by running ``eval `opam config env` ``).

### Upgrading OCaml using OPAM 2.x.x (Can be skipped if you already have ocaml 4.05 or later)

1. Run `opam switch list-available` (The version `ocaml-base-compiler 4.05.0` should be displayed in the list. Otherwise, first run `opam update`).
2. Run `opam switch create 4.05.0` (or a more recent version).
3. Follow the instructions.

### Installation of DeepSec from source

**Deepsec** requires the package **ocamlbuild** to compile which itself requires **ocamlfind**. It is important that both ocamlbuild and ocamlfind are compiled with the same version of OCaml. Running `opam install ocamlbuild` may not install ocamlfind if an instance of ocamlfind was installed on a different installation of OCaml (which sometimes happen on MacOSX). It is safer to run `opam install ocamlfind` before.
Once the alpha version has been tested, we foresee to provide an `opam` package for **DeepSec** to ease the installation.

1. Run `opam install ocamlfind` (Optional if already installed)
2. Run `opam install ocamlbuild` (Optional if already installed)
3. Run `git clone https://github.com/DeepSec-prover/deepsec.git` (with a HTTPS connexion) or `git clone git@github.com:DeepSec-prover/deepsec.git` (with a SSH connexion)
4. Inside the directory `deepsec`, run `make`
5. The executable program `deepsec` has been built.

Note that two additional executables are compiled at the same time as `deepsec`: `deepsec_worker` and `deepsec_api`. The former is used by **DeepSec** to distribute the computation on multi-core architectures and clusters of computers. The latter is used to communicate with **DeepSec UI**. Both should not be used manually nor should they be moved from the `deepsec` folder.

### Installation of DeepSec UI

**DeepSec UI** has been packaged so you don't need to compile it from the source. Just download the version according to your OS and double click. You can also directly visit [DeepSec UI Releases](https://github.com/DeepSec-prover/deepsec_ui/releases) to get the lastest version. If you need another distribution, please feel free to ask (currently no windows support...)

1. For MacOSX: [deepsec-ui-1.0.0-rc3_OSX.dmg](https://github.com/DeepSec-prover/deepsec_ui/releases/download/v1.0.0-rc3/deepsec-ui-1.0.0-rc3_OSX.dmg)
2. For Linux:
  - Debian: [deepsec-ui-1.0.0-rc3_amd64.deb](https://github.com/DeepSec-prover/deepsec_ui/releases/download/v1.0.0-rc3/deepsec-ui-1.0.0-rc3_amd64.deb)
  - Snapshot: [deepsec-ui-1.0.0-rc3_amd64.snap](https://github.com/DeepSec-prover/deepsec_ui/releases/download/v1.0.0-rc3/deepsec-ui-1.0.0-rc3_amd64.snap)
  - AppImage: [deepsec-ui-1.0.0-rc3.AppImage](https://github.com/DeepSec-prover/deepsec_ui/releases/download/v1.0.0-rc3/deepsec-ui-1.0.0-rc3.AppImage)

To work, **DeepSec UI** requires to know the location of the executable `deepsec_api` that was installed by **DeepSec**. When **DeepSec** will be installed through `opam` in the foreseeable future, it will be added in your `PATH` environment automatically and so **DeepSec UI** will find it automatically. Thus currently, either you can add `deepsec_api` in your `PATH` or you can manually indicate to **DeepSec UI** where it is located (in the **Settings** menu of **DeepSec UI**).


### Editor modes

A dedicated package for syntax highlighting, `language-deepsec`, is available for installation within `atom`. Given that the **deepsec** input language is very close to the one used by the **proverif** verification tool you may use the proverif mode (proverif-pi-mode) for `emacs` distributed with [proverif](https://proverif.inria.fr).  


<!-- Written by Steve -->
