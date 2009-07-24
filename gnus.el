;; main method for gnus to retrieve news. why do this need to be nnnil?
(setq gnus-select-method '(nnnil ""))

;; Mail is kept by gnus in ~/Gnumail directory. Why is this my
;; "secondary" method?
(setq gnus-secondary-select-methods
      '((nnml "Gnumail"
              (nnml-directory "/home/tiago/Gnumail")
              (nnml-active-file "/home/tiago/Gnumail/active"))))

;; Mail is delivered locally (fetchmail + procmail + mailfilter.py) in
;; ~/Email/incoming and in ~/Email/ml/*.
(setq mail-sources
      '((file :path "/home/tiago/Email/incoming")
        (directory :path "/home/tiago/Email/ml"
                   :suffix "")))

;; After procmail/mailfilter.py disposes of all mailing list mails,
;; gnus stil has some work to do to split mail in further groups.
(setq nnmail-split-methods
      '(("system" "^From:.*Cron Daemon.*")
        ("virginia" "^From:.*Virg.nia.*Fontes.*")
        ("das-welt" "^From:.*WELT ONLINE.*")
        ("herio" "^From:.*(hsab|herio).*")
        ("google" "^From:.*noreply@google.com.*")
        ("facebook" "^From:.*Facebook.*")
        ("incoming" "")))

;; sent messages should be archived separately in some groups
;; (apparently this is not working).
(setq gnus-message-archive-group
      '(("^debian" "sent-debian")
        (".*megat.*" "sent-omegat")
        (".*" "sent-misc")))

;; Whenever gnus-message-archive-method is changed, this must be set
;; to true so that gnus updates its internal idea of where is the sent
;; group. Leaving it true for now, as I fail to see why I would want
;; gnus not to update this value.
(setq gnus-update-message-archive-method t)
;; How to archive sent messages.
(setq gnus-message-archive-method
      '(nnfolder "archive"
                 (nnfolder-inhibit-expiry t)
                 (nnfolder-active-file "/home/tiago/Gnumail/sent-mail/active")
                 (nnfolder-directory "/home/tiago/Gnumail/sent-mail/")))

;; Rewrite attachment file names when saving.
(add-to-list 'mm-file-name-rewrite-functions
             'mm-file-name-trim-whitespace)


;; Define new summary and group buffers format.
(setq gnus-summary-line-format
      ":%U%R %B %s %-60=|%4L |%-20,20f |%&user-date; \n")
(setq gnus-group-line-format
      "%M%S%5y:%B%(%g%)\n") ; default
      ;"%M%S%L%N/%I/%R/%U/%t:%B%(%g%)\n")

;; This is recommended by some to make gnus completely ignore news,
;; and work only with mail. But it works perfectly without those
;; lines.
;; (setq gnus-nntp-server nil
;;       gnus-read-active-file nil
;;       gnus-save-newsrc-file nil
;;       gnus-read-newsrc-file nil
;;       gnus-check-new-newsgroups nil)
