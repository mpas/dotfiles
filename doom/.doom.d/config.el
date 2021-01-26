;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Marco Pas"
      user-mail-address "marco.pasopas@gmail.com")

(display-time-mode 1)
(setq display-time-day-and-date t)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-oceanic-next)

(setq doom-oceanic-next-brighter-comments t
      doom-oceanic-next-brighter-modeline t)
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/notes/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq auth-sources '("~/.authinfo")
      doom-modeline-vcs-max-length 80
      json-reformat:indent-width 2
      org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))

(after! org
  (setq org-agenda-files (directory-files-recursively "~/Dropbox/notes/org/" "\.org$"))
  (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                 (file+headline "inbox.org" "Tasks")
                                 "* TODO %i%?")
                                ("T" "Tickler" entry
                                 (file+headline "tickler.org" "Tickler")
                                 "* %i%? \n %U")))
  (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "In Progress(P)" "|" "DONE(d)" "CANCELLED(c)")))
  (setq org-refile-targets '(("~/Dropbox/notes/org/gtd.org" :maxlevel . 3)
                             ("~/Dropbox/notes/org/tickler.org" :maxlevel . 2)))
  (setq calendar-week-start-day 1))

;; (after! org-tree-slide
;;   (setq org-tree-slide-skip-outline-level 0))

;; Markdown
(map! :localleader
      :map markdown-mode-map
      :prefix ("i" . "Insert")
      :desc "Blockquote"    "q" 'markdown-insert-blockquote
      :desc "Bold"          "b" 'markdown-insert-bold
      :desc "Code"          "c" 'markdown-insert-code
      :desc "Emphasis"      "e" 'markdown-insert-italic
      :desc "Footnote"      "f" 'markdown-insert-footnote
      :desc "Code Block"    "s" 'markdown-insert-gfm-code-block
      :desc "Image"         "i" 'markdown-insert-image
      :desc "Link"          "l" 'markdown-insert-link
      :desc "List Item"     "n" 'markdown-insert-list-item
      :desc "Pre"           "p" 'markdown-insert-pre
      (:prefix ("h" . "Headings")
        :desc "One"   "1" 'markdown-insert-header-atx-1
        :desc "Two"   "2" 'markdown-insert-header-atx-2
        :desc "Three" "3" 'markdown-insert-header-atx-3
        :desc "Four"  "4" 'markdown-insert-header-atx-4
        :desc "Five"  "5" 'markdown-insert-header-atx-5
        :desc "Six"   "6" 'markdown-insert-header-atx-6))

(evil-define-key nil evil-normal-state-map "c" 'kill-this-buffer)

(with-eval-after-load 'forge
  (setq forge-topic-list-columns
      '(("#" 5 t (:right-align t) number nil)
        ("Title" 60 t nil title  nil)
        ("State" 6 t nil state nil)
        ("Marks" 8 t nil marks nil)
        ("Labels" 8 t nil labels nil)
        ("Assignees" 10 t nil assignees nil)
        ("Updated" 10 t nill updated nil)))
)

;; Deft settings
(setq deft-directory "~/Dropbox/notes/org"
      deft-default-extension "org"
      deft-extensions '("txt" "md" "org")
      deft-recursive t
      deft-use-filename-as-title t
      deft-use-filter-string-for-filename t
      deft-file-naming-rules '((noslash . "-")
                              (nospace . "-")
                              (case-fn . downcase)))

(setq org-babel-clojure-backend 'cider)

(add-hook 'after-init-hook (lambda ()
  (when (fboundp 'auto-dim-other-buffers-mode)
    (auto-dim-other-buffers-mode t))))

(defun org-agenda-inactive ()
  (interactive)
  (let ((org-agenda-include-inactive-timestamps t))
    (org-agenda))
  )

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-agenda-inactive)

(after! cider
  (set-popup-rule! "^\\*cider-repl" :side 'right :size 0.5))
