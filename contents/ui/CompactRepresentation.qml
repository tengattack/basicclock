import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Column {
    id: container
    Layout.preferredHeight: 70
    property date dateTime: new Date()
    property var locale: Qt.locale("ja_JP")
    property var days: ["日", "月", "火", "水", "木", "金", "土"]

    Timer {
        interval: 100; running: true; repeat: true;
        onTriggered: container.dateTime = new Date()
    }

    Row {
      spacing: 2
      anchors.horizontalCenter:  parent.horizontalCenter
      Text {
          text: Qt.formatDateTime(container.dateTime, "hh:mm")
          font.pointSize: 12
          color: "white"
      }
    }
    Row {
      anchors.horizontalCenter:  parent.horizontalCenter

      Text {
          text: Qt.formatDateTime(dateTime, "ddd %1").arg(container.days[container.dateTime.getDay()])
          font.pointSize: 8
          color: "white"
      }
    }
    Row {
      anchors.horizontalCenter:  parent.horizontalCenter
      Text {
          text: Qt.formatDateTime(container.dateTime, "MM/dd")
          font.pointSize: 8
          color: "white"
      }
    }
    Row {
      anchors.horizontalCenter:  parent.horizontalCenter
      Text {
          text: Qt.formatDateTime(container.dateTime, "yyyy")
          font.pointSize: 8
          color: "white"
      }
    }
}
