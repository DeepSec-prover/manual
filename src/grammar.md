---
  author:
    - name : Vincent Cheval
      webpage : https://members.loria.fr/vcheval
    - name : Steve Kremer
      webpage : https://members.loria.fr/SKremer
    - name : Itsaka Rakotonirina
      webpage : https://members.loria.fr/IRakotonirina

  title: DeepSec prover
  pagetitle: Manual - Grammar
  mainpagetitle: Manual of DeepSec

  depth: ../

  navigation: true

  prev_page: Command line options
  prev_page_url: manual/command.html
---

## Language reference

We describe in details the grammar of **DeepSec** input files. We use
the following notations:

 * X* denotes any (possibly zero) number of repetitions of X;
 * {X} denotes that X is optional, i.e., zero or one occurence of X;
 * seq X denotes a (possibly empty) comma separated sequence of X, i.e. seq X = {X (, X)*};
 * seq+ X denotes a non-empty comma separated sequence of X, i.e. seq+ X = X (, X)*.

Moreover, we define the following types.

* \<ident\> is the set of identifiers that range over a sequence of
  letters (a-z, A-Z), digits (0-9), underscores (_), single-quotes (')
  where the first character of the identifier is a letter and the
  identifier is distinct from the reserved words of the language.

* \<sem\> is one of `classic`, `private`, `eavesdrop`.
* \<int\> is a natural number.

A file is a sequence of declarations (\<decl\>), process definitions
(\<proc_def\>) and queries (\<query\>).


### Terms and patterns

|  \<term\> ::= \<ident\>
|             | `(`seq+ \<term\>`)`
|             |  \<ident\>`(`seq+ \<term\>`)`



|  \<pattern\> ::= `=`\<term\>
|                | \<ident\>
|                | `(`seq+ \<pattern\>`)`



### Declarations

| \<decl\> ::= `set semantics =` \<sem\>.
|	         | `fun` \<ident\>/\<int\> {`[private]`}`.`
|            | `const` \<ident\> {`[private]`}`.`
|            | `free` \<ident\> {`[private]`}`.`
|            | `reduc` \<term\> `=` \<term\> (`;` \<term\> `=` \<term\>)*`.`
|            | `reduc` \<term\> `->` \<term\> (`;` \<term\> `->` \<term\>)*`.`




### Processes

| \<proc_def\> ::= `let` \<ident\>`(`seq \<ident\>`)` `=` \< process \>`.`


| \<process\> ::= `0`
|                | \< ident\>`(`seq \<term\>`)` 
|                | \<process\> `|` \<process\>
|                | `!^`\<int\> \< process\>
|                | `(`\<process\>`)`
|                | `in(`\<term\>`,`ident`); ` \<process\>
|                | `out(`\<term\>`,`\<term\>`);` \<process\>
|                | `new` \<ident\>`;` \<process\>
|                | `let` \<pattern\> `=` \<term\> in \<process\> {`else` \<process\>}
|                | `if` \<term\> `=` \<term\> `then` \<process\> {`else` \<process\>}



### Queries

| \<query\> ::= `query` `trace_equiv` `(`\<process\>`,`\<process\>`)`.
|              | `query` `session_equiv` `(`\<process\>`,`\<process\>`)`.
|              | `query` `session_incl` `(`\<process\>`,`\<process\>`)`.



### Comments

We allow 3 types of comments:

 * all text following `//` on a given line is commented;
 * all text between `/*` and `*/` is commented;
 * all text between `(*` and `*)` is commented.

