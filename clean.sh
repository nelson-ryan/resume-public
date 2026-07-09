#!/bin/bash

# Strip comments out of resume files and push to public repo copy

filelist[0]="resume.tex"
filelist[1]="resume.cls"
filelist[2]="experience.tex"
filelist[3]="projects.tex"
filelist[4]="general.tex"
filelist[5]="publication.tex"
filelist[6]="education.tex"
filelist[7]="cert.tex"

# Add remote if not here
if [[ -z $(git config remote.public.url) ]]; then
    git remote add public git@github.com:nelson-ryan/resume-public.git
fi;

git fetch public
git switch public

if [[ $(git rev-parse --abbrev-ref HEAD) != "public" ]]; then
    echo "Something happened" >&2;
    exit
fi;

git checkout master -- ${filelist[@]} clean.sh

xelatex resume.tex
git add -f resume.pdf clean.sh

for file in ${filelist[@]}; do
        git checkout master -- $file
        sed -i -E \
            -e '/^ *%.*$/d' \
            -e 's/ ?%.*$//' \
            $file;
        git add $file;
        if [[ $file == "resume.cls" ]]; then continue; fi;
        sed -i -E \
            -e 's/\\ralewaythin//g' \
            -e 's/\\hfill//g' \
            -e 's/\[1\]//g' \
            -e 's/\\DTMdisplaydate\{([0-9]{4})\}\{[0-9]*\}\{[0-9]*\}\{\}/\1/g' \
            -e 's/urllink/href/g' \
            $file;
done;
pandoc -f latex -t markdown_strict -o README.md resume.tex
git add README.md

git commit --amend --no-edit --date="now" && \
git push public public -f && \
git reset --hard && \
git switch master && \
git restore --source=public resume.pdf
