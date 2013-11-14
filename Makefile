# PREFIX = `python -c "from invenio.config import CFG_PREFIX; print CFG_PREFIX"`
# PREFIX = /opt/invenio
PREFIX = $(CFG_INVENIO_PREFIX)
LIBDIR = $(PREFIX)/lib
ETCDIR = $(PREFIX)/etc
WWWDIR = $(PREFIX)/var/www
# APACHE = `python -c "from invenio.bibtask import guess_apache_process_user; print guess_apache_process_user()"`
# APACHE = www-data
APACHE = wziolek
INSTALL = install -g $(APACHE) -m 775

scoap3dtdsdir = $(ETCDIR)/scoap3dtds
scoap3dtds_DATA = ja5_art501.zip ja5_art510.zip ja5_art520.zip si510.zip si520.zip A++V2.4.zip

scoap3utils = scoap3utils.py
scoap3tests = scoap3_unit_tests.py
contrast_out = contrast_out.py
contrast_out_config = contrast_out_config.py
contrast_out_utils = contrast_out_utils.py
elsevier_pkg = elsevier_package.py
springer_pkg = springer_package.py

elsevier_data_files = $(CFG_INVENIO_PREFIX)/var/data/scoap3/elsevier
springer_data_files = $(CFG_INVENIO_PREFIX)/var/data/scoap3/springer


install:
	$(INSTALL) -d $(scoap3dtdsdir)
	$(INSTALL) -t $(scoap3dtdsdir) $(scoap3dtds_DATA)
	$(INSTALL) -t $(LIBDIR)/python/invenio $(scoap3utils)
	$(INSTALL) -t $(LIBDIR)/python/invenio $(scoap3tests)
	$(INSTALL) -t $(LIBDIR)/python/invenio $(contrast_out)
	$(INSTALL) -t $(LIBDIR)/python/invenio $(contrast_out_config)
	$(INSTALL) -t $(LIBDIR)/python/invenio $(contrast_out_utils)
	$(INSTALL) -t $(LIBDIR)/python/invenio $(elsevier_pkg)
	$(INSTALL) -t $(LIBDIR)/python/invenio $(springer_pkg)
	$(INSTALL) -t $(WWWDIR) robots.txt
	$(INSTALL) -t $(WWWDIR)/img scoap3_logo.png favicon.ico invenio_scoap3.css
	$(INSTALL) -d $(elsevier_data_files)
	$(INSTALL) -d $(springer_data_files)

install-conf:
	$(INSTALL) -t $(ETCDIR) invenio-local.conf
