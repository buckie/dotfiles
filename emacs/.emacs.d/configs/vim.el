;;; vim.el --- Vim emulation

;;; Commentary:
;; This package adds whatever is needed to give
;; all the comforts of the greatest editor ever made

;;; Code:

;; * Evil mode
;; vim keymappings
(evil-mode t) ; on by default

;; switch to normal state with C-c C-c
(define-key evil-insert-state-map (kbd "C-c C-c") 'evil-normal-state)

(define-key evil-normal-state-map (kbd "C-n") 'neotree-toggle)
(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)

;; esc quits everywhere
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
;; in the minibuffer too
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; move around windows easily
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(provide 'vim)
;;; vim.el ends here
