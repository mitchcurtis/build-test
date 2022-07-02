#ifndef ABSTRACTAPPLICATION_H
#define ABSTRACTAPPLICATION_H

#include <QObject>

#include "FooGlobal.h"

class FOO_EXPORT AbstractApplication : public QObject
{
    Q_OBJECT

public:
    virtual int run(int &argc, char **argv);
};

#endif // ABSTRACTAPPLICATION_H
