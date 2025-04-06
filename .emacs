;; 加载 Org-mode
(require 'org)

;; 初始化 Emacs 包管理器
(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

;; 设置允许绑定关键字以支持导出功能
(setq org-export-allow-bind-keywords t)

;; 自定义导出选项
(setq org-html-postamble nil)  ;; 禁用 HTML 导出的页脚
(setq org-html-doctype "html5") ;; 设置 HTML5 为导出的文档类型
(setq org-html-html5-fancy t)  ;; 启用 HTML5 特性

;; 配置默认路径（例如加载自定义插件或脚本）
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; 自定义快捷键（可选）
(global-set-key (kbd "C-c e h") 'org-html-export-to-html)

;; 自动加载 Org-mode 的文件扩展名
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; 设置默认的 Org-mode 导出行为
(defun setup-org-export ()
  "Custom settings for Org export."
  (setq org-export-with-toc t)  ;; 导出时包含目录
  (setq org-export-headline-levels 4)) ;; 导出的标题层级

(add-hook 'org-mode-hook 'setup-org-export)

;; 如果需要其他功能，可以加载自定义脚本或插件
;; 比如: 加载 Org Babel 支持
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t) (python . t)))

