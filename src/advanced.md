---
  author:
    - name : Vincent Cheval
      webpage : https://members.loria.fr/vcheval
    - name : Steve Kremer
      webpage : https://members.loria.fr/SKremer
    - name : Itsaka Rakotonirina
      webpage : https://members.loria.fr/IRakotonirina

  title: DeepSec prover
  pagetitle: Manual - Advanced options
  mainpagetitle: Manual of DeepSec

  depth: ../

  navigation: true

  next_page: The Graphical User Interface
  next_page_url: manual/gui.html
  prev_page: Tutorial
  prev_page_url: manual/tutorial.html
---


## Advanced options {#advanced}

**Deepsec** provides a number of _advanced_ options which require a bit more understanding of the semantics and inner working of **deepsec**. Below we give a slightly more in-depth explanation and pointers to relevant papers.


### Partial Order Reductions {#por}


Partial Order Reductions (POR) are a technique to battle state explosion. Given that the number of interleavings of parallel processes is exponential, POR techniques try to avoid the need to explore _all_ interleavings. For example, given actions $a, b, c, d$, sometimes the interleavings $a b c d$ and $a c b d$ may be completely equivalent in the sense that neither of them increases the attacker's power to distinguish. One may think of this as a _partial order_: we need to consider all interleavings such that
$a$ < $b,c$ <$d$ where < is the precedence relation, but $b$ and $c$ are not ordered. POR techniques then only explore one representative of each class of equivalent interleavings.

*Deepsec* implements the POR techniques presented in [@BDH-concur15]. The techniques are correct for a class of _action determinate_ processes. *Deepsec* checks a slightly stronger, syntactic condition: there are no two parallel processes that have two outputs, respectively inputs, on the same channel, and all channels are public.

By default, the POR optimization is activated automatically whenever this syntactic condition is satisfied. One can manually disable the POR optimization, using either the command line or the graphical user interface. Note that even if POR is set manually to true, it does not change the behavior of non determinate processes in order to guarantee soundness of the result.


### Choosing the semantics {#semantics}

The applied pi calculus comes with formal semantics under the form of a _transition relation_ between processes [@ABF-jacm18]. Minor, apparently insignificant variants have been considered in the literature. In [@BCK-jcs20], typical small variants of the semantics of public communications, occurring in the literature, are studied and 3 different semantics are considered:

 * the classic semantics,
 * the private semantics, and the
 * eavesdrop semantics.

We will explain the difference between these semantics on an example.

```{.deepsec}
let P = out(c,t).P1 | in(c,x).P2
```
We suppose that `c` is a public name, i.e., the channel is known to the adversary.


In the _classical semantics_, as defined in the original paper presenting the applied pi calculus [@ABF-jacm18], the process `P` may reduce in different ways:

 * `P` may perform an _internal communication_ and reduce to `P1 | P2{t/x}` that is the two parallel processes perform the output and the corresponding input and the variable `x` is replaced by the term `t` in process `P2`; an important point is that this is an _internal_ action and therefore not visible to the adversary;

 * `P` may perform a visible output on channel `c` and continue as `P1 | in(c,x).P2`, adding `t` to the attacker knowledge;

 * `P` may perform a visible input on channel `c` and continue as ` out(c,t).P1 | P2{u/x}` where `u` is a term provided by the attacker.


In the _private semantics_ we remove the possibility of internal communication on a public channel. Internal communications are only possible on private channels. These semantics have been considered in many papers, because an adversary can explicitly forward the term `t` by successively performing a visible output and a visible input with term `t` (which can be provided by the attacker as it was added to his knowledge just before). An advantage of these semantics is that verification is more efficient as less interleavings need to be considered.

While the two semantics are equivalent for reachability properties, they happen to be incomparable, in general, when verifying trace equivalence (or other equivalences), as shown in [@BCK-jcs20]: two processes may be trace equivalent in the private semantics, but not in the classical semantics, and vice-versa.


In the _eavesdrop semantics_, all three possible reductions of the classical semantics are considered. However, when performing an internal communication on a public channel, this action becomes visible to the attacker and the term is added to his knowledge.

Whenever trace equivalence holds in the eavesdrop semantics it also holds in both the classical and private semantics. Therefore, verification with the eavesdrop semantics is a conservative choice.



It was also shown in [@BCK-jcs20] that trace equivalence coincides on all three semantics for the class of strongly determinate processes, that is the class on which **deepsec** enables POR techniques. The default semantics of **deepsec** are the private semantics which yield more efficient verification. The semantics can be modified using either the command line or the graphical user interface.




### Distributing the computation {#distributed}


**Deepsec** allows to distribute the computation on multiple cores, as well as on multiple servers. To explain the distribution we need to give a high-level overview on how **deepsec** verifies trace equivalence.

To check trace equivalence **deepsec** needs to compute a large symbolic execution tree, called the _partition tree_: each path in this tree corresponds to a symbolic trace, i.e. a trace that may contain non instantiated variables. Each node in the tree regroups the set of equivalent, symbolic processes, after the execution of the symbolic trace leading to this node. Checking trace equivalence between processes `P` and `Q` then consists in verifying that each node contains at least one process derived from `P` and one derived from `Q`.

The main idea of the distribution is to let different cores explore different branches of the tree.

 * The first step is the _job creation_: we generate, in a breadth-first manner, a number of nodes whose subtrees need to be generated and explored. These nodes are stored in a queue and called _jobs_. The number of such jobs that are initially generated

 * Next each _worker_, i.e., each core, fetches a job and verifies the underlying subtree. When a job is finished, the _worker_ fetches the next job in the queue.

* As the tree is not balanced, some jobs may require much more computation than others (and we cannot predict wich jobs are taking more time). Therefore,  some workers may become idle while others still have a large subtree to verify. When a worker becomes idle, i.e., the queue of pending jobs is empty, we start a _timer_: after the time-out we kill ongoing jobs, and start a new job creation phase to distribute the computation of these remaining large subtrees. This is called a new _round_.

The time-out before staring the next round avoids killing on-going work that is about to finish and get into a job creation -- kill worker loop.

The [command line](#command-distributed) and graphical user interface allow to set the values for

* the number of local and remote workers -- when set to 'auto' all available, physical cores are used;
* the minimum number of jobs created in the job creation phase -- when set to 'auto' the number of jobs is 100 $\times$ the total number of workers;
* the round timer -- the default value is 120 seconds.



