(require 'ox-publish)

(setq org-export-with-sub-superscripts nil)
(setq org-link-frame-setup '((file . find-file)))
(setq org-support-shift-select t)

(defun org-sitemap-custom-entry-format (entry style project)
 (let ((filename (org-publish-find-title entry project)))
  (if (= (length filename) 0)
   (format "*%s*" entry)
   (format "%s - [[file:%s][%s]]"
    (format-time-string "%Y-%m-%d" (org-publish-find-date entry project))
    entry
    filename))))

(setq org-publish-project-alist
 '(
     ("blog"
      :base-directory "~/archive/posts"
      :base-extension "org"
      :publishing-directory "~/archive"
      :recursive t
      :with-creator nil
      :publishing-function org-html-publish-to-html
      :exclude "rss.org\\|index.org\\|.*/private/.*"
      :auto-sitemap t
      :sitemap-filename "index.org"
      :sitemap-title "archives"
      :sitemap-format-entry org-sitemap-custom-entry-format
      :html-head-extra "<link rel=\"stylesheet\" href=\"_css/style.css\">"
      :html-link-home ".."
      :author "Quan Vu"
      :email "vuhongquanbk97@gmail.com")
     ("blog-static"
      :base-directory "~/archive/posts"
      :recursive t
      :with-creator nil
      :base-extension "jpq\||png\\|gif\\|mp4"
      :publishing-directory "~/archive"
      :publishing-function org-publish-attachment)
     ("all" :components ("blog" "blog-static"))

     ))

;; postamble info
(setq org-export-with-author t)
(setq org-export-with-email t)
(setq org-export-with-date t)
(setq org-return-follows-link t)
(setq org-hide-emphasis-markers t)
(setq org-html-validation-link nil)
(setq org-export-with-creator nil)
