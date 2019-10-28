;;; private/gilbertw1/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "SF Mono" :size 23))

;; disable double buffering to prevent stuttering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(load! "+evil.el")
(load! "+hydra.el")
(load! "+bindings.el")
(load! "+banner.el")
(load! "+misc.el")
                                        ;
;; avy use all windows
(setq avy-all-windows t)

(use-package evil-iedit-state
  :commands (evil-iedit-state evil-iedit-state/iedit-mode)
  :init
  (progn
    (setq iedit-current-symbol-default t
          iedit-only-at-symbol-boundaries t
          iedit-toggle-key-default nil)))

(use-package undo-propose
  :commands (undo-propose))

;; open *.rest files in restclient mode
(add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode))

;; Override smerge colors
(custom-set-faces
  '(smerge-refined-removed ((t (:inherit 'smerge-mine))))
  '(smerge-refined-added   ((t (:inherit 'smerge-other)))))

;; command to open markdown files with
(setq markdown-open-command "typora")

;; remove xref lookup backend from specific major modes
(add-hook! (scala-mode)
  (setq-local +lookup-definition-functions
              '(+lookup-dumb-jump-backend
                +lookup-project-search-backend
                +lookup-evil-goto-definition-backend)))

;; set specific company backends for scala mode
(set-company-backend! 'scala-mode
  '(company-dabbrev-code company-capf company-keywords company-files company-dabbrev))

;; turn on company auto completion
(setq company-idle-delay 0.4)

;; black background
(custom-set-faces
  '(default                 ((t (:background "#0c0c0c"))))
  '(solaire-default-face    ((t (:background "#0c0c0c")))))

;; theme
(setq doom-theme 'doom-peacock)

;; two spaces
(setq js-indent-level 2)

; (setq-default tab-width 2
;               c-basic-offset 2
;               coffee-tab-width 2
;               javascript-2-level 2
;               js-2-level 2
;               ;; js2-basic-offset 2
;               web-mode-markup-2-offset 2
;               web-mode-css-2-offset 2
;               web-mode-code-2-offset 2
;               css-ident-offset 2
;               css-2-offset 2
;               rust-indent-offset 2)
;
; (add-hook 'css-mode-hook (lambda ()
;                            (setq css-indent-offset 2)))

(add-hook 'rjsx-mode-hook (lambda ()
                           (setq js-indent-level 2
                                 doom-inhibit-indent-detection t)))

; (use-package counsel-dash
;   :commands (counsel-dash counsel-dash-install-docset)
;   :init
;   ;; Language Hooks
;   (add-hook 'emacs-lisp-mode-hook (lambda () (setq-local counsel-dash-docsets '("Emacs Lisp"))))
;   (add-hook 'scala-mode-hook (lambda () (setq-local counsel-dash-docsets '("Scala" "Akka" "Play_Scala" "Java"))))
;   (add-hook 'java-mode-hook (lambda () (setq-local counsel-dash-docsets '("Java" "Play_Java"))))
;   (add-hook 'rust-mode-hook (lambda () (setq-local counsel-dash-docsets '("Rust"))))
;   (add-hook 'clojure-mode-hook (lambda () (setq-local counsel-dash-docsets '("Clojure"))))
;   (add-hook 'haskell-mode-hook (lambda () (setq-local counsel-dash-docsets '("Haskell"))))
;   (add-hook 'sh-mode-hook (lambda () (setq-local counsel-dash-docsets '("Bash"))))
;   (add-hook 'c-mode-hook (lambda () (setq-local counsel-dash-docsets '("C"))))
;   (add-hook 'c++-mode-hook (lambda () (setq-local counsel-dash-docsets '("C++"))))
;   (add-hook 'js2-mode-hook (lambda () (setq-local counsel-dash-docsets '("JavaScript" "NodeJS" "AWS_JavaScript" "Lo-Dash"))))
;   (add-hook 'js-mode-hook (lambda () (setq-local counsel-dash-docsets '("JavaScript" "NodeJS" "AWS_JavaScript" "Lo-Dash"))))
;   (add-hook 'html-mode-hook (lambda () (setq-local counsel-dash-docsets '("HTML" "JavaScript"))))
;   (add-hook 'python-mode-hook (lambda () (setq-local counsel-dash-docsets '("Python 3")))))
