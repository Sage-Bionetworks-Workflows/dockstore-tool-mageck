The test data files were obtained from the MAGeCK demos included in the 
source code tarball for version 0.5.9.4 (`mageck-0.5.9.4.tar.gz`):

  - `demo/demo1/sample.txt`
  - `demo/demo5/control_sgrna.txt`
  - `demo/demo5/control_gene.txt`

You can download the tarball using the following link:

> https://sourceforge.net/projects/mageck/files/0.5/

The files in the `output/` subdirectory were generated using the following
commands. Only the main output files were stored in this repository.

```
# demo_median.* output files
mageck test -k sample.txt -t HL60.final,KBM7.final -c HL60.initial,KBM7.initial -n demo_median

# demo_control.* output files
mageck test -k sample.txt -t HL60.final,KBM7.final -c HL60.initial,KBM7.initial -n demo_control --norm-method control --control-sgrna control_sgrna.txt
```
