# Preparing your submission

 Structure of this template:

```
.
├── README.md
├── acknowlegements.tex <-- acknowledgements, funding information
├── figures             <-- images and pictures
├── fonts               <-- needed fonts 
├── jcls.cls            <-- the latex document class
├── logos               <-- the journal logos
├── main.tex            <-- your content
├── metadata            
│   ├── article.tex     <-- metadata provided by the journal editors
│   └── authors.tex     <-- metadata provided by the authors
└── references.bib      <-- your biblatex bibliography
```

## Format
For preparing submissions, authors are expected to use the LaTeX template provided by JCLS. For the preparation of the LaTeX document, authors are welcome to use their preferred LaTeX-compatible writing environment. An up to date `TeX Live` or `MiKTeX` installation, including `biblatex` and `LuaLaTeX` should suffice. Alternatively, and on request, we also provide access to an Overleaf instance, a user-friendly, web-based, collaborative editor for LaTeX documents. Please note that when making your submission, all files in the LaTeX project need to be uploaded in the JCLS submission system as a ZIP archive.

## References
References need to be included in the text using the LaTeX `\cite{}` mechanism as in-text references. Complete bibliographical metadata (including e.g. first names of all authors and editors as well as publication location and publisher for monographs and conference proceedings) need to be provided using the BibTeX file in the LaTeX template. Please make sure the BibTeX file is clean and complete. References and bibliography will be styled automatically.

## Footnotes
Footnotes can be used for extended and/or commented bibliographical references or additional information (but not for regular, single references or lists of references of up to 3 references). They need to be included in the text using the LaTeX `\footnote{}` mechanism. Footnotes will be layouted automatically.

## Figures
Figures are included in the ZIP archive when submitting the article to the JCLS system. They need to be provided in a vector format (SVG) or in a high resolution pixel-based format (300dpi or better, as JPEG or PNG).

Figures should not be numbered manually, but using the relevant LaTeX mechanism. They need to each have a caption (using `\caption{}`) placed below the figure.

When submitting figures, please note that all copyright issues need to be resolved by the authors. The journal aims to publish all content, including figures, with a Creative Commons Attribution licence. A brief licence statement (name of creator and CC licence) needs to be included in the captions. Please contact the editors if you plan to use figures from third parties that require a different licence.  


---

## Format
For preparing submissions, authors are expected to use the LaTeX template provided by JCLS (be sure to use LuaLaTex compiler). For the preparation of the LaTeX document, authors are welcome to use their preferred LaTeX-compatible writing environment. An up to date TeXLive or MiKTeX installation, including biblatex and LuaLaTeX should suffice. Alternatively, and on request, we also provide access to an Overleaf instance, a user-friendly, web-based, collaborative editor for LaTeX documents. If you want to do so, please send us a request to info@jcls.io. You will then receive a link to your document template in our Overleaf instance.

