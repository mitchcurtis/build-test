#ifndef APPLICATION_H
#define APPLICATION_H

#include "AbstractApplication.h"

class Application : public AbstractApplication
{
    Q_OBJECT

public:
    Application();
    ~Application() override;

    QDir assetsQmlDir() const override;
};

#endif // APPLICATION_H
