pdfs: reports lecture-notes

reports: report-1 report-2 report-3 report-4 report-5

report-1:
	latexmk -pdf reports/report-01/report-01

report-2:
	latexmk -pdf reports/report-02/report-02

report-3:
	latexmk -pdf reports/report-03/report-03

report-4:
	latexmk -pdf reports/report-04/report-04

report-5:
	latexmk -pdf reports/report-05/report-05

lecture-notes:
	latexmk -pdf notes/mi-paa

clear:
	latexmk -c
