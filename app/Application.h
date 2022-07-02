#ifndef APPLICATION_H
#define APPLICATION_H

#include <QObject>

#include "AbstractApplication.h"

class Application : public AbstractApplication
{
    Q_OBJECT

public:
    Application() = default;

    int run();
};

#endif // APPLICATION_H
