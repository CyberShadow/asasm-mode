;;; asasm-mode-test.el --- Tests for ActionScript assembly major mode

;;; Commentary:

;;; Code:

(require 'asasm-mode nil t)

(require 'htmlfontify)

(defun asasm-mode-test-read-file (name)
  "Read file NAME and return it as a string."
  (with-temp-buffer
    (insert-file-contents name)
    (buffer-string)))

(defun asasm-mode-test-htmlize-file (name)
  "Read file NAME, fontify it and return the HTML as a string."
  (save-current-buffer
    (find-file name)
    (let ((hfy-optimisations (list 'body-text-only 'merge-adjacent-tags)))
      (with-current-buffer (htmlfontify-buffer) (buffer-string)))))

(ert-deftest asasm-mode-test-fontification ()
  (should
   (equal
    (asasm-mode-test-htmlize-file "test.asasm")
    (asasm-mode-test-read-file "test.asasm.html"))))

;;----------------------------------------------------------------------------

(provide 'asasm-mode-test)

;;; asasm-mode-test.el ends here
