#!/usr/bin/env texlua

--[[
	Build script for the LaTeX JCLS-Template
	Copyright (C) 2026 Marei Peischl <jcls@peitex.de>

	It may be distributed and/or modified under the conditions of the
	LaTeX Project Public License (LPPL), either version 1.3c of this
	license or (at your option) any later version. The latest version
	of this license is in the file

	https://www.latex-project.org/lppl.txt
]]

module="jcls"

sourcefiledir="tex"
sourcefiles={"*.cls","**/*.pdf"}
installfiles={"*.cls", "*.pdf"}

typesetexe="lualatex"
typesetopts=""
unpackexe="pdflatex"

typesetfiles={"main.tex"}
demofiles = {"examples/DEMO*.tex","DEMO*.tex"}

typesetcmds="\\PassOptionsToClass{flatten-paths=true}{jcls}"
supportdir="."
typesetsuppfiles={"*.bib", "*.tex", "metadata/*.tex","metadata/*.bib"}
