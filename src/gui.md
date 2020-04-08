---
  author:
    - name : Vincent Cheval
      webpage : https://members.loria.fr/vcheval
    - name : Steve Kremer
      webpage : https://members.loria.fr/SKremer
    - name : Itsaka Rakotonirina
      webpage : https://members.loria.fr/IRakotonirina

  title: DeepSec prover
  pagetitle: Manual - Graphical User Interface
  mainpagetitle: Manual of DeepSec

  depth: ../

  navigation: true

  next_page: Command line options
  next_page_url: manual/command.html
  prev_page: Advanced Options
  prev_page_url: manual/advanced.html
---

## The graphical User Interface


**Deepsec** comes with a Graphical User Interface (GUI). **DeepSecUI** is a standalone application that interacts with the `deepsec_api` executable.

When launching the application you should see a pop-up message stating  _"DeepSec API version x.y.z successfully detected"_. This means that **DeepSecUI** was able to successfully locate the `deepsec_api` executable. If you see a message _"DeepSec API path is not set"_ you must either add the path to your executable in your system PATH, or manually indicate _Absolute Path of deepsec_api_ in the _Settings_.

The GUI should be rather intuitive and mostly self-explanatory if you are familiar with protocol verification. We document each of the sections of the GUI and its main items.

### Start run

**DeepSecUI** allows to select several files and run **deepsec** on these files for verification. Such a set of files is called a _batch_. Running **deepsec** on a single file is called a _run_. Each file may contain several _queries_ to be verified.

The _Select files_ button allows to select one or more files for a run, respectively batch. It is possible to specify a title for a run or batch. If specified, this title will be used in the _Results_ section to refer to the batch, or run.

One can also set the advanced options for the [_semantics_](#sematics) and [_distributed computation_](#distributed) as document in [_Advanced options_](#advanced).


### Results

The _Results_ section displays a list of all previous verification batches.


#### Batch, run and query information

Clicking on a particular batch in  the list of all batches provides detailed information and results regarding the selected batch.
The detailed information includes

 * a summary with general information such as the precise time, the verification time and the memory usage;
 * all run options, regarding semantics, POR and distribution of computation;
 * version information about the precise version of **deepsec** and the compiler.

These information are particularly useful for reproducibility, as well as for bug reporting.


Below the batch information it is possible to get information for each run. The information about a run contains the file name, number of queries and verification time.

Clicking on a run displays the result for each query. Additional information (semantics, type, ressources used) can be obtained by clicking on the query.


#### Details of a query: exploring attacks and equivalence proofs

By clicking on _Details_ the tool provides additional information about the particular query. In particular it displays a summary of the query and recalls the signature (the function declaration and rewrite system), and in case of an attack, the attack trace.

It also displays the processes on which the verification was run and provides an equivalence, respectively attack simulator.

* The equivalence simulator allows the user to select a trace of one of the processes, by selecting a sequence of actions. The tool highlights available actions and the user chooses the next action. Once the user has selected a trace, one may request the tool to find an equivalent trace on the other process.

* The attack simulator allows the user to _replay_ an attack: for an attack trace on one process, the user select actions on the other process that follow the attack trace. This allows the user to explore all possible available traces and convince the user that either no such trace exists, or that all traces lead to frames that can be distinguished.



Selecting the actions requires a few additional explanations:
 
 * The user may select the level of details of the actions: `Default`, `I/O`, and `All`. When `I/O` is selected, only inputs and outputs are shown; internal $\tau$ actions are executed tacitly. When `All` is selected, the user also explicitly executes internal actions. `Default` is an intermediate choice where some internal actions are executed automatically, while others need to be selected explicitly. The `I/O` option is only available in case of an attack, not for an equivalence proof.


 * Sometimes, when selecting an input, or an output, the user may choose between an internal communication (matching directly an input and output of the process on a same channel) and a communication with the attacker.

* When defining an attacker action in the equivalence simulator, it might be necessary to provide the attacker computation, called the recipe. This is required to provide the computation of the channel, for both inputs and outputs, as well as the term to be provided by the attacker for an input. These recipes are terms built from the (public) function symbols and constants of the signature, fresh names (prefixed by a `#`, e.g. `#n`) and elements of the frame, referred to as `ax_i`.




### Settings


The settings allow to configure the **DeepSecUI** environment.

 * _Show helpers_ allows to turn on and off explanations that appear when you hover on options.

 * _Absolute Path of deepsec\_api_ allows to set the path to the `deepsec_api` executable. This path is set automatically when the executable is in the PATH of your system environment.

 * _Results directory_ provides information where data on all runs and results are stored.

 * The _Check API_ button allows to test whether the `deepsec_api` executable is available at the path given above.

 * The _Notification_ section allows to configure the behaviour of pop-up windows. One can define the duration a pop-up window appears, which result notifications should be notified (batch, run, query), and define whether warning and error pop-ups should be "sticky", i.e., only disappear after manual removal.
The behaviour can be tested using the _Test Notifications_ button.
 
 * The _Scan for new batch_ button allows to scan for batches and runs that were run using the command line. These runs are then added to the list of batches in the _Results_ section. When the `--title` option is used with the [command line](#commad), the provided title will be used in the list.


