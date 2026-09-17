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

packageversion="1.1.0"
packagedate="2026-09-17"

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

for i, v in ipairs(options["names"]) do
	if v == "bundle" then
		require("tools/bundle.lua")
	end
end

-- allow to tag the build.lua file by only excluding it for other targets
if not options["target"] == "tag" then
	excludefiles={table.unpack(excludefiles),"build.lua","config-*.lua"}
end

tagfiles = {"*.sty", "*.cls", "*.cfg", "*.md", "*.clo", "*.tex", "*.lco", "*.def", "*.bib", "*.lua", "*.ins", "*.dtx"}

function get_dev_tag (oldtag)
	if string.match(oldtag, "%-dev$") then
		return (oldtag), true
	end
	newtag=string.gsub(oldtag,"v?(%d+)%.%d+%.%d+%-?%w*%s?","%1.")..string.format("%02d",math.floor(string.gsub(oldtag,"v?%d+%.%d+%.(%d+)%-?%w*%s?","%1") + 1))
	return newtag.."-dev",false
end

--[[
  # Tagging configuration
]]

function update_tag(file, content, tagname, tagdate)
	local versionpattern = "%d+%.%d+%.%d+%-?%w*"
	local datepattern = "%d%d%d%d%-%d%d%-%d%d"
	local tag_only_changes = false
	local old_tagpattern = ""
	if not tagname then
		tag_only_changes = true
		tagname = packageversion
	end
	if tagname == "dev" or string.match(tagname, "%-dev$") then
		tagname, tag_only_changes = get_dev_tag(packageversion)
	else
    -- when a new tag is set all \changes{<old-dev-tag>} should be replaced as well
		old_tagpattern = string.gsub(packageversion, "%.", "%%.")
		old_tagpattern = string.gsub(old_tagpattern, "%-", "%%-")
	end
	content = string.gsub(content, "(version )" .. versionpattern .. "%s%(" ..
							datepattern .. "%)",
						"%1" .. tagname .. " (" .. tagdate .. ")")
	if string.match(file, "%.md$") or string.match(file, "%.tex$") then
		content = string.gsub(content,
							"("..module.." v)" .. versionpattern .. "%s%(" ..
								datepattern .. "%)",
							"%1" .. tagname .. " (" .. tagdate .. ")")
	elseif file == "build.lua" then
		content = string.gsub(content,
							"(packageversion%s*=%s*\")" .. versionpattern,
							"%1" .. tagname)
		content = string.gsub(content, "(packagedate%s*=%s*\")" .. datepattern,
							"%1" .. tagdate)
	else
		content = string.gsub(content, "(\\Provides%a+{[^\n]+}\n?%s-%[)" ..
								datepattern .. "%s-v" .. versionpattern,
							"%1" .. tagdate .. " v" .. tagname)
		content = string.gsub(content,"(%%<%*[^\n]+\n%s+%[)"..
								datepattern .. "%s-v" .. versionpattern,
							"%1" .. tagdate .. " v" .. tagname)
	end
	return content
end
