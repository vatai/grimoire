$pdf_mode = 1;

# $latex = "$latex ; python /usr/share/texmf/tex/latex/sagetex/run-sagetex-if-necessary.py %B";
# $pdflatex = "$pdflatex ; python /usr/share/texmf/tex/latex/sagetex/run-sagetex-if-necessary.py %B";

set_tex_cmds( '--shell-escape %O %S' );

add_cus_dep( 'tex', 'pdf', 0, 'cus_dep_require_primary_run' );

add_cus_dep('pytxcode', 'tex', 0, 'pythontex');
sub pythontex { return system("pythontex \"$_[0]\""); }

add_cus_dep( 'sage', 'sout', 0, 'makesout' );
$hash_calc_ignore_pattern{'sage'} = '^( st.goboom|print .SageT)';
sub makesout {
  system( "sage \"$_[0].sage\"" );
}
