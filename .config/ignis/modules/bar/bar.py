from ignis import widgets
from ignis.utils import Utils
from ignis.services.hyprland import HyprlandWorkspace, HyprlandService
from .widgets import StatusPill, Tray, KeyboardLayout, Battery, Apps, Workspaces


hyprland = HyprlandService.get_default()

def hyprland_workspace_button(workspace: HyprlandWorkspace) -> widgets.Button:
    widget = widgets.Button(
        css_classes=["workspace-apps"],
        on_click=lambda x: workspace.switch_to(),
        child=widgets.Box(
            child=hyprland.bind(
                "windows",
                lambda _: [
                    # find the icon of the app by its class name
                    widgets.Icon(
                        icon_name=Utils.get_app_icon_name(window.class_name),
                        pixel_size=25,
                        css_classes=["application"]
                    )
                    # get all windows on the current workspace
                    for window in hyprland.get_windows_on_workspace(
                        workspace_id=workspace.id
                    )
                ],
            )
        ),
    )
    if workspace.id == hyprland.active_workspace.id:
        widget.add_css_class("active")

    return widget


def hyprland_workspaces_applications() -> widgets.Box:
    widget = widgets.Box(
        child=hyprland.bind_many(
            ["active_workspace"],
            lambda _: [
                # find the icon of the app by its class name
                hyprland_workspace_button(workspace)
                # get all windows on the current workspace
                for workspace in hyprland.workspaces
            ],
        )
    )
    return widget


class Bar(widgets.Window):
    __gtype_name__ = "Bar"

    def __init__(self, monitor: int):
        super().__init__(
            anchor=["left", "bottom", "right"],
            exclusivity="exclusive",
            monitor=monitor,
            namespace=f"ignis_BAR_{monitor}",
            layer="top",
            kb_mode="none",
            child=widgets.CenterBox(
                css_classes=["bar-widget"],
                start_widget=widgets.Box(child=[Workspaces()]),
                center_widget=widgets.Box(child=[Apps(), hyprland_workspaces_applications()]),
                end_widget=widgets.Box(
                    child=[Tray(), Battery(), StatusPill(monitor)]
                    # child=[Tray(), KeyboardLayout(), Battery(), StatusPill(monitor)]
                ),
            ),
            css_classes=["unset"],
        )
