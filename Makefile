BOOTSTRAP_VERSION	= 3.3.6
BOOTSTRAP_URL		= https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)/bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
BOOTSTRAP_UNZIP_DIR	= static/bootstrap-$(BOOTSTRAP_VERSION)-dist

.DEFAULT: help

help:
	@echo "Available targets:\n\
\n\
bootstrap-update	update bootstrap from download" >&2 \


bootstrap-update:
	if [[ ! -f static/bootstrap-dist.zip ]]; then						\
	    curl --progress-bar -L --url $(BOOTSTRAP_URL) --output static/bootstrap-dist.zip;	\
	fi
	if [[ ! -d $(BOOTSTRAP_UNZIP_DIR) ]]; then	\
	    unzip -d static/bootstrap-dist.zip;		\
	fi
	cp -a $(BOOTSTRAP_UNZIP_DIR)/css static
	cp -a $(BOOTSTRAP_UNZIP_DIR)/fonts static
	cp -a $(BOOTSTRAP_UNZIP_DIR)/js static


