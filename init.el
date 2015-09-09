;;默认打开目录
(setq default-directory "e:/code/temp")
(add-to-list 'load-path "~/.emacs.d/plugin/")

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
(setq org-agenda-files (list "~/.emacs.d/org/work.org"))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;;;org-mode 自动换行
(add-hook 'org-mode-hook
          (lambda ()
            (setq truncate-lines nil)))

;;org-mode 显示图片 iimage.el


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
;; Setting English Font
(set-face-attribute
'default nil :font "Consolas 11")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "Microsoft Yahei" :size 16)))

;;去掉欢迎信息
(setq inhibit-startup-message t)
;;显示行号、列号
(global-linum-mode t)
;;开启括号匹配
(show-paren-mode t)
;;加一道竖线
;; (require 'fill-column-indicator)
;; (define-globalized-minor-mode
;;  global-fci-mode fci-mode (lambda () (fci-mode 1)))
;; (global-fci-mode t)
;; ;;key-binding
;; (global-set-key (kbd "C-K") 'kill-whole-line)
;; ;;key-binding

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
