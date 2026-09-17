@default_excluded_files=("acknowledgements.tex","reduced.tex");

ensure_path('TEXINPUTS', './tex//' );

$pdf_mode=4;
# to simplify setup within Overleaf we also hack this to enforce lualatex being used even if Overleaf is configured to use pdflatex.
$pdflatex="$lualatex";
