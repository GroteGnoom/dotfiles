(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (smart-tab kotlin-mode racket-mode anki-editor idris-mode haskell-mode)))
 '(use-file-dialog nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq mouse-wheel-progressive-speed nil)

;;commeted out for slime problems
;;(global-set-key (kbd "C-x C-a") (lambda () (interactive) (save-buffer) (compile "./compile")))

(delete-selection-mode 1)
(setq column-number-mode t)

(add-to-list 'load-path "~/Documents/repos/rust-mode/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))



;;; melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(put 'dired-find-alternate-file 'disabled nil)

;;slime

(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "/usr/bin/sbcl")

;; eigen ding
(global-set-key "\C-x\C-a\C-c" 'recompile)

(defun save-and-recompile ()
  (interactive)
  (save-buffer)
  (recompile))
(global-set-key (kbd "C-x C-a C-s") 'save-and-recompile)


;;(add-to-list 'load-path "~/.emacs.d/nethack/")
;;(autoload 'nethack "nethack" "Play Nethack." t)
;;(setq nethack-program "/PATH/TO/nethack")


(setq load-path
      (cons (expand-file-name "~/Documents/emacs") load-path))
(require 'llvm-mode)

(defun llvm-lineup-statement (langelem)
  (let ((in-assign (c-lineup-assignments langelem)))
    (if (not in-assign)
        '++
      (aset in-assign 0
            (+ (aref in-assign 0)
               (* 2 c-basic-offset)))
      in-assign)))

;; Add a cc-mode style for editing LLVM C and C++ code
(c-add-style "llvm.org"
             '("gnu"
	       (fill-column . 80)
	       (c++-indent-level . 2)
	       (c-basic-offset . 2)
	       (indent-tabs-mode . nil)
	       (c-offsets-alist . ((arglist-intro . ++)
				   (innamespace . 0)
				   (member-init-intro . ++)
				   (statement-cont . llvm-lineup-statement)))))

;; Files with "llvm" in their names will automatically be set to the
;; llvm.org coding style.
(add-hook 'c-mode-common-hook
	  (function
	   (lambda nil
	     (if (string-match "llvm" buffer-file-name)
		 (progn
		   (c-set-style "llvm.org"))))))


;; (require 'guess-offset)


(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-?" 'help)

(define-key isearch-mode-map (kbd "\C-h") 'isearch-delete-char)
(define-key isearch-mode-map (kbd "\C-?") 'help)

(require 'smart-tab)
(global-smart-tab-mode 1)

(setq c-default-style "linux"
      fill-column 100
      c-basic-offset 8)
