ConvertMkv
==========

Convert MKV files with Mpeg-2 to H.264, with optional searching on TVDB for series name

Description
-----------

I converted a number of my DVDs using [MakeMKV](http://www.makemkv.com/ "MakeMKV"). However, they were left Mpeg-2 encoded. This encoding was fine for [Plex](https://my.plexapp.com/‎"Plex") which I use on my Mac mini. However, my wife wants to use Apple TV, which requires streaming through iTunes. ITunes does not support Mpeg-2, so I need to convert to H.264.

This script should do the conversion, as well as optionally searching [The TVDB](http://thetvdb.com) for series information.

It uses 

Requirements
------------

 - `.mkv` files for conversion
 - command line versions of `ffmpeg` and `ffprobe` in the PATH. Available from [ffmpeg.org](http://www.ffmpeg.org/).
 - `.mkv` files in heirarchical directories by `<show>/SnnEmm` format for lookup on [The TVDB](http://thetvdb.com) 
    - an [API key for lookup on The TVDB](http://thetvdb.com/?tab=apiregister) 
