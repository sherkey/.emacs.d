;;默认打开目录
(setq default-directory "e:/code/temp")
;;pachage control
(require 'package)
(add-to-list 'package-archives'
  ("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives' 
  ("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives'
  ("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/.emacs.d/org/work.org"))

;; ;;ido mode
;; (require 'ido)
;; (ido-mode t)

;;color theme
(add-to-list 'load-path "~/.emacs.d/plugin/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-blue2)

;; ;;auto-complete
;; (add-to-list 'load-path "~/.emacs.d/elpa/auto-complete")   
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/dict")
;; (ac-config-default)

;; 显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;;默认字体
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(org-agenda-files nil)
 '(show-paren-mode t)
 '(transient-mark-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))

;;去掉欢迎信息
(setq inhibit-startup-message t)
;;显示行号、列号
(global-linum-mode t)
;;开启括号匹配
(show-paren-mode t)
;;加一道竖线
(add-to-list 'load-path "~/.emacs.d/plugin/")
(require 'fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)


;;python
(load-file "~/.emacs.d/plugin/emacs-for-python/epy-init.el")

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)
