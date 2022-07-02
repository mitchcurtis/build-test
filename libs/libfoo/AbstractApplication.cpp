#include "AbstractApplication.h"

#include <QCoreApplication>
#include <QLoggingCategory>

int AbstractApplication::run(int &argc, char **argv)
{
    Q_UNUSED(argc);
    Q_UNUSED(argv);
    return 0;
}
