;; My own .emacs profile

;; using package
(package-initialize)
(require 'package)

;; custom variable
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-interval 100)
 '(company-auto-complete t)
 '(company-auto-complete-chars nil)
 '(company-clang-insert-arguments nil)
 '(company-frontends
   (quote
    (company-pseudo-tooltip-unless-just-one-frontend-with-delay company-echo-metadata-frontend company-preview-if-just-one-frontend)))
 '(company-ghc-component-prefix-match t)
 '(company-ghc-show-info (quote oneline))
 '(company-idle-delay 0.1)
 '(company-selection-wrap-around t)
 '(company-show-numbers t)
 '(custom-safe-themes
   (quote
    ("1a094b79734450a146b0c43afb6c669045d7a8a5c28bc0210aba28d36f85d86f" "2047464bf6781156ebdac9e38a17b97bd2594b39cfeaab561afffcbbe19314e2" "4a91a64af7ff1182ed04f7453bb5a4b0c3d82148d27db699df89a5f1d449e2a4" "54ece5659cc7acdcd529dddd78675c2972a5ac69260af4a6aec517dcea16208b" default)))
 '(display-time-mode t)
 '(ghc-process-process-name nil t)
 '(global-company-mode t)
 '(global-linum-mode t)
 '(haskell-literate-default (quote tex))
 '(haskell-stylish-on-save t)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(multi-term-dedicated-close-back-to-open-buffer-p t)
 '(multi-term-scroll-to-bottom-on-output t)
 '(package-archives
   (quote
    (("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
     ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
     ("melpa-stable" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
     ("marmalade" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")
     ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/"))))
 '(package-selected-packages
   (quote
    (tabbar session javap-mode color-theme-modern base16-theme ghc-imported-from intero haskell-emacs-text haskell-emacs-base haskell-emacs javaimp travis 
nginx-mode 
dockerfile-mode docker github-issues git powershell haml-mode hamlet-mode latex-extra markdown-preview-mode palette yaml-mode js3-mode markdown-mode maker-mode company-shell autopair multi-term wakatime-mode atom-one-dark-theme color-theme rainbow-delimiters hindent auctex mmm-mode ghc company-ghc haskell-mode)))
 '(session-use-package t nil (session))
 '(tool-bar-mode nil)
 '(wakatime-api-key "537f1330-b032-425a-ba86-7e8280074df3"))
;; custom set faces
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tool-bar ((t nil))))

;; Setting mouse
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
;; Scroll
(global-set-key (kbd "<mouse-5> <mouse-5> <mouse-5>") '(lambda () (interactive)(scroll-up 1)))
(global-set-key (kbd "<mouse-4> <mouse-4> <mouse-4>") '(lambda () (interactive)(scroll-down 1)))

;; inhibit start-up message
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

;; start wakatime
(setq wakatime-cli-path "/usr/local/lib/python2.7/site-packages/wakatime/cli.py")
(if (eq system-type 'windows-nt)
    (setq wakatime-cli-path "C:/Users/qinka/AppData/Local/Programs/Python/Python35-32/Scripts/wakatime.exe"))
(global-wakatime-mode)
    

;; setting up Multi-Term 
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
;; Windows
(if (eq system-type 'windows-nt)
      (setq multi-term-program "start C:/WINDOWS/System32/WindowsPowerShell/v1.0/powershell.exe"))
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 0)))
(add-hook 'term-mode-hook
          (lambda ()
            (setq show-trailing-whitespace nil)
            (autopair-mode -1))) 

;; Start a new term
(global-set-key (kbd "<f7> t")       'multi-term)
(global-set-key (kbd "<f7> <left>" ) 'multi-term-prev)
(global-set-key (kbd "<f7> <right>") 'multi-term-next)
(if (not (eq system-type 'windows-nt))
    (multi-term))


;; Setting up time and display
(display-time-mode 1) 
(setq display-time-24hr-format t) 
(setq display-time-day-and-date t)

;; Enable emacs copy from/to outside of the emacs
(setq x-select-enable-clipboard t)

;; load theme
(load-theme 'matrix)


;; remember the buffer
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

(load "desktop")
(desktop-load-default)
(desktop-read)

;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ido
(require 'ido)
(ido-mode t)

;; tabbar
(require 'tabbar)
(tabbar-mode)
(global-set-key (kbd "<f8> <up>") 'tabbar-forward-group)
(global-set-key (kbd "<f8> <down>") 'tabbar-backward-group)
(global-set-key (kbd "<f8> <right>") 'tabbar-forward-tab)
(global-set-key (kbd "<f8> <left>") 'tabbar-backward-tab)
(global-set-key (kbd "<f8> t") 'tabbar-add-tab)
(global-set-key (kbd "<f8> w") 'tabbar-delete-tab)
;; close default tabs，and move all files into one group
(setq *tabbar-ignore-buffers* '(" tmp" " ghc-mode:" " *Echo Area" " *code-conversion-work" " *Minibuf-" "*scratch*" "*Messages*" "*Ibuffer" " *Completions" "idle.org" ".bbdb" "diary" " *WakaTime"))
(setq tabbar-buffer-list-function
      (lambda ()
	(remove-if
	 (lambda (buffer)
	   (and (not (eq (current-buffer) buffer)) ; Always include the current buffer.
		(loop for name in *tabbar-ignore-buffers* ;remove buffer name in this list.
		      thereis (string-prefix-p name (buffer-name buffer)))))
	 (buffer-list))))
(setq tabbar-buffer-groups-function
      (lambda()(list "All Buffers")))

;; 括号匹配
(global-set-key (kbd "<f8> %") 'matching-paren)

;; tool bar and scroll bar
(scroll-bar-mode)

;; font
(if (eq system-type 'darwin)
    (set-default-font "Monaco-18"))

;; haskell
;; ghc-mode
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-to-list 'company-backends 'company-ghc)
;; mmm node
(require 'mmm-mode)
;; Literate Haskell
;;(require 'tex)
;;(add-hook 'LaTeX-mode-hook 'many-mode)
;; many-mode
(mmm-add-classes
 '(
   ;; literate-haskell
   (literate-haskell-code
    :submode haskell-mode
    :front "\\\\begin{code}"
    :front-offset (end-of-line 1)
    :back "^\\\\end{code}"
    :include-back nil
    :back-offset (beginning-of-line -1)
    )
   (literate-haskell-spec
    :submode haskell-mode
    :front "\\\\begin{spec}"
    :front-offset (end-of-line 1)
    :back "^\\\\end{spec}"
    :include-back nil
    :back-offset (beginning-of-line -1)
    )))
;; many-mode
(defun many-mode-lhs ()
  (interactive)
  (latex-mode)
  (mmm-ify-by-class 'literate-haskell-spec)
  (mmm-ify-by-class 'literate-haskell-code))
;; for hamtlat
(setq mmm-global-mode 'maybe)
(mmm-add-classes
 '((hamlet-quasiquote
    :submode hamlet-mode
    :delimiter-mode nil
    :front "\\[x?hamlet|"
    :back "|\\]")))
(mmm-add-mode-ext-class 'haskell-mode nil 'hamlet-quasiquote)
(mmm-add-mode-ext-class 'literate-haskell-mode nil 'hamlet-quasiquote)
(global-set-key (kbd "<f9> 2") 'many-mode-lhs)
(global-set-key (kbd "<f9> 1") 'literate-haskell-mode)
;;(global-set-key (kbd "<f9> 0") 'markdown-mode)
;;(global-set-key (kbd "<f9> `") 'markdown-preview-mode)
(setq mmm-submode-decoration-level 0)
;; Intero Settings
(add-hook 'haskell-mode 'intero-mode)

;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'haskell-mode-hook #'rainbow-delimiters-mode)

;; for AUCTex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; setting up spell check
(global-set-key (kbd "<f9> i") 'ispell-minor-mode)	      
(setq-default ispell-program-name "aspell")

;; exit hook
(add-hook 'kill-emacs-hook
	  (lambda ()
	    (multi-term-handle-close)))
	  
;; in windows gc do not work as we wish
(when (eq system-type 'windows-nt)
    (setq gc-cons-threshold (* 512 1024 1024))
    (setq gc-cons-percentage 0.5)
    (run-with-idle-timer 5 t #'garbage-collect)
)
