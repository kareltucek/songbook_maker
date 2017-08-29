Songbook maker
==============

This repository provides scripts which I use to make printable songbooks out of songs using latex package.

*NOTE*: Using content of this repository may be painful without any tex knowledge or without any linux experience!

Input
=====

Expected input format is plain text with chords specified in brackets. The file is expected to begin by an underlined song name. The rest of the file is considered to consist of verses. Empty line denotes separation of verses.

Currently, the script is sensitive to bad number of empty lines - e.g., there should be no empty lina after the last verse.

Hashes denote comments and are removed from the file before parsing.

e.g.

        Drunken Sailor
        ==============
        [Dm]What'll we do with a [Dm]drunken sailor,
        [C]What'll we do with a [C]drunken sailor,
        [Dm]What'll we do with a [Dm]drunken sailor,
        [F]Early [A7]in the [Dm]morning?

        R: [Dm]Hoo ray and [Dm]up she rises
        Hoo ray and up she rises
        Hoo ray and up she rises
        Earl-aye in the morning

Formal definition of format is provided in included FORMAT.md file. The format is meant mainly as a proposal intended for sharing of song databases.

Output
======
Output is writtent into the working directory and consists of:

* landscape A4 pdf with 3 columns

* portrait A5 pdf with one or two columns (this is automatically recognized) 

* booklet A5 pdf (printed from the other A5 pdf)

* the same files in dvi (handy if you want to extract index)

Installation
============
The script depends on the other files in its relative path, which means that either:

* You will have to call it with full path.

* You will have to put a proxy somewhere into your path. E.g., put the following file into /local/bin/songbook_maker and make it executable (with chmod a+x /home/...)

        #!/bin/bash
        /home/me/my_path/make_songbook $@

Usage 
=====
Invocation expects a name (e.g., a reasonable filename), a version (anything you will want to denote the version) and path to a header tex file. See head.tex for example content. You will most likely wish to copy it somewhere and change the text. You should not need anything more.

The songs are supposed to be stored in one or more folders in separate files. The scripts accepts them via standard input, which means that it may be invoked as follows:
        
        find songs1 songs2 songs3 | /...path.../make_songbook dodatky-zpevnik ./myhead.tex "v3"

This allows simple creation of difference songbooks for printing. My full build script follows:

        #the sort sorts the songs by file name
        find songs songs2 songs3 songs4 | sort -t '/' -k 2 | ./make_songbook dodatky-zpevnik ./myhead.tex "FULLv3"
        ../extract-index template-a5.dvi > ../dodatky
        mv output-a5.pdf ./dodatky-zpevnik-a5.pdf
        cp ./dodatky-zpevnik-a5.pdf ../dodatky-zpevnik.pdf
        mv output-a5-booklet.pdf dodatky-zpevnik-a5-booklet.pdf
        mv output-a4.pdf dodatky-zpevnik-a4.pdf

        find songs | sort | ./make_songbook ./ ./myhead.tex "DIFFv1"
        mv output-a5.pdf ./dodatky-zpevnik-a5-diff1.pdf
        mv output-a5-booklet.pdf dodatky-zpevnik-a5-booklet-diff1.pdf
        mv output-a4.pdf dodatky-zpevnik-a4-diff1.pdf

        find songs2 | sort | ./make_songbook ./ ./myhead.tex "DIFFv2"
        mv output-a5.pdf ./dodatky-zpevnik-a5-diff2.pdf
        mv output-a5-booklet.pdf dodatky-zpevnik-a5-booklet-diff2.pdf
        mv output-a4.pdf dodatky-zpevnik-a4-diff2.pdf

        find songs3 | sort | ./make_songbook ./ ./myhead.tex "DIFFv3"
        mv output-a5.pdf ./dodatky-zpevnik-a5-diff3.pdf
        mv output-a5-booklet.pdf dodatky-zpevnik-a5-booklet-diff3.pdf
        mv output-a4.pdf dodatky-zpevnik-a4-diff3.pdf

        find songs4 | sort | ./make_songbook ./ ./myhead.tex "DIFFv4"
        mv output-a5.pdf ./dodatky-zpevnik-a5-diff4.pdf
        mv output-a5-booklet.pdf dodatky-zpevnik-a5-booklet-diff4.pdf
        mv output-a4.pdf dodatky-zpevnik-a4-diff4.pdf

Debug
=====
Even though I am trying to sanitize inputs as much as possible, the build sometimes fails. If you are not a TEX expert, you may wish to simply limit the number of input songs (like 'find songs | head -n 15 | make_songbook...') in order to find the song which causes problems. When you have it, search for unusual characters and either (if you need them), fix the TEX template in this project or fix the file or add another sanitization into the make_songbook script. 

If you are a tex expert, you may wish to meddle with tex. The script basically takes the files and rewrites them into tex notation into two files named content*tex (in project's directory, not in the working directory). Then, latex is executed on one of the templates.

Format conversions and Utils
============================
Unfortunately, most tab/chord pages provide only pure plain text format. Bracket export is one the most standard ones, but still rarely provided and due to the nature of the problem, automatic conversion is not easily achievable. For this reason I also provide a set of tools which I use for conversions between the formats. Details are to be found in folder utils.






