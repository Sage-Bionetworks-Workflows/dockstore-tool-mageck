#!/usr/bin/env cwl-runner

class: CommandLineTool
cwlVersion: v1.0

label: Model-based Analysis of Genome-wide CRISPR-Cas9 Knockout (MAGeCK)

doc: >
  MAGeCK is a computational tool to identify important genes from the recent
  genome-scale CRISPR-Cas9 knockout screens (or GeCKO) technology. MAGeCK is
  developed by Wei Li and Han Xu from Dr. Xiaole Shirley Liu's lab at
  Dana-Farber Cancer Institute, and is being actively updated by Wei Li lab
  from Children's National Medical Center.

  Visit the MAGeCK documentation for more information:
    https://sourceforge.net/p/mageck/wiki/Home/

  Visit the following URL for more details on the command-line options:
    https://sourceforge.net/p/mageck/wiki/usage/

requirements:
  - class: ShellCommandRequirement

hints:
  SoftwareRequirement:
    packages:
      mageck:
        specs: [ "https://doi.org/10.1186/s13059-014-0554-4" ]
        version: [ "0.5.9.2" ]
  DockerRequirement:
    dockerImageId: quay.io/brunograndephd/dockstore-tool-mageck:0.0.5

baseCommand:
  - mageck
  - test

inputs:

  extra_args:
    type: string?
    inputBinding:
      position: 1
      shellQuote: false

  count_table:
    type: File
    inputBinding:
      prefix: --count-table
  
  output_prefix:
    type: string?
    default: output
    inputBinding:
      prefix: --output-prefix

  treatment_ids:
    type: string[]
    inputBinding:
      prefix: --treatment-id
      itemSeparator: ","

  control_ids:
    type: string[]?
    inputBinding:
      prefix: --control-id
      itemSeparator: ","

  norm_method:
    type:
      - "null"
      - type: enum
        symbols: [none, median, total, control]
    default: median
    inputBinding:
      prefix: --norm-method

  pdf_report:
    type: boolean?
    default: false
    inputBinding:
      prefix: --pdf-report

  normcounts_to_file:
    type: boolean?
    default: false
    inputBinding:
      prefix: --normcounts-to-file
  
  control_sgrna:
    type: File?
    inputBinding:
      prefix: --control-sgrna

outputs:

  gene_summary:
    type: File
    outputBinding:
      glob: $(inputs.output_prefix).gene_summary.txt

  sgrna_summary:
    type: File
    outputBinding:
      glob: $(inputs.output_prefix).sgrna_summary.txt

  log_file:
    type: File
    outputBinding:
      glob: $(inputs.output_prefix).log

  pdf_report_script:
    type: File
    outputBinding:
      glob: $(inputs.output_prefix).R

  pdf_report_sweave:
    type: File
    outputBinding:
      glob: $(inputs.output_prefix)_summary.Rnw
  
  normalized_counts:
    type: File?
    outputBinding:
      glob: $(inputs.output_prefix).normalized.txt

$namespaces:
  s: https://schema.org/

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0002-4621-1589
    s:email: bruno.grande@sagebase.org
    s:name: Bruno Grande
