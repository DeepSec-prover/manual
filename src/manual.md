---
  author:
    - name : Vincent Cheval
      webpage : https://members.loria.fr/vcheval
    - name : Steve Kremer
      webpage : https://members.loria.fr/SKremer
    - name : Itsaka Rakotonirina
      webpage : https://members.loria.fr/IRakotonirina

  title: DeepSec prover
  pagetitle: Manual
  mainpagetitle: Manual of DeepSec

  navigation: true

  next_page: Installation
  next_page_url: manual/install.html
  prev_page:
  prev_page_url:
---

## Introduction

The **deepsec** prover is a verification tool for cryptographic protocols. It allows the verification of security properties (expressed as a trace equivalence) of protocols described in the applied pi calculus. The tool operates in the so-called "bounded number of sessions" model: while it only allows to specify a fixed number of participants and sessions, termination is always guaranteed (though computational ressources may be exhausted if the model is too large).





### Scope of this manual

This manual provides a "hands-on" introduction on how to use the tool. It will provide intuitive explanations of the language and the properties. It will also explain the different options and prov ide a reference guide for the precise syntax. It will however *not* give formal semantics nor explain the underlying algorithms.  The theory underlying **deepsec** is described in [@CKR-sp18] and [@CKR-ccs19]. Some of the implementation choices are also discussed in a tool paper [@CKR-cav18].


### Support

Please report any bugs to [`vincent.cheval@inria.fr`](mailto:vincent.cheval@inria.fr) or file an issue on our [github](https://github.com/DeepSec-prover/deepsec/issues).







### Acknowledgements

The research that led to **deepsec** was primarily supported by ERC under the EU’s H2020 research and innovation program (grant agreements No 645865-SPOOC), as well as from the French ANR projects SEQUOIA ( ANR-14-CE28-0030-01) and TECAP (ANR-17-CE39-0004-01).
