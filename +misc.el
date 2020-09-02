(defmacro +ivy-do-action! (action)
  "Returns an interactive lambda that sets the current ivy action and
immediately runs it on the current candidate (ending the ivy session)."
  `(lambda ()
     (interactive)
     (ivy-set-action ,action)
     (setq ivy-exit 'done)
     (exit-minibuffer)))

(set-frame-parameter (selected-frame) 'alpha '(85 . 80))
(add-to-list 'default-frame-alist '(alpha . (85 . 80)))
