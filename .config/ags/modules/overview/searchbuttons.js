const { Gtk } = imports.gi;
import App from 'resource:///com/github/Aylur/ags/app.js';
import * as Utils from 'resource:///com/github/Aylur/ags/utils.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
const { execAsync, exec } = Utils;
import { couldBeMath, execAndClose, launchCustomCommand } from './miscfunctions.js';
import { searchItem } from './searchitem.js';

export const DirectoryButton = ({ parentPath, name, type, icon }) => {
    const actionText = Widget.Revealer({
        revealChild: false,
        transition: "crossfade",
        transitionDuration: userOptions.animations.durationLarge,
        child: Widget.Label({
            className: 'overview-search-results-txt txt txt-small txt-action',
            label: 'Open',
        })
    });
    const actionTextRevealer = Widget.Revealer({
        revealChild: false,
        transition: "slide_left",
        transitionDuration: userOptions.animations.durationSmall,
        child: actionText,
    });
    return Widget.Button({
        className: 'overview-search-result-btn',
        onClicked: () => {
            App.closeWindow('overview');
            execAsync(['bash', '-c', `xdg-open '${parentPath}/${name}'`, `&`]).catch(print);
        },
        child: Widget.Box({
            children: [
                Widget.Box({
                    vertical: false,
                    children: [
                        Widget.Box({
                            className: 'overview-search-results-icon',
                            homogeneous: true,
                            child: Widget.Icon({
                                icon: icon,
                            }),
                        }),
                        Widget.Label({
                            className: 'overview-search-results-txt txt txt-norm',
                            label: name,
                        }),
                        Widget.Box({ hexpand: true }),
                        actionTextRevealer,
                    ]
                })
            ]
        }),
        setup: (self) => self
            .on('focus-in-event', (button) => {
                actionText.revealChild = true;
                actionTextRevealer.revealChild = true;
            })
            .on('focus-out-event', (button) => {
                actionText.revealChild = false;
                actionTextRevealer.revealChild = false;
            })
        ,
    })
}

export const CalculationResultButton = ({ result, text }) => searchItem({
    materialIconName: '󱖦 ',
    name: `Math result`,
    actionName: "Copy",
    content: `${result}`,
    onActivate: () => {
        App.closeWindow('overview');
        execAsync(['wl-copy', `${result}`]).catch(print);
    },
});

export const DesktopEntryButton = (app) => {
    const actionText = Widget.Revealer({
        revealChild: false,
        transition: "crossfade",
        transitionDuration: userOptions.animations.durationLarge,
        child: Widget.Label({
            className: 'overview-search-results-txt txt txt-small txt-action',
            label: 'Launch',
        })
    });
    const actionTextRevealer = Widget.Revealer({
        revealChild: false,
        transition: "slide_left",
        transitionDuration: userOptions.animations.durationSmall,
        child: actionText,
    });
    return Widget.Button({
        className: 'overview-search-result-btn',
        onClicked: () => {
            App.closeWindow('overview');
            app.launch();
        },
        child: Widget.Box({
            children: [
                Widget.Box({
                    vertical: false,
                    children: [
                        Widget.Box({
                            className: 'overview-search-results-icon',
                            homogeneous: true,
                            child: Widget.Icon({
                                icon: app.iconName,
                            }),
                        }),
                        Widget.Label({
                            className: 'overview-search-results-txt txt txt-norm',
                            label: app.name,
                        }),
                        Widget.Box({ hexpand: true }),
                        actionTextRevealer,
                    ]
                })
            ]
        }),
        setup: (self) => self
            .on('focus-in-event', (button) => {
                actionText.revealChild = true;
                actionTextRevealer.revealChild = true;
            })
            .on('focus-out-event', (button) => {
                actionText.revealChild = false;
                actionTextRevealer.revealChild = false;
            })
        ,
    })
}

export const ExecuteCommandButton = ({ command, terminal = false }) => searchItem({
    materialIconName: `${terminal ? 'terminal' : ' '}`,
    name: `Run command`,
    actionName: `Execute ${terminal ? 'in terminal' : ''}`,
    content: `${command}`,
    onActivate: () => execAndClose(command, terminal),
    extraClassName: 'techfont',
})

export const CustomCommandButton = ({ text = '' }) => searchItem({
    materialIconName: ' ',
    name: 'Action',
    actionName: 'Run',
    content: `${text}`,
    onActivate: () => {
        App.closeWindow('overview');
        launchCustomCommand(text);
    },
});

export const SearchButton = ({ text = '' }) => searchItem({
    materialIconName: '󰜏 ',
    name: 'Search the web',
    actionName: 'Go',
    content: `${text}`,
    onActivate: () => {
        App.closeWindow('overview');
        execAsync(['bash', '-c', `xdg-open '${userOptions.search.engineBaseUrl}${text} ${['', ...userOptions.search.excludedSites].join(' -site:')}' &`]).catch(print);
    },
});

export const SearchButtonAI = ({ text = '' }) => searchItem({
    materialIconName: ' ',
    name: 'Ai search the web',
    actionName: 'Go',
    content: `${text}`,
    onActivate: () => {
        App.closeWindow('overview');
        execAsync(['bash', '-c', `xdg-open '${userOptions.searchAI.engineBaseUrl}${text} ${['', ...userOptions.search.excludedSites].join(' -site:')}' &`]).catch(print);
    },
})
export const TranslateBoxES = ({ text = '' }) => searchItem({
    materialIconName: ' ',
    name: 'Translate ES',
    actionName: 'Go',
    content: `${text}`,
    onActivate: () => {
        App.closeWindow('overview');
        execAsync(['bash', '-c', `xdg-open '${userOptions.translateES.engineBaseUrl}${text} ${['', ...userOptions.search.excludedSites].join(' -site:')}' &`]).catch(print);
    },
});
export const TranslateBoxEN = ({ text = '' }) => searchItem({
    materialIconName: ' ',
    name: 'Translate EN',
    actionName: 'Go',
    content: `${text}`,
    onActivate: () => {
        App.closeWindow('overview');
        execAsync(['bash', '-c', `xdg-open '${userOptions.translateEN.engineBaseUrl}${text} ${['', ...userOptions.search.excludedSites].join(' -site:')}' &`]).catch(print);
    },
});