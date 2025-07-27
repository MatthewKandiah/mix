# MIX
Thinking it would be a fun exercise to rewrite some of Knuth's examples from MIX in x86_64. Possibly set up some means of compiling and executing a MIX program, then compiling and executing another program, and comparing their outputs.

## Using MIX
- `sudo apt install mdk` to get the GNU MIX utils
- `mixasm` to assemble a `foo.mixal` into `foo.mix` binary file
- `mixvm -r foo` to run `foo.mix`
- `mixvm -r -d foo` to run `foo.mix` and dump register values
- run `gmixvm` to run graphical UI to step through program and inspect registers and memory
