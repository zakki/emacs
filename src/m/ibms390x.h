/* Machine description file for IBM S390 in 64-bit mode

Copyright (C) 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010
  Free Software Foundation, Inc.

This file is part of GNU Emacs.

GNU Emacs is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

GNU Emacs is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.  */

#include "ibms390.h"

#define BITS_PER_LONG 64
#define BITS_PER_EMACS_INT 64

/* Define the type to use.  */
#define EMACS_INT long
#define EMACS_UINT unsigned long

/* Define EXPLICIT_SIGN_EXTEND if XINT must explicitly sign-extend
   the 24-bit bit field into an int.  In other words, if bit fields
   are always unsigned.

   This flag only matters if you use USE_LISP_UNION_TYPE.  */
#undef EXPLICIT_SIGN_EXTEND

/* On the 64 bit architecture, we can use 60 bits for addresses */
#define VALBITS         60

/* Define XPNTR to avoid or'ing with DATA_SEG_BITS */
#define XPNTR(a) XUINT (a)

/* arch-tag: 4b87653c-6add-4663-8691-7d9dc17b5519
   (do not change this comment) */
