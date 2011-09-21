#*******************************************************************************
#
# License: 
# This software was developed at the National Institute of Standards and 
# Technology (NIST) by employees of the Federal Government in the course 
# of their official duties. Pursuant to title 17 Section 105 of the 
# United States Code, this software is not subject to copyright protection 
# and is in the public domain. NIST assumes no responsibility  whatsoever for 
# its use by other parties, and makes no guarantees, expressed or implied, 
# about its quality, reliability, or any other characteristic. 
#
# This software has been determined to be outside the scope of the EAR
# (see Part 734.3 of the EAR for exact details) as it has been created solely
# by employees of the U.S. Government; it is freely distributed with no
# licensing requirements; and it is considered public domain.  Therefore,
# it is permissible to distribute this software as a free download from the
# internet.
#
# Disclaimer: 
# This software was developed to promote biometric standards and biometric
# technology testing for the Federal Government in accordance with the USA
# PATRIOT Act and the Enhanced Border Security and Visa Entry Reform Act.
# Specific hardware and software products identified in this software were used
# in order to perform the software development.  In no case does such
# identification imply recommendation or endorsement by the National Institute
# of Standards and Technology, nor does it imply that the products and equipment
# identified are necessarily the best available for the purpose.  
#
#*******************************************************************************

# SubTree:              /NBIS/Main/buildutil
# Filename:             openjpeg_libs.mak
# Integrators:          Kenneth Ko
# Organization:         NIST/ITL
# Host System:          GNU GCC/GMAKE GENERIC (UNIX)
# Date Created:         05/15/2009
# Date Updated:		04/19/2011
#
# ******************************************************************************
#
# Makefile to loop through openjpeg libaray directories and call the next
# level Makefile.
#
# ******************************************************************************
bins:
#	@(cd $(DIR_ROOT_BUILDUTIL) && $(MAKE) -f ./openjpeg_bins.mak bin) || exit 1 
#
libs:
	@echo "Start: Compiling openjpeg library...."
	@(cd $(DIR_SRC_LIB)/openjpeg && $(CHMOD) -R +w * && $(TOUCH) aclocal.m4 && $(MAKE)) || exit 1
	@(cd $(DIR_SRC_LIB)/openjpeg && ($(CP) ./bin/libopenjpeg.a $(EXPORTS_LIB_DIR))) || exit 1
	@echo "End: Compiling openjpeg library."
#
config:
	@(cd $(DIR_SRC_LIB)/openjpeg && ./configure --enable-shared=no --disable-libtool-lock) || exit 1
#
install:
	@(cd $(DIR_ROOT_BUILDUTIL) && $(MAKE) -f ./openjpeg_bins.mak install) || exit 1
	@(cd $(DIR_SRC_LIB)/openjpeg && ($(CP) ./bin/libopenjpeg.a $(INSTALL_ROOT_LIB_DIR))) || exit 1 
#
clean:
	@(cd $(DIR_SRC_LIB)/openjpeg && $(MAKE) clean) || exit 1
#
catalog:
#
