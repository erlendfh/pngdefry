pngdefry
========

pngdefry is a command line tool for undoing Apple's pngcrush optimizations of png's. On a Mac you can do this with the pngcrush embedded in Xcode, but on any other platform you're shit out of luck. This repository is a fork of Jongware's pngdefry that adds proper compression of the output png, as well as a flag for overriding the default compression level. The original source code can be found here:
[http://www.jongware.com/pngdefry.html](http://www.jongware.com/pngdefry.html)

The original pngdefry created png's at about 50% of the uncompressed image size. For a full screen iPad Retina png that is about 6mb. With proper compression this should be reduced to about 1.5-2mb, depending on your content.

### Installation
To compile it, run 
	make
from the command line

If you want to install it to /usr/local run
	make install

