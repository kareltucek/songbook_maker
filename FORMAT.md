Markup Songbook Format specification
====================================
This file defines proposal for a "standardized" plain-text format intended as an
intermediate format for creation of automatically-exportable songbooks. This 
format should be:

- human readable

- easy to edit via a text editor

- easy to process by text-oriented and file-system oriented tools

- should allow easy sharing of song databases, as well as easy merging and
  mixing of different song databases

We define two versions of the format: strict and nonstrict. The strict version
adds some further restrictions which should simplify creation of export tools.

Quick, self-defining example:

  ##title: Drunken Sailor
  ##interpret: Irish Rovers
  ##author: unknown
  ==============
  [Ami]What shall we do with a drunken sailor
  wh[G]at shall we do with a drunken sailor
  wh[Ami]at shall we do with a drunken sailor
  early [Emi]in the m[Ami]orning?

  R: H[Ami]ooray and up she rises h[G]ooray and up she rises
  h[Ami]ooray and up she rises early [Emi]in the m[Ami]orning.

  Give 'im a dose of salt and water...

  Stick on his back a mustard plaster...

  Keep him there and make 'im bail 'er...

  #Commented out, this song would otherwise bee too long...
  #Put/chuck him in the long boat 'til he's sober...
  #
  #Put him in the long-boat and make him bail her...
  #
  What shall we do with a drunken sailor?..


Non-strict definition:
- Each file contains exactly one song. Name of this file is intended to
  determine alphabetic ordering of songs. File names also should be
  file-system friendly. E.g., they should use only standard ascii letters,
  digits and underscores. 
- The content should contain the following sections:
  - Metadata section: Set of records specified one per one line in format
    '##<key>: <value>'. Keys may be:
    - title (compulsory, should be on the first line)
    - interpret (optional)
    - author (optional)
    - any other fields the user finds desirable, including possible variable
      values for exporting tools and such information. General keywords may be
      used in future. Begin your keyword by underline for non-general use. 
  - Underline: three or more equality signs denoting that all metadata has been
    specified.
  - Text of song:
    - Chords are specified in standard bracket notation.
    - Lines started by '#' are considered comments. If left out, the file
      should still comply with the format specification.
    - Verses and chorus are not distinguished. Every paragraph (be it verse,
      chorus or a text note) is considered to be one verse.
    - Empty lines determine end of the previous verse and beginning of the next
      verse.

Strict definition:
- All of the non-strict requirements apply.
- Unneccessary white spaces are forbidden. I.e., line should not end by a space.
- Two or more consecutive empty lines are forbidden.
- Empty line at the end of file is forbidden.
- Empty line between unerline and the first verse is forbidden.
- All characters should be tex-parsable as long as utf8 input encoding is
  specified. 

