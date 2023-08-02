#!/usr/bin/env bash

# This script is used to create a condensed version of the slides for the
# portfolio website.

slidesdir='/Users/eldridge/pensieve/project/promotion case (2023)/portfolio-website/syllabi'

# the full path the the directory containing this script
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# exit on error
set -e

# DSC 40A ------------------------------------------------------------------------------

# if dsc40a.pdf does not exist in the current directory...
if [ ! -f "$scriptdir/dsc40a.pdf" ]; then
    cd "$slidesdir/dsc40a-2020-wi/publish/lectures"
    slidescat '**/*/lecture.pdf' dsc40a.pdf
    mv dsc40a.pdf "$scriptdir/dsc40a.pdf"
else
    echo "DSC 40A already exists."
fi

# DSC 40B ------------------------------------------------------------------------------

# if dsc40b.pdf does not exist in the current directory...
if [ ! -f "$scriptdir/dsc40b.pdf" ]; then
    cd "$slidesdir/dsc40b-2023-wi/materials/lectures"
    slidescat '**/slides.pdf' dsc40b.pdf
    mv dsc40b.pdf "$scriptdir/dsc40b.pdf"
else
    echo "DSC 40B already exists."
fi

# DSC 140A ------------------------------------------------------------------------------

# if dsc140a.pdf does not exist in the current directory...
if [ ! -f "$scriptdir/dsc140a.pdf" ]; then
    cd "$slidesdir/dsc140a-2023-wi/materials/lectures"
    slidescat '**/slides.pdf' dsc140a.pdf
    mv dsc140a.pdf "$scriptdir/dsc140a.pdf"
else
    echo "DSC 140A already exists."
fi

# DSC 140B ------------------------------------------------------------------------------

# if dsc140b.pdf does not exist in the current directory...
if [ ! -f "$scriptdir/dsc140b.pdf" ]; then
    cd "$slidesdir/dsc140b-2023-sp/materials/lectures/schedules/tr"
    slidescat '**/marked.pdf' dsc140b.pdf
    mv dsc140b.pdf "$scriptdir/dsc140b.pdf"
else
    echo "DSC 140B already exists."
fi

# DSC 190 - Representation Learning ----------------------------------------------------

# if dsc190-representation_learning.pdf does not exist in the current directory...
if [ ! -f "$scriptdir/dsc190-representation_learning.pdf" ]; then
    cd "$slidesdir/dsc190-representation_learning-2022-sp/materials/lectures"
    slidescat '**/slides.pdf' dsc190-representation_learning.pdf
    mv dsc190-representation_learning.pdf "$scriptdir/dsc190-representation_learning.pdf"
else
    echo "DSC 190 - Representation Learning already exists."
fi

# DSC 190 - Algorithms -----------------------------------------------------------------

# if dsc190-algorithms.pdf does not exist in the current directory...
if [ ! -f "$scriptdir/dsc190-algorithms.pdf" ]; then
    cd "$slidesdir/dsc190-algorithms-2022-wi/materials/lectures"
    slidescat '**/slides.pdf' dsc190-algorithms.pdf
    mv dsc190-algorithms.pdf "$scriptdir/dsc190-algorithms.pdf"
else
    echo "DSC 190 - Algorithms already exists."
fi

# CSE 151A ------------------------------------------------------------------------------

# if cse151a.pdf does not exist in the current directory...
if [ ! -f "$scriptdir/cse151a.pdf" ]; then
    cd "$slidesdir/cse151a-2020-sp/lectures"
    slidescat '**/build/lecture.pdf' cse151a.pdf
    mv cse151a.pdf "$scriptdir/cse151a.pdf"
else
    echo "CSE 151A already exists."
fi


# --------------------------------------------------------------------------------------

# count the total number of pages in all pdfs in the current dir using pdftk
echo "Counting pages in pdfs."
for f in *.pdf; do
    pdftk "$f" dump_data | grep NumberOfPages
done | awk '{s+=$2} END {print s}'
