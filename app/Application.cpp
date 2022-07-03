#include "Application.h"

Application::Application() :
    AbstractApplication()
{
}

Application::~Application()
{
}

QDir Application::assetsQmlDir() const
{
    return {};
}
