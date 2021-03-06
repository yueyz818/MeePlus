/****************************************************************************
* MeePlus - Google+ client for Harmattan
* Copyright (C) 2012 Tadej Novak <tadej@tano.si>
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

import QtQuick 1.1
import com.nokia.meego 1.0

import "../common"
import "../icons"

import "../js/core.js" as MPJs

Page {
    id: welcomePage
    anchors.margins: MPUi.DefaultMargin
    anchors.topMargin: header.height
    tools: ToolBarLayout {
        id: welcomePageTools
        visible: true
        //IconSettings {}
        IconLogin {}
        IconMenu {}
    }

    onStatusChanged: MPJs.settings()

    ListModel {
        id: pagesModel
        ListElement {
            page: 1
            title: "My profile"
            subtitle: "Checkout your profile"
        }
        ListElement {
            page: 2
            title: "Search G+"
            subtitle: "Search for users, pages, etc."
        }
    }

    ListView {
        id: welcomeView
        anchors.fill: parent
        model: pagesModel

        delegate: Item {
            id: listItem
            height: 88
            width: parent.width

            ItemBackground {
                id: background
                anchors.leftMargin: -MPUi.DefaultMargin
                anchors.rightMargin: -MPUi.DefaultMargin
                visible: mouseArea.pressed
            }

            Separator {
                anchors.leftMargin: -MPUi.DefaultMargin
                anchors.rightMargin: -MPUi.DefaultMargin
            }

            Row {
                anchors.fill: parent

                Column {
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width

                    LabelTitle {
                        id: mainText
                        text: model.title
                    }

                    LabelSubtitle {
                        id: subText
                        text: model.subtitle

                        visible: text != ""
                    }
                }
            }
            IconListArrow { }
            MouseArea {
                id: mouseArea
                anchors.fill: background
                onClicked: {
                    switch (page) {
                    case 1:
                        MPJs.myProfile()
                        break
                    case 2:
                        MPJs.addSearchPage()
                        break
                    default:
                        break
                    }
                }
            }
        }
    }

    LabelSubtitle {
        anchors.bottom: parent.bottom
        text: qsTr("Due to current Google API restrictions only public content is available!")
    }

    ScrollDecorator {
        flickableItem: welcomeView
    }

    PageHeader {
        id: header
        title: "MeePlus"
    }
}
