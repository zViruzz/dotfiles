import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import PopupWindow from '../.widgethacks/popupwindow.js';
import { SearchAndWindows } from "./windowcontent.js";

export default (id = '') => PopupWindow({
    name: `overview${id}`,
    exclusivity: 'ignore',
    keymode: 'exclusive',
    visible: false,
    // anchor: ['middle'],
    layer: 'overlay',
    child: Widget.Box({
        vertical: true,
        children: [
            SearchAndWindows(),
        ]
    }),
})
