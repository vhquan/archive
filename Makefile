.PHONY: all clean

all: clean publish

publish: configs/publish.el
	emacs --batch --load configs/publish.el --load configs/htmlize.el --funcall org-publish-all

clean:
	@rm -rf ~/.org-timestamp/*
	@rm -rf $(find . -name *.*~)
