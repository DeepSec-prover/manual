---
  author:
    - name : Vincent Cheval
      webpage : https://members.loria.fr/vcheval
    - name : Steve Kremer
      webpage : https://members.loria.fr/SKremer
    - name : Itsaka Rakotonirina
      webpage : https://members.loria.fr/IRakotonirina

  title: DeepSec prover
  pagetitle: Manual - Command line
  mainpagetitle: Manual of DeepSec


  depth: ../

  navigation: true

  next_page: Language reference
  next_page_url: manual/grammar.html
  prev_page: The graphical User Interface
  prev_page_url: manual/gui.html
---

## Command-line options

Command-line options of DeepSec.

```bash
deepsec [OPTIONS] FILELIST
```


### General options


    -s, --semantics VALUE (default=private)

>	Specify the default semantics of the process calculus. VALUE must
>	be one of 'private', 'classic' or 'eavesdrop'. See Section
>	[_Choosing the semantics_](#semantics) for detailed explanations.
        


    -p, --por BOOL (default=true)

>    Enable or disable Partial Order Reduction (POR) techniques for
>    trace equivalence. BOOL must be either 'true' or 'false'. Note
>    that even when set to 'true', POR techniques only apply to action
>    determinate processes. See Section
>    [_Partial order reductions_](#por) for detailed explanations.


    -t, --title TITLE

> 	Set a TITLE for this run (displayed only with the graphical
>   user interface).


    -q, --quiet

>   Only display the result of query verification, and no information
>   about rounds.


    --trace

>   When an attack is found, display the full trace with the execution of the process.
>   Incompatible with --quiet. **Not implemented yet**.


    -h, -help, --help
>   Display information about command line options.


### Options for distributing computation {#command-distributed}

    -d, --distributed VALUE (default=auto)

> Specify if the computation should be distributed. VALUE must be one
> of 'auto', 'true' or 'false'. When VALUE='auto', the number of
> workers will be set to the number of avilable physical cores. See
> Section [_Distributing the computation_](#distributed) for detailed
> explanations.  Note that when VALUE='true', deepsec activates the
> distributed computation even if your computer only has one core.


    -l, --local_workers INT

> Set the number of local workers to INT. If set, `--distriburted` is
> also set to 'true'.


    -w, --distant_workers HOST PATH VALUE

>  Allows to add distant workers on machine HOST. See Section
> [_Distributing the computation_](#distributed) for detailed
> explanations.
>
> * PATH must be the path on HOST to the directory that
> contains the deepsec executable.
>
> * VALUE must be either 'auto' or an
> integer, specifying the number of workers on HOST. When
> VALUE='auto', the number of workers is set to the number of physical
> cores on the distant machine.
>
>
> Example: `-w login@my_server.server.org ~/deepsec/ auto`
>
> **Note**: It is possible to rely on multiple distant machine by using
> several instances of --distant_workers. Automatically sets
> --distributed to 'true'.
>
> **Note**: the host must be configured with SSH key-based authentication.
>



    -j, --jobs INT

> Specify the number of jobs to INT during the job creation phase.
> See Section [_Distributing the computation_](#distributed) for
> detailed explanations.  Automatically sets `--distributed` to
> 'true'.  The default number of jobs is 100 times the total number of
> workers.


    -r, --round_timer INT (default=120)

> Sets the round timer to INT seconds. See Section
> [_Distributing the computation_](#distributed) for detailed
> explanations.

