-- hacky l3build config to use tds building mechanism to create a demo bundle
packtdszip=true
sourcefiledir="."
sourcefiles={"**/*.cls","**/*.pdf","**/*.tex","**/*.bib","README.md"}
installfiles=sourcefiles
docfiles={}
textfiles={}

maindir="."
builddir=  maindir .. "/build"
distribdir = builddir .. "/distrib"
tdsdir=distribdir .. "/bundle"

tdslocations =	{
	"tex/*.cls",
	"metadata/article.tex",
	"metadata/authors.tex",
	"metadata/self.bib",
	"acknowledgements.tex",
	"main.*",
	--"main.pdf",
	"references.bib",
	"README.md",
	"figures/image-a.pdf",
	"tex/jcls_logo.pdf",
	"tex/jcls_logo_text.pdf"
}
