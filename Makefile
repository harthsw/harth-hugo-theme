BOOTSTRAP_VERSION	= 3.3.6
BOOTSTRAP_URL		= https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRAP_VERSION)/bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
BOOTSTRAP_UNZIP_DIR	= static/bootstrap-$(BOOTSTRAP_VERSION)-dist

SIDEBAR_VERSION		= 1.0.5
SIDEBAR_URL		= https://github.com/BlackrockDigital/startbootstrap-simple-sidebar/archive/v$(SIDEBAR_VERSION).zip
SIDEBAR_UNZIP_DIR	= static/startbootstrap-simple-sidebar-$(SIDEBAR_VERSION)

SOLARIZED_URL		= https://gist.githubusercontent.com/nicolashery/5765395/raw/80abaa1791271466393e8264f286c1eb9240d059/solarized-dark.css
SOLARIZED_OUTPUT	= static/css/pygment-solarized-dark.css

.DEFAULT: help

help:
	@echo "Available targets:\n\
\n\
bootstrap-update	update bootstrap from download\n\
sidebar-update		update sidebar from download\n\
solarized-update	update pygments solarized css theme\n\
clean			clean temporary files\n\
" >&2 \


bootstrap-update:
	if [[ ! -f static/bootstrap-dist.zip ]]; then						\
	    curl --progress-bar -L --url $(BOOTSTRAP_URL) --output static/bootstrap-dist.zip;	\
	fi
	if [[ ! -d $(BOOTSTRAP_UNZIP_DIR) ]]; then	\
	    unzip -d static static/bootstrap-dist.zip;	\
	fi
	cp -a $(BOOTSTRAP_UNZIP_DIR)/css static
	cp -a $(BOOTSTRAP_UNZIP_DIR)/fonts static
	cp -a $(BOOTSTRAP_UNZIP_DIR)/js static

sidebar-update:
	if [[ ! -f static/sidebar-dist.zip ]]; then						\
	    curl --progress-bar -L --url $(SIDEBAR_URL) --output static/sidebar-dist.zip;	\
	fi
	if [[ ! -d $(SIDEBAR_UNZIP_DIR) ]]; then	\
	    unzip -d static static/sidebar-dist.zip;	\
	fi
	cp -a $(SIDEBAR_UNZIP_DIR)/css static

solarized-update:
	curl --progress-bar -L --url $(SOLARIZED_URL) --output $(SOLARIZED_OUTPUT)

clean:
	rm -f static/bootstrap-dist.zip
	rm -rf $(BOOTSTRAP_UNZIP_DIR)
	rm -f static/sidebar-dist.zip
	rm -rf $(SIDEBAR_UNZIP_DIR)