## Author metadata
Author metadata needs to be provided in the file called “metadata/authors.tex” that is part of the LaTeX template. Please follow the instructions provided there. Relevant metadata includes last name, first name, ORCID, affiliation and email address, as well as a description of the author’s contribution to the submitted paper. These authors’ contributions need to be described using the Contributor Roles Taxonomy (CrediT, see https://credit.niso.org). In case you would like to mention additional contributors to your submission who do not, however, qualify as authors, please use the “Acknowledgements” section to do so.

## Abstract
At submission time, please provide an abstract for your article. Abstracts should be succinct (100–150 words in length) but provide essential information on the article, including mention of the key issue that is addressed, the materials that are analyzed, the methods used, and the key results or contributions of the article.

## Keywords
Four to six keywords should be added at submission time. Keywords should cover the following areas, as applicable: Type of data analysed, language(s) and period(s) of the data analysed, issue addressed, methods used, subfield of CLS concerned.

## References
References need to be included in the text using the LaTeX `\cite{}` mechanism as in-text references. Complete bibliographical metadata (including e.g. first names of all authors and editors as well as publication location and publisher for monographs and conference proceedings) need to be provided using the BibTeX file in the LaTeX template. Please make sure the BibTeX file is clean and complete (please list all author names – including first names). References in the article text consist of author name(s) and year of publication for up to three authors, adding 'et al.' for additional authors. In-text references and bibliography will be styled automatically according to the chicago citation style

## Footnotes
Footnotes can be used for extended and/or commented bibliographical references or additional information (but not for regular, single references or lists of references of up to 3 references). They need to be included in the text using the LaTeX `\footnote{}` mechanism. Footnotes will be layouted automatically.

## Figures
Figures are included in the ZIP archive when submitting the article to the JCLS system. They need to be provided in a vector format (SVG) or in a high resolution pixel-based format (300dpi or better, as JPEG or PNG).

Figures should not be numbered manually, but using the relevant LaTeX mechanism. They each must be provided with a caption (using `\caption{}`) placed below the figure.

When submitting figures, please note that all copyright issues need to be resolved by the authors. The journal aims to publish all content, including figures, with a Creative Commons Attribution licence. A brief licence statement (name of creator and CC licence) needs to be included in the captions. Please contact the editors if you plan to use figures from third parties that require a different licence. 

## Tables
Tables need to be formatted as LaTeX tables. Please keep tables as simple as possible. Tables should not be numbered manually, but using the relevant LaTeX mechanism. They each must be provided with a caption (using `\caption{}`) placed below the table. 

## Anonymization
In order to allow for blind reviewing, JCLS asks you to anonymize your submission carefully. Anonymization by the authors includes especially:

Make sure not to mention your name, email, or institution in any part of the main text (the author information and contributions sections will be anonymized by the editors).
If citing your own work, remove first person pronouns (e.g. instead of »As we found in Miller et al. (2020) …«, please use »As Miller et al. (2020) found …«).
Check and anonymize metadata of any other files.
Anonymize your code and repositories, either by removing links with »[REPOSITORY REMOVED]« or by anonymizing the repositories (GitHub-repositories can be anonymized with https://anonymous.4open.science/).
Please note that all information given in the acknowledgement.tex and authors.tex files will be anonymized by the editors.

## Article structure
Article sections
Apart from the abstract, the introduction, the main body of the submission and the conclusion, submissions must include the following, mandatory sections: Data and Code Availability, Author Contributions, and References.

Submissions may optionally include any or all of the following sections: Acknowledgements, Ethics Statement, Supplementary Materials, and Competing Interests. These sections are placed after the Data and Code Availability section and before the References section.

See the separate entries about these sections below.

### Data and Code Availability
At the time of the final publication, and to the extent that it is feasible, JCLS expects authors to make data and code used in a submission freely and reliably available to others. We recognize that copyright and/or privacy law as well as other issues can be an impediment to this vision and will support authors in developing a suitable strategy in such cases.

The “Data and Code Availability” statement serves to include information relevant to these issues. At submission time, one or several repositories containing data and code, suitably anonymized, should be indicated here. For final publication, key requirements are that data and code have been deposited in a trusted, public long-term repository such as Zenodo or Figshare and that a DOI or a similar stable identifier is provided. A brief explanation of the data and code made available should be included. In case authors can only provide limited access to data and code, these limitations should also be described in this section.

Authors who can only provide limited access to data and code are requested to include a statement, during the submission process, in the section ›Comments to the editor‹: There, please explain your situation and outline how you can provide data and/or code to the reviewers non-publicly.

### References
The reference list will be generated automatically from the BibTeX file. If you discover errors in the bibliographical metadata, please fix them in the BibTeX file.

### Acknowledgements
Acknowledgements need to be included in the file “acknowledgement.tex” of the LaTeX template. The corresponding section of the submission will then be generated automatically. The acknowledgements can be used flexibly to include funding information, to thank reviewers or to acknowledge other types of assistance in preparing the submission. You are free to use the Contributor Roles Taxonomy (CrediT, https://credit.niso.org) in this section as well. (This section will be anonymized automatically for reviewers.)

### Author Contributions
This mandatory section will be generated automatically from the author metadata provided in the LaTeX template (see Author Metadata). (This section will be anonymized automatically for reviewers.)

### Ethics Statement
If your research involves the use of data that may raise concerns regarding privacy, personal safety, human or animal rights or any other issue related to ethics, provide information here on the ethics clearance procedure that has been followed.

### Supplementary Materials
This section can be used to link to supplementary materials other than data and code directly relevant to the paper.

### Competing Interests
In case you have any competing interests to declare regarding your article, whether financial or non-financial, personal or non-personal in nature, please explain it succinctly in this section.
