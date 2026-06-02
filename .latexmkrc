@default_excluded_files=("acknowledgements.tex","reduced.tex");

ensure_path('TEXINPUTS', './tex//' );

$pdf_mode=4;
$pdflatex="$lualatex";
