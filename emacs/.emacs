(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;(add-to-list 'packages-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
;;(add-to-list 'packages-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
;;(when (not package-archive-contents)
;;(package-refresh-contents))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(wakatime-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Wakatime-mode
(global-wakatime-mode)
(custom-set-variables '(wakatime-api-key "294ccb36-b9ac-409f-afe4-39b4ce4c0579"))

;; imia korystuvacha ta poshta
(setq-default user-full-name "%user-name%"
	      user-mail-address "%mail@mail.mail%")

;; Font
(add-to-list 'default-frame-alist '(font . "Consolas-14")) ;; Hack

;; vidobrazhennia imia bufera
(setq frame-title-format '("" "[ %b ] - Emacs " emacs-version))

;; zaboronyty zapusk zastavku ekrana
(setq inhibit-splash-screen t
      inhibit-startup-message t)

;; vidobrazhennia nomeru riadku
;;(global-linum-mode t) ;; versiia 25
(when (version<= "26" emacs-version)
  (global-display-line-numbers-mode))
;;(when (version= "25" emacs-version)
;;(global-display-line-numbers-mode))
;;(when (version<= "26" emacs-version)
;;(require 'linum)
;;(setq-default linum-format "%4d")
;;((global-linum-mode t)

;; parni duzhky Paren-mode
(setq show-paren-delay 0
      show-paren-style 'expression)
(show-paren-mode 2)

;; Electric-mode
(electric-pair-mode -1)
(electric-indent-mode -1)
;; delete selection
(delete-selection-mode t)

;; kursor
(setq-default cursor-type 'bar) ;; box hollow bar hbar
(set-cursor-color "#000")

;; probily
(require 'whitespace)
(autoload 'global-whitespace-mode "whitespace" "Toggle whitespace visualization." t)
(setq whitespace-style
      '(face trailing spaces lines-tail empty indentation::tab indentation::space tabs newline space-mark tab-mark newline-mark))
(global-whitespace-mode 1)
(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
      '(
        (space-mark 32 [183] [46]) ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
        (newline-mark 10 [8617 10]) ; 10 LINE FEED
        (lines-tail 10 [8617 10]) ; 10 LINE FEED
        (tab-mark 9 [8594 9] [183 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
        )
      whitespace-line-column 130)

;; Buffer Selection
(require 'bs)
(add-to-list 'bs-configurations
             '("channels" nil nil "^[^#]" nil nil))

;; zberezhennia ostannoho mistsia kursora
(save-place-mode 1)
(setq save-place-file "~/.emacs.d/saved-places"
      save-place-forget-unredable-files t)

;; vidobrazhennia failu ioho rozmiru/chasu
(setq display-time-24hr-format t)
(display-time-mode t)
(size-indication-mode t)
(defun add-mode-line-dirtrack ()
  (add-to-list 'mode-line-buffer-identification
	       '(:propertize (" " default-directory " ") face dired-directory)))
(add-hook 'shell-mode-hook 'add-mode-line-dirtrack)

;; vydilennia rezultatu poshuku
(setq search-highlight t
      query-replace-highlight t
      auto-window-vscroll nil
      bidi-display-reordering nil)

;; vidstupy
(setq-default indent-tabs-mode nil
	      tab-width 4
	      tab-always-indent nil
	      c-basic-offset 2
	      sh-basic-offset 2
	      sh-indentation 2
	      scala-basic-offset 2
	      java-basic-offset 4
	      standart-indent 4
	      lisp-body-indent 2
	      js-indent-level 2
	      indent-line-function 'insert-tab)

;; prokrutka
(setq scroll-step 1
      scroll-margin 10
      scroll-conservatively 10000)

;; UTF-8
(set-language-environment 'UTF-8)
(setq buffer-file-config-system 'utf-8
      file-name-coding-system 'utf-8)
(setq-default coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; vymknuty komponent GUI v X versii
;;(when (display-graphic-p)
;;  (tool-bar-mode -1)
;;  (scroll-bar-mode -1) ;; disabled scrollbar
  ;; fringe
;;  (fringe-mode '(8 . 0))
;;  (setq-default indicate-buffer-boundaries 'left)
;;  )
;;(tooltip-mode -1)
;;(menu-bar-mode -1)
;;(setq use-dialog-box nil
;;      redisplay-dont-pause t
;;      ring-bell-function 'ifnore)

;; IDO mode
(progn
  ;; make buffer switch command do suggestions, also for find-file command
  (require 'ido)
  (ido-mode 1)
  ;; show choices vertically
  (if (version< emacs-version "25")
      (progn
	(make-local-variable 'ido-separator)
	(setq ido-separator "\n"))
    (progn
      (make-local-variable 'ido-decorations)
      (setf (nth 2 ido-decorations) "\n")))
  ;; show any name that has the chars you typed
  (setq ido-enable-flex-matching t)
  ;; use current pane for newly opened file
  (setq ido-default-file-method 'selected-window)
  ;; use current pane for newly switched buffer
  (setq ido-default-buffer-method 'selected-window)
  ;;stop ido from suggesting when naming new file
  (define-key (cdr ido-minor-mode-map-entry) [remap write-file] nil))
;; big minibuffer height, for ido to show choices vertically
(setq max-mini-window-height 0.5)

;; TRAMP mode
(setq tramp-default-method "ssh")


;; INSTALLED PACKAGES (not installed yet)
;; all-the-icons, beacon, better-defaults, company(company, company-anaconda, company-jedi, company-statistics, company-quickhelp), diff-hl, direnv, django-mode, doom-modeline, doom-themes, elpy, epc, flycheck(flycheck, flycheck-prospector, flycheck-yamlint), git-timemachine, helm, importmagic, jedi-core, neotree, org, org-bullets,keyfreq, magit, markdown-mode, minions, mode-icons, multiple-cursors, paradox, pony-mode, python-django, solarie-mode, undo-tree, use-package, web-beautify, web-mode, yaml-mode, yasnippet
;; use-package
;;(eval-when-compile
;;(add-to-list 'load-path "~/.emacs.d/elpa/")
;;(require 'use-package))

;; Built-in
;; smooth scrolling
;;(setq scroll-conservatively 101)
;;(setq mouse-wheel-dcroll-amount '(5))
;;(setq mouse-wheel-progressive-speed nil)
;; disable C-z
;;(global-unset-key (kbd "C-z"))
;; background-color
;;(setq default-frame-alist
;;'((background-color . "black"))
;; soft-wrap lines
;;(global-visual-line-mode t)
;; column number
;;(setq-default column-number-mode t)
;; highlight brackets
;;(progn
;; turn on highlight matching brackets when cursor is on one
;;(show-paren-mode 1)
;; highlight brackets
;;(defvar show-parenstyle 'mixed nil)
;;(setq-default show-paren-delay 0))
;; auto-close brackets
;;(electric-pair-mode 1)
;; make return key also do indent, globally
;;(electric-indent-mode 1)
;; highlight current line
;;(global-hl-line-mode +1)
;; change "yes or no" to "y or n"
;;(defalias 'yes-or-no-p 'y-or-n-p)
;; ibuffer
;;(detail 'list-buffers 'ibuffer)
;;(global-set-key (kbd "C-x C-b") 'ibuffer)
;; remember cursor position
;;(if (version< emacs-version "26.0")
;;(progn
;;(require 'saveplace)
;;(setq-default save-place t))
;;(save-place-mode 1))
;; encoding UTF-8
;;(set-language-environment "UTF-8")
;;(set-default-coding-systems 'utf-8)
;;(set-keyboard-coding-system 'utf-8)
;;(setq locale-coding-system 'utf-8)
;;(set-selection-coding-system 'utf-8)
;;(set-terminal-coding-system 'utf-8)
;;(prefer-coding-system 'utf-8)
;; when file is update outside emacs
;;(global-auto-revert-mode 1)
;; keep a list of recently opened file
;;(require 'recentf)
;;(recentf-mode 1)
;; save/restore openned file
;;(desktop-save-mode 1)
;; duplicate current line
;;(defun duplicate-line()
;;"Documentation duplicate current line."
;;(interactive)
;;(move-beginning-of-line 1)
;;(kill-line)
;;(yank)
;;(open-line 1)
;;(next-line 1)
;;(yank))
;;(global-set-key (kbd "C-c d") 'duplicate-line)
;; always use space, tab char's display width to 4 spaces
;;(progn
;;(setq-default tab-width 4)
;; make identation commands use space only (never tabcharacter)
;;(setq-default indent-tabs-mode nil)
;; emacs 23.1 to 26, default to t
;; if indent-tabs-mode is t, it means it may use tab, resulting mixed space and tab
;; make tab keys always call a indent command
;;(setq-default tab-always-indent t)
;; make tab key call indent command or insert tab caracter, depending on curs or position
;;(setq-default tab-always-indent nil)
;; make tab key do indent first then completion
;;(setq-default yab-always-indent 'complete))
;; delete trailing whitespace before saving
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; sorting lines
;;(global-set-key (kbd "C-c M-s") 'sort-lines)
;; backup
;;(setq backup-directory-alist '(("." . "~/.emacs.d/backup/session-save"))
;;      backup-by-copying t ;;; don't delink hardlink
;;      version-control t ;;; use version numbers on backups
;;      delete-old-versions t ;;; automaticly delete express backups
;;      kept-new-versions 20 ;;; how many od the newest versions to keep
;;      kept-old-versions 5 ;;; and how many of the old
;;      )
;;(defun force-backup-of-buffer ()
;;  "Make a special backup at the first save of each Emacs session."
;;  (when (not buffer-backend-up)
;;    ;;; Override the default parametrs for session-save backups
;;    (let ((backup-directory-alist '(("" . "~/.emacs.d/backup/session-save")))
;;          (kept-new-versions 3))
;;      (backup-buffer)))
;;  ;;; Make a "per save" backup on each save
;;  ;;; The first save results in both a per-session and a session-save backup to keep the numbering of session-save backups consident
;;  (let ((buffer-backend-up nil))
;;    (backup-buffer)))
;;;;; force backup of buffer before saving
;;(add-hook 'before-save-hook 'force-backup-of-buffer)
;;; all-the-icons
;;(require 'all-the-icons)
;;; beacon-mode
;;(beacon-mode 1)
;;; company
;;(progn
;;  (require 'company)
;;  (global-company-mode t)
;;;  (add-hook 'after-init-hook 'global-company-mode)
;;  (setq company-idle-delay 0.2
;;        company-minimum-prefix-length 1
;;        company-selection-wrap-around t
;;        company-tooltip-align-annotations t
;;        company-tooltip-flip-when-above nil
;;        company-tooltip-limit 10
;;        company-tooltip-minimum 3
;;        company-tooltip-margin 1
;;        company-transformers '(company-sort-by-occurrence)
;;        company-dabbrev-downcase nil)
  ;;; add yasnippet support for all company backends
;;  (defvar company-mode/enable-yas t "Enable yasnippet for all backends")
;;  (defun company-mode/backend-with-yas (backend)
;;    (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
;;        backend
;;      (append (if (consp backend) backend (list backend))
;;              '(:with company-yasnippet)))))
;;(require 'company-statistics)
;;(company-statistics-mode)
;;; diffhl
;;(progn
;;  (require 'diff-hl)
;;  (global-diff-hl-mode)
;;  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))
;;; doom-modeline
;;(use-package doom-modeline
;;  :ensure t
;;  :hook (after-init . doom-modeline-mode))
;;; doom-themes
;;(require 'doom-themes)
;;(load-theme 'doom-one t)
;;; minions-mode
;;(use-package minions
;;  :config (minions-mode 1))
;;; mode-icons
;;(mode-icons-mode)
;;; flycheck
;;; let-alist
;;;(require 'let-alist)
;;;(progn
;;;  (require 'flycheck)
;;;  (global-flycheck-mode)
;;;  (setq-default flycheck-checker-error-threshold 500)
;;;  (setq-default flycheck-highlighting-mode 'lines)
;;;  (setq-default flycheck-idle-change-delay 3)
;;;  (setq-default flycheck-display-errors-delay 0))
;;(use-package flycheck
;;  :ensure t
;;  :init (global-flycheck-mode t))
;;(add-hook 'after-init-hook #'global-flycheck-mode)
;;; git-timemachine
;;(require 'git-timemachine)
;;; helm
;;(progn
;;  (require 'helm-mode)
;;  (require 'helm-config)
  ;;; replace default find file
;;  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  ;;; default "C-x c" is quite close to "C-x C-c"
  ;;; cahnge to "C-c h" we must set globally, because we cannot change helm-command-prefix-key once helm-config is loaded
;;  (global-set-key (kbd "C-c h") 'helm-command-prefix)
;;  (global-unset-key (kbd "C-x c"))
  ;;; use helm-M-x instead, shows keybindings for commands
;;  (global-set-key (kbd "M-x") 'helm-M-x)
  ;;; rebind tab to run persistent action
;;  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  ;;; make TAB works in terminal
;;  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  ;;; list actions using C-z
;;  (define-key helm-map (kbd "C-z") 'helm-select-action)
;;  (when (executable-find "curl")
;;    (defvar helm-google-suggest-use-curl-p t))
  ;;; move to end or beginning of source when reaching top or bottom of source
;;  (setq helm-move-to-line-cycle-in-source t)
  ;;; search for library in require and declare-function sexp
;;  (setq helm-ff-search-library-in-sexp t)
  ;;; scroll 8 lines other window using M-<next>/M-<prior>
;;  (setq helm-scroll-amount 8)
;;  (setq helm-ff-file-name-history-use-recentf t)
  ;;; make helm window lean
;;  (setq helm-display-header-line nil)
;;  (set-face-attribute 'helm-source-header nil :height 0.1)
;;  (helm-autoresize-mode 1)
;;  (defun helm-toggle-header-line ()
;;    (if (= (length helm-sources) 1)
;;        (set-face-attribute 'helm-source-header nil :height 0.1)
;;      (set-face-attribute 'helm-source-header nil :height 1.0)))
;;  (add-hook 'helm-before-initialize-hook 'helm-toggle-header-line)
  ;;; set shortcut to helm-occur
;;  (global-set-key (kbd "C-c h o") 'helm-occur)
  ;;; override switch-to-buffer
;;  (global-set-key (kbd "C-x b") 'helm-mini)
  ;;; enable fuzzy switching
;;  (setq helm-buffers-fuzzy-matching t
;;        helm-recebtf-fuzzy-match t)
  ;;; enable helm
;;  (helm-mode 1))
;;; keyfreq
;;(require 'keyfreq)
;;(keyfreq-mode 1)
;;(keyfreq-autosave-mode 1)
;;; magit
;;(progn
;;  (require 'magit)
;;  (setq magit-auto-revert-mode nil)
;;  (setq magit-last-seen-setup-instructions "1.4.0"))
;;; markdown-mode
;;(use-package markdown-mode
;;  :ensure t
;;  :commands (markdown-mode gfm-mode)
;;  :mode (("README\\.md\\'" . gfm-mode)
;;         ("\\.md\\'" . markdown-mode)
;;         ("\\.markdown\\'" . markdown-mode))
;;  :init (setq markdown-command "multimarkdown"))
;;; (add-hook 'markdown-mode-hook #'flycheck-mode)
;;; multiple-cursors
;;(require 'multiple-cursors)
;;(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; neotree
;;(progn
;;  (require 'neotree)
;;  (global-set-key (kbd "<f8>") 'neotree-toggle)
;;  (setq neo-smart-open t)
;;  (setq-default neo-show-hidden-files t)
;;  (setq neo-theme 'icons)
;;;   (setq projectile-switch-project-action 'neotree-projectile-action)
;;  )
;;(defun text-scale-twice ()
;;  "Text scale."
;;  (interactive)
;;  (progn
;;    (text-scale-adjust 0)
;;    (text-scale-decrease 2)))
;;(add-hook 'neo-after-create-hook (lambda (_)
;;                                   (call-interactively 'text-scale-twice)))
;;; org
;;(progn
;;  (require 'org)
;;  (setq org-hide-leading-stars t)
  ;;; use syntax highlighting in source blocks while editing
;;  (setq org-src-fontify-natively t)
;;  (font-lock-flush)
  ;;; make TAB act as if it were issued in a buffer of the language's major mode;;  (setq org-src-tab-acts-natively t)
;;  (setq org-support-shift-select t)
;;  (setq org-todo-keyword-faces
;;        '(("TODO" . (:foreground "yellow" :weight bold))
;;          ("DONE" . "green")
;;          ))
;;  (global-set-key (kbd "C-c a") 'org-agenda)
  ;;; After archiving an org entry, save all org-buffers(especially the .archive)
  ;;; NOTE: Seems to only work if org_archive file is already open!
  ;;; TODO: Fix
  ;;; (advice-add 'org-archive-default-command :after #'org-save-all-org-buffers)
;;  (advice-add 'org-archive-default-command :after 'org-save-all-org-buffers)
;;  )
;;; org-bullets
;;(require 'org-bullets)
;;(add-hook 'org-mode-hook (lambda ()
;;                           (org-bullets-mode 1)))
;;; paradox
;;; (require 'paredox)
;;; (paradox-enable)
;;; python
;;(use-package elpy
;;  :ensure t
;;  :init
;;  (elpy-enable)
;;  (defalias 'workon 'pyvenv-workon)
;;  :config
;;  (delete 'elpy-module-highlight-indentation elpy-modules)
;;;  (delete 'elpy-module-flymake elpy-modules)
;;  (setq elpy-rpc-python-command "python3")
;;  (setq python-shell-interpreter "python3")
;;  (setq elpy-rpc-backend "jedi"))
;;(when (load "flycheck" t t)
;;  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;  (add-hook 'elpy-mode-hook 'flycheck-mode))
;;; company-jedi
;;(require 'company-jedi)
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(defun my/python-mode-hook ()
;;  "Company Jedi bankeds."
;;  (add-to-list 'company-backends 'company-jedi))
;;(add-hook 'python-mode-hook 'my/python-mode-hook)
;;; company-anaconda
;;(eval-after-load "company"
;;  '(add-to-list 'company-backends 'company-anaconda))
;;(add-hook 'python-mode-hook 'anaconda-mode)
;;; (require 'python-mode)
;;;(add-hook 'python-mode-hook (lambda ()
;;;                              (setq indent-tabs-mode nil)
;;;                              (setq tab-width 4)
;;;                              (setq-default python-indent-guess-indent-offset nil)
;;;                              (setq python-indent-offset 4)))
;;; django-mode
;;(use-package django-mode
;;  :ensure t
;;  :init
;;  (django-html-mode)
;;  :config
;;  (yas/load-directory "~/.emacs.d/snippets/django-mode/")
;;  (add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode)))
;;; (require 'django-mode)
;;; (require 'django-html-mode)
;;; (yas/load-directory "~/.emacs.d/snippets/django-mode/")
;;; (add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))
;;(require 'python-django)
;;(require 'pony-mode)
;;(use-package importmagic
;;  :ensure t
;;  :hook (after-init . importmagic-mode))
;;; (require 'importmagic)
;;; (add-hook 'python-mode-hook 'importmagic-mode)
;;; solaire-mode
;;(require 'solaire-mode)
;;(solaire-global-mode +1)
;;(add-hook 'ediff-prepare-buffer-hook #'solaire-mode)
;;(add-hook 'after-revent=hook #'turn-on-solaire-mode)
;;(add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)
;;(solaire-mode-swap-bg)
;;; undo-tree
;;; (require 'undo-tree)
;;; (global-undo-tree-mode 1)
;;; wakatime-mode
;;(global-wakatime-mode)
;;; web-beautify
;;(require 'web-beautify)
;;(eval-after-load 'sgml-mode
;;  '(add-hook 'html-mode-hook
;;             (lambda ()
;;               (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))
;;; web-mode
;;(require 'web-mode)
;;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;;; yaml-mode
;;(require 'yaml-mode)
;;(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
;;(add-hook 'yaml-mode-hook
;;	  '(lambda ()
;;	     (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
;;; flycheck-yamllint
;;(use-package flycheck-yamllint
;;  :ensure t
;;  :defer t
;;  :init
;;  (progn
;;    (eval-after-load 'flycheck
;;      '(add-hook 'flycheck-mode-hook 'flycheck-yamllint-setup))))
;;; yasnippet
;;(use-package yasnippet
;;  :ensure t
;;  :init
;;  (yas-global-mode 1))
;; Auto-Complite
;;(require 'autocomplete-config)
;;(ac-config-default)

;; Projectile

;; Yasnippet
;;(require 'yasnippet)
;;(yas-global-mode 1)
;;(yas/load-directory "~/.emacs.d/settings/snippets")

;; Zakripleni klawishy

;; Buffer Selection
(global-set-key (kbd "C-x C-b") 'bs-show)

;; SR-Speedbar
;;(require 'sr-speedbar)
;;(global-set-key (kbd "<f10>") 'sr-speedbar-toggle)
;;(with-eval-after-load "speedbar"
;;(autoload 'sr-speedbar-toggle "sr-speedbar" nil t)
;;(global-set-key (kbd "<f10>") 'sr-speedbar-toogle)
;;)