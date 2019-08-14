input4 = Channel.fromPath( 'out/santa/n2500/*.fasta' )

process geneconv {

  label 'med'
  tag "$seq"
  publishDir 'out/S4_geneconv', mode: 'move'

  input:
  file seq from input4.flatten()

  output:
  file '*.tab'

  script:
  """
  $baseDir/bin/geneconv $seq -inputpath=${baseDir}/out/santa/n2500/ $seq -nolog -Dumptab -Fancy
  """

}
