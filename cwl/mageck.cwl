$namespaces:
  s: https://schema.org/
baseCommand:
- mageck
- test
class: CommandLineTool
cwlVersion: v1.0
doc: "MAGeCK is a computational tool to identify important genes from the recent genome-scale\
  \ CRISPR-Cas9 knockout screens (or GeCKO) technology. MAGeCK is developed by Wei\
  \ Li and Han Xu from Dr. Xiaole Shirley Liu's lab at Dana-Farber Cancer Institute,\
  \ and is being actively updated by Wei Li lab from Children's National Medical Center.\n\
  Visit the MAGeCK documentation for more information:\n  https://sourceforge.net/p/mageck/wiki/Home/\n\
  \nVisit the following URL for more details on the command-line options:\n  https://sourceforge.net/p/mageck/wiki/usage/\n"
hints:
  DockerRequirement:
    dockerPull: quay.io/sagebionetworks/dockstore-tool-mageck:0.0.7
  SoftwareRequirement:
    packages:
      mageck:
        specs:
        - https://doi.org/10.1186/s13059-014-0554-4
        version:
        - 0.5.9.2
inputs:
  control_ids:
    inputBinding:
      itemSeparator: ','
      prefix: --control-id
    type: string[]?
  control_sgrna:
    inputBinding:
      prefix: --control-sgrna
    type: File?
  count_table:
    inputBinding:
      prefix: --count-table
    type: File
  extra_args:
    inputBinding:
      position: 1
      shellQuote: false
    type: string?
  generate_pdf_report:
    default: false
    inputBinding:
      prefix: --pdf-report
    type: boolean?
  norm_method:
    default: median
    inputBinding:
      prefix: --norm-method
    type:
    - 'null'
    - symbols:
      - none
      - median
      - total
      - control
      type: enum
  normcounts_to_file:
    default: false
    inputBinding:
      prefix: --normcounts-to-file
    type: boolean?
  output_prefix:
    default: output
    inputBinding:
      prefix: --output-prefix
    type: string?
  treatment_ids:
    inputBinding:
      itemSeparator: ','
      prefix: --treatment-id
    type: string[]
label: Model-based Analysis of Genome-wide CRISPR-Cas9 Knockout (MAGeCK)
outputs:
  gene_summary:
    outputBinding:
      glob: $(inputs.output_prefix).gene_summary.txt
    type: File
  normalized_counts:
    outputBinding:
      glob: $(inputs.output_prefix).normalized.txt
    type: File?
  pdf_figures:
    outputBinding:
      glob: $(inputs.output_prefix).pdf
    type: File?
  pdf_report:
    outputBinding:
      glob: $(inputs.output_prefix)_summary.pdf
    type: File?
  sgrna_summary:
    outputBinding:
      glob: $(inputs.output_prefix).sgrna_summary.txt
    type: File
requirements:
- class: ShellCommandRequirement
s:author:
- class: s:Person
  s:email: bruno.grande@sagebase.org
  s:identifier: https://orcid.org/0000-0002-4621-1589
  s:name: Bruno Grande
stdout: stdout.txt
