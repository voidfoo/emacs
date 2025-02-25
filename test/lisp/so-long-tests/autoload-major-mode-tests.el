;;; autoload-major-mode-tests.el --- Test suite for so-long.el  -*- lexical-binding: t; -*-

;; Copyright (C) 2019-2025 Free Software Foundation, Inc.

;; Author: Phil Sainty <psainty@orcon.net.nz>
;; Keywords: convenience

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:

(require 'ert)
(load (expand-file-name "so-long-tests-helpers"
                        (file-name-directory (or load-file-name
                                                 default-directory))))

(declare-function so-long-tests-remember "so-long-tests-helpers")
(declare-function so-long-tests-assert-and-revert "so-long-tests-helpers")

;; We're testing the initial state.  We could alternatively use
;; `unload-feature' to revert to that, but this option is simple.

(autoload 'so-long-mode "so-long")

(ert-deftest so-long-tests-autoload-major-mode ()
  "File-local -*- so-long -*-"
  (with-temp-buffer
    (display-buffer (current-buffer))
    (so-long-tests-remember)
    (insert "-*- so-long -*-\n")
    (normal-mode)
    (so-long-tests-assert-and-revert 'so-long-mode)))

;;; autoload-major-mode-tests.el ends here
