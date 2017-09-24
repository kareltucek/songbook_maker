Song formatting utils
=====================
I do the format conversions using the VIM editor. For this reason most of my utils are vim macros. These need to be sourced from vim or from your .vimrc.

Most of my macros move visually around - for this reason, they need to have some basic guarantees - like that down and up movements result in no-op. @d tries to prepare the file for such edits. Likewise, @f tries to tiddy the scene. @a takes the last word on line and inserts it into the line below wrapped in brackets. In order to automate the procedure, one may mark some lines as chord lines by prefixing them by '>'. If this is done (either manually or automatically by the markchords script), the @s macro performs once @a on the nearest such line, which effectively means that one may perform the entire conversion by sequence @d; :%!./markchords; 1000@s; @f. This should work theoretically - practically you will find out that human supervision with interventions are necessary.

* @d initial reformat - adds spaces at beginnings and ends of lines

* @s reposition chord with automatic detection - searches for a marked chord and performs @s on it so all marked chords may be processed by 1000@s

* @a reposition chord on current line - takes the last word on line and inserts it into the line below

* @f final reformat - removes empty lines beginning by '>', removes leading and trailing spaces and squashes longer groups of spaces

* markchords tries to detect chord lines and mark them by '>'; it may be used by

        :%!./markchords

Youtube downloader
=================
Also, there is a script ydown-names, which takes a list of song names and tries to download relevant mp3 from youtube, using youtube-dl. It simply takes every line and downloads the first youtube-search result.

Velkyzpevnik downloader
=======================
Velkyzpevnik.cz provides chords for many czech songs. Unlike most other project of this type, its database is big and yet it contains mostly correct chords. The downloader can download entire categories of songs from velkyzpevnik. The result is a bunch of text files - every song in one file. The output has to be further processed using the formatting utils. 

Songs in the expected format may be found at supermusic.sk, which is unfortunatelly quite chaotic for any reasonable processing and often contains incorrect chords.
