#ifndef FOOGLOBAL_H
#define FOOGLOBAL_H

#include <QtGlobal>

#if defined(FOO_LIBRARY)
 #  define FOO_EXPORT Q_DECL_EXPORT
 #else
 #  define FOO_EXPORT Q_DECL_IMPORT
 #endif

#endif // FOOGLOBAL_H
