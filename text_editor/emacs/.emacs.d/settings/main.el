;; main.el settings

;; Font
(set-default-font "Hack 12")

;; Ім'я користовуча та пошта
(setq-default user-full-name "%name%"
	      user-mail-address "emacs@emacs.com")

;; ZSH оболонка за замовченням
;;(setq shell-file-name "/bin/zsh/"
;;      explicit-shell-file-name "/bin/zsh/")
(blink-cursor-mode 1)

;;(global-wakatime-mode)

;; Заборонити запуск/заставку екрану
(setq inhibit-splash-screen t
      inhibit-startup-message t)

;; Курсор
(setq-default cursor-type 'hollow)
(set-cursor-color "#be81f7")

;; Imenu
(require 'imenu)
(setq imenu-auto-rescan t
      imenu-use-popup-menu nil)
(semantic-mode 1)

;; Збереження останнього місця курсору, де він був при останньому відвідуванню того самого файлу
(save-place-mode 1)
(setq save-place-file "~/.emacs.d/saved-places"
      save-place-forget-unreadable-files t)

;; Electric-mode
(electric-pair-mode -1)
(electric-indent-mode -1)
;; Delete selection
(delete-selection-mode t)

;; Вимкнути компоненти GUI
(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  ;; Fringe
  (fringe-mode '(8 . 0))
  (setq-default indicate-buffer-boundaries 'left)
  )
(tooltip-mode -1)
(menu-bar-mode -1)
(setq use-dialog-box nil
      redisplay-dont-pause t
      ring-bell-function 'ignore)

;; Відображення ім'я буферу
(setq frame-title-format "GNU Emacs: -- %b --")

;; Відмінити бекап/автозбереження файлів
;;(setq backup-inhibited t
;;      make-backup-files nil
;;      auto-save-default nil
;;      auto-save-list-file-name nil)

;; Система кодування UTF-8
(set-language-environment 'UTF-8)
(setq buffer-file-coding-system 'utf-8
      file-name-coding-system 'utf-8)
(setq-default coding-system-for-read 'utf-8)
(set-selection-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Відображення номер рядка
(when (version<= "26" emacs-version )
  (global-display-line-numbers-mode))

;; Відображення файлу його розмір/час в mode-line
(setq display-time-24hr-format t)
(display-time-mode t)
(size-indication-mode t)
(defun add-mode-line-dirtrack ()
  (add-to-list 'mode-line-buffer-identification
	       '(:propertize (" " default-directory " ") face dired-directory)))
(add-hook 'shell-mode-hook 'add-mode-line-dirtrack)

;; Відступи
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

;; Прокрутка
(setq scroll-step 1
      scroll-margin 10
      scroll-conservatively 10000)

;; Короткі повідомлення
(defalias 'yes-or-no-p 'y-or-n-p)

;; Налаштування буфер обміну
(setq x-select-enable-clipboard t)
(setq next-line-add-newlines nil)

;; Виділити результат пошуку
(setq search-highlight t
      query-replace-highlight t
      auto-window-vscroll nil
      bidi-display-reordering nil)

;; Пробіли/Whitespace
(require 'whitespace)
(autoload 'global-whitespace-mode "whitespace" "Toggle whitespace visualization." t)
(setq whitespace-style
      '(face trailing spaces lines-tail empty indentation::tab indentation::space tabs newline space-mark tab-mark newline-mark))
(global-whitespace-mode 1)
(setq whitespace-display-mappings
      ;; всі номери є кодовою точкою Unicode в десятковій формі. (insert-char 182 1)
      '(
        (space-mark 32 [183] [46]) ; 32 space, 183 middle dot, 46 full stop
        (newline-mark 10 [8617 10]) ; 10 line feed
        (lines-tail 10 [8617 10]) ; 10 line feed
        (tab-mark 9 [8594 9] [183 9]) ; 9 tab, 9655 white right-pointing triangle
        )
      whitespace-line-column 130)

(setq split-height-threshold nil
      split-width-threshold 0)

;; org-mode
(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'meta))

(recentf-mode 1)
(setq recentf-max-menu-items 150
      recentf-max-saved-items 550)

;; Paren-mode дозволяє бачити підходящі пари дужок та інші символів
(setq show-paren-delay 0
      show-paren-style 'expression)
(show-paren-mode 2)

(setq ns-pop-up-frames nil
      ad-redefinition-action 'accept)

(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1))

(defun reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default currebt): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
        (modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
        (let* ((to (car map))
               (from (quail-get-translation
                      (cadr map) (char-to-string to) 1)))
          (when (and (characterp from) (characterp to))
            (dolist (mod modifiers)
              (define-key local-function-key-map
                (vector (append mod (list from)))
                (vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))

(defadvice read-passwd (around my-read-passwd act)
  (let ((local-function-key-map nil))
    ad-do-it))
(reverse-input-method 'russian-typewriter)

(setq max-mini-window-height 0.5
      compilation-always-kill t)

(provide 'main)
