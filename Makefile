PREFIX = `python -c "from invenio.config import CFG_PREFIX; print CFG_PREFIX"`
LIBDIR = $(PREFIX)/lib
ETCDIR = $(PREFIX)/etc
WWWDIR = $(PREFIX)/var/www
APACHE = `python -c "from invenio.bibtask import guess_apache_process_user; print guess_apache_process_user()"`
#APACHE = www-data
#APACHE = wojciech
INSTALL = install -g $(APACHE)
COPYDIR = cp -r

scoap3tests = scoap3_unit_tests.py
compliance_configs = compliance_check_configs
templates = templates/*
utils = rawtext_search.py utils.py NonComplianceCheck.py
bibtasklets = bibsched_tasklets/*
bibcheck_plugins = bibcheck_plugins/*
bibexport_config = sitemap.cfg
bibformat_elements = bfe_publi_info.py
bibformat_templates = Default_HTML_actions.bft Default_HTML_detailed.bft Default_HTML_brief.bft
www_scripts = www/nations.py www/ffts_for_inspire.py www/compliance.py www/tools.py

elsevier_data_files = $(PREFIX)/var/data/scoap3/elsevier
elsevier_ready_packages = $(PREFIX)/var/data/scoap3/elsevier/ready_pkgs
elsevier_tar_files = $(PREFIX)/var/data/scoap3/elsevier/tar_files
springer_data_files = $(PREFIX)/var/data/scoap3/springer
springer_tar_files = $(PREFIX)/var/data/scoap3/springer/tar_files
springer_epjc_files = $(PREFIX)/var/data/scoap3/springer/tar_files/EPJC
springer_jhep_files = $(PREFIX)/var/data/scoap3/springer/tar_files/JHEP
oxford_data_files = $(PREFIX)/var/data/scoap3/oxford
oxford_tar_files = $(PREFIX)/var/data/scoap3/oxford/tar_files
oxford_unpacked_files = $(PREFIX)/var/data/scoap3/oxford/unpacked_files


install:
	$(INSTALL) -t $(LIBDIR)/python/invenio $(scoap3tests)
	$(INSTALL) -t $(LIBDIR)/python/invenio $(templates)
	$(INSTALL) -t $(LIBDIR)/python/invenio $(utils)
	$(INSTALL) -t $(LIBDIR)/python/invenio/bibcheck_plugins $(bibcheck_plugins)
	$(INSTALL) -t $(LIBDIR)/python/invenio/bibsched_tasklets $(bibtasklets)
	$(INSTALL) -t $(ETCDIR)/bibformat/format_templates $(bibformat_templates)
	$(INSTALL) -t $(LIBDIR)/python/invenio/bibformat_elements $(bibformat_elements)
	$(INSTALL) -t $(ETCDIR)/bibexport $(bibexport_config)

	$(INSTALL) -t $(WWWDIR) robots.txt
	$(INSTALL) -t $(WWWDIR) $(www_scripts)
	$(INSTALL) -t $(WWWDIR)/img scoap3_logo.png favicon.ico invenio_scoap3.css
	$(INSTALL) -d $(elsevier_data_files)
	$(INSTALL) -d $(elsevier_ready_packages)
	$(INSTALL) -d $(elsevier_tar_files)
	$(INSTALL) -d $(springer_data_files)
	$(INSTALL) -d $(springer_tar_files)
	$(INSTALL) -d $(springer_epjc_files)
	$(INSTALL) -d $(springer_jhep_files)
	$(INSTALL) -d $(oxford_data_files)
	$(INSTALL) -d $(oxford_tar_files)
	$(INSTALL) -d $(oxford_unpacked_files)

	$(COPYDIR)    $(compliance_configs) $(LIBDIR)/python/invenio/bibcheck_plugins

install-conf:
	$(INSTALL) -t $(ETCDIR) invenio-local.conf
