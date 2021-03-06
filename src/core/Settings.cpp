/****************************************************************************
* MeePlus - Google+ client for Harmattan
* Copyright (C) 2011 Tadej Novak <tadej@tano.si>
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*****************************************************************************/

#include <QtCore/QDir>

#include "core/Common.h"
#include "core/Settings.h"

MPSettings::MPSettings(QObject *parent)
    : QSettings(QSettings::IniFormat,
                QSettings::UserScope,
                "MeePlus",
                "Main",
                parent)
{
    readSettings();
}

MPSettings::~MPSettings() { }

void MPSettings::readSettings()
{
    setLanguage(value("general/language").toString());

    setAccessToken(value("auth/access-token").toString());
    setRefreshToken(value("auth/refresh-token").toString());
}

void MPSettings::writeSettings()
{
    setValue("general/language", language());

    setValue("auth/access-token", accessToken());
    setValue("auth/refresh-token", refreshToken());

    sync();
}
