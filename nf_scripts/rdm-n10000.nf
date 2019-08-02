input1 = Channel.fromPath( 'out/santa/n10000/*.fasta' )
input2 = Channel.fromPath( 'out/santa/n10000/*.fasta' )
input3 = Channel.fromPath( 'out/santa/n10000/*.fasta' )

process phipack_s {

  label 'med'
  tag "$seq"
  publishDir 'out/S1_phipack', mode: 'move', saveAs: { filename -> "${seq}_$filename" }

  input:
  file seq from input1.flatten()

  output:
  file 'Phi.inf.list'
  file 'Phi.inf.sites'
  file 'Phi.log'
  file 'Phi.poly.unambig.sites'

  script:
  """
  $baseDir/bin/Phi -f $seq -o -p
  """

}

process profile_s {

  label 'med'
  tag "$seq"
  publishDir 'out/S2_profile', mode: 'move', saveAs: { filename -> "${seq}_$filename" }

  input:
  file seq from input2.flatten()

  output:
  file 'Profile.csv'
  file 'Profile.log'

  script:
  """
  $baseDir/bin/Profile_elf -f $seq -o -p
  """

}

process '3seq_s' {

  label 'med'
  tag "$seq"
  publishDir 'out/S3_3seq', mode: 'move'

  input:
  file seq from input3.flatten()

  output:
  file '*3s.log'
  file '*3s.pvalHist'
  file '*s.rec'
  file '*3s.longRec' optional true

  script:
  """
  echo "Y" |
  $baseDir/bin/3seq_elf -f $seq -d -id ${seq}
  """

}