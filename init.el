;;默认打开目录
(setq default-directory "e:/code/temp")
(add-to-list 'load-path "~/.emacs.d/plugin/")

;;pachage control
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;;enable cua mode 列编辑
(cua-mode t)

;;不产生备份文件
(setq make-backup-files nil)
;;光标
(setq-default cursor-type 'bar)
(blink-cursor-mode -1)
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
;;new_buffer
(require 'new-buffer)
(global-set-key (kbd "M-n") 'xah-new-empty-buffer)

;;多光标操作
(add-to-list 'load-path "~/.emacs.d/plugin/multiple-cursors")
(require 'multiple-cursors)
;;选定一个区域，按键后会在每一行添加光标
(global-set-key (kbd "C-{") 'mc/edit-lines)
;;选择关键字
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-?") 'mc/mark-all-like-this)
;;鼠标绑定
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)


;;org-mode 显示图片 iimage.el
;;设置标记
(global-set-key (kbd "C-z") 'set-mark-command)
;; ;;ido mode
;; (require 'ido)
;; (ido-mode t)
;;使用 y or n 提问
(fset 'yes-or-no-p 'y-or-n-p)

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

(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'sql-mode)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue") ;;; 设置比上面截图中更好看的背景颜色
(define-key ac-completing-map "\M-n" 'ac-next)  ;;; 列表中通过按M-n来向下移动
(define-key ac-completing-map "\M-p" 'ac-previous)
(setq ac-auto-start 2)
(setq ac-dwim t)
(global-set-key (kbd "M-.") 'auto-complete)

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

;; ;;yasnippet
;; (add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0")
;; (require 'yasnippet)
;; ;;(yas/load-directory "~/.emacs.d/elpa/yasnippet-0.8.0/snippets")
;; (yas-global-mode 1)

;;ibuffer
(defalias 'list-buffers 'ibuffer) ; make ibuffer default
;;<F5> compile
(defun my-compile ()
  "Use compile to run python programs"
  (interactive)
  (compile (concat "python " (buffer-name))))
(setq compilation-scroll-output t)
(global-set-key (kbd "<f6>") 'my-compile)
;;<F3> highlight-symbol
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;;sql format

