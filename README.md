# PHPRepl.app

This is a simple application that starts a PHP REPL (read-eval-print loop) inside your favorite Terminal (currently, Terminal.app and iTerm2 are supported). The used REPL is [boris](https://github.com/d11wtq/boris) by @d11wtq :)

* PHP Version: 5.4.15
* Boris Version: [09c211ab](https://github.com/d11wtq/boris/commit/09c211ab3a79154f39efce542f737ad08596e63f)


## Why?

Because there should be an easily installable and usable REPL for every programming language out there, and PHP just doesn't have that. Boris is great (!), but it needs a PHP version compiled with PCNTL, which OS X's isn't by default. Being able to easily try out some code in a shell is, in my opinion, very important when developing, so with this application I'm trying to remove an obstacle (compiling PHP) which prevents people from using a PHP REPL.


## Usage

Normally you'll want to simply [download the App](x3ro.de/downloads/PHPRepl.app.v0.1.zip). You can also try to build the app yourself. The build process is fairly straight forward:

1. The Cocoa application is built by Xcode
2. My custom makefile compiles PHP, downloads Boris and copies everything into the App Bundle


## Having problems?

Since PHPRepl.app is a very young project, it is likely that some issues are still hiding in the shadows. If you should happen to encouter one, create an issue in the bugtracker, or even better fix the bug and create a pull request :) This of course also applies to issues building the project yourself.


## License

See LICENSE.txt


