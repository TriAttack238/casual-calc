;;; test-casual-calc-algebra.el --- Casual Algebra Tests  -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Charles Choi

;; Author: Charles Choi <kickingvegas@gmail.com>
;; Keywords: tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:
(require 'ert)
(require 'casual-calc-test-utils)
(require 'casual-calc-algebra)

(ert-deftest test-casual-calc--calc-alg-evaluate ()
  (casualt-setup)
  (calc-push '(* (+ (var x var-x) 2)
                 (+ (var x var-x) 3)))
  (casualt-testbench-calc-fn #'casual-calc--calc-alg-evaluate
                             '()
                             '(* (+ (var x var-x) 2)
                                 (+ (var x var-x) 3)))
  (casualt-breakdown t))

(ert-deftest test-casual-calc--calc-alt-summation ()
  (casualt-setup)
  (calc-push '(* (+ (var x var-x) 2)
                 (+ (var x var-x) 3)))
  (defalias 'inception
    (casualt-kmacro #'casual-calc--calc-alt-summation
                    "x <return> 1 <return> 5 <return>"))

  ;; WINNER!
  (inception)
  (should (= (calc-top) 36))
  (casualt-breakdown t))

(provide 'test-casual-calc-algebra)
;;; test-casual-calc-algebra.el ends here
