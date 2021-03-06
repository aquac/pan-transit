/* -*- coding: utf-8-unix -*-
 *
 * Copyright (C) 2014 Osmo Salomaa
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import "."

ApplicationWindow {
    id: app
    allowedOrientations: defaultAllowedOrientations
    cover: Cover {}
    initialPage: MenuPage { id: menu }

    property var    conf: Config {}
    property bool   running: Qt.application.active || cover.active
    property string searchQuery: ""

    PositionSource { id: gps }
    Python { id: py }

    Component.onDestruction: {
        py.ready && py.call_sync("pan.app.quit", []);
    }

    function tr(message) {
        // Return translated message.
        // In addition to the message, string formatting arguments can be passed
        // as well as short-hand for message.arg(arg1).arg(arg2)...
        message = qsTranslate("", message);
        for (var i = 1; i < arguments.length; i++)
            message = message.arg(arguments[i]);
        return message;
    }

}
