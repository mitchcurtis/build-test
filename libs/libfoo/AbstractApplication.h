#ifndef ABSTRACTAPPLICATION_H
#define ABSTRACTAPPLICATION_H

#include <QObject>
#include <QDir>

#include "FooGlobal.h"

class FOO_EXPORT AbstractApplication : public QObject
{
    Q_OBJECT

public:
    AbstractApplication();
    ~AbstractApplication() override;

    virtual QDir assetsQmlDir() const = 0;

protected:
    Q_DISABLE_COPY(AbstractApplication)
};

#endif // ABSTRACTAPPLICATION_H
