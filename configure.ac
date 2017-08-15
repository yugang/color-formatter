AC_PREREQ([2.64])
AC_INIT([intel-color-formatter],
	[0.01],
	[https://github.com/yugang/color-formater],
	[intel-color-formater])

AC_CONFIG_SRCDIR([Makefile.am])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])
AC_USE_SYSTEM_EXTENSIONS
AC_SYS_LARGEFILE
AC_GNU_SOURCE
AC_CANONICAL_HOST
AC_CANONICAL_TARGET

AM_INIT_AUTOMAKE([1.12 foreign subdir-objects dist-bzip2])
AM_PATH_PYTHON([3],, [:])

AC_PROG_CC
AC_PROG_CXX

AC_SUBST(ASSEMBLER_WARN_CFLAGS)

AC_CONFIG_FILES([
		Makefile
		])
AC_OUTPUT
