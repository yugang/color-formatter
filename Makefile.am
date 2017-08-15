bin_PROGRAMS = colorformatter

AM_CPP_INCLUDES = -I$(top_srcdir)
AM_CPPFLAGS = -std=c++11 -fPIC -O2 -D_FORTIFY_SOURCE=2 -fstack-protector-strong -fPIE
AM_CPPFLAGS += $(AM_CPP_INCLUDES) $(CWARNFLAGS) $(DRM_CFLAGS) $(DEBUG_CFLAGS) -Wformat -Wformat-security

colorformatter_CFLAGS = \
	-O0 -g -lm \
    $(AM_CPPFLAGS)

colorformatter_SOURCES = \
    colorformatter.cpp
