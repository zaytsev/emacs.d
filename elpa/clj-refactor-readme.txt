## Installation

I highly recommended installing clj-refactor through elpa.

It's available on [marmalade](http://marmalade-repo.org/) and
[melpa](http://melpa.milkbox.net/):

    M-x package-install clj-refactor

You can also install the dependencies on your own, and just dump
clj-refactor in your path somewhere:

 - <a href="https://github.com/magnars/s.el">s.el</a>
 - <a href="https://github.com/magnars/dash.el">dash.el</a>


## Setup

    (require 'clj-refactor)
    (add-hook 'clojure-mode-hook (lambda ()
                                   (clj-refactor-mode 1)
                                   ;; insert keybinding setup here
                                   ))

You'll also have to set up the keybindings in the lambda. Read on.

## Setup keybindings

All functions in clj-refactor have a two-letter mnemonic shortcut. You
get to choose how those are bound. Here's how:

    (cljr-add-keybindings-with-prefix "C-c C-m")
    ;; eg. rename files with `C-c C-m rf`.

If you would rather have a modifier key, instead of a prefix, do:

    (cljr-add-keybindings-with-modifier "C-s-")
    ;; eg. rename files with `C-s-r C-s-f`.

If neither of these appeal to your sense of keyboard layout aesthetics, feel free
to pick and choose your own keybindings with a smattering of:

    (define-key clj-refactor-map (kbd "C-x C-r") 'cljr-rename-file)

## Use

This is it so far:

 - `rf`: rename file, update ns-declaration, and then query-replace new ns in project.
 - `ar`: add :require to namespace declaration, then jump back
 - `au`: add :use to namespace declaration, then jump back
 - `ai`: add :import to namespace declaration, then jump back

Combine with your keybinding prefix/modifier.

## Automatic insertion of namespace declaration

When you open a blank `.clj`-file, clj-refactor inserts the namespace
declaration for you.

It will also add the relevant `:use` clauses in test files, normally
using `clojure.test`, but if you're depending on midje in your
`project.clj` it uses that instead.

Like clojure-mode, clj-refactor presumes that you are postfixing your
test files with `_test`.

Prefer to insert your own ns-declarations? Then:

(setq clj-add-ns-to-blank-clj-files nil)
