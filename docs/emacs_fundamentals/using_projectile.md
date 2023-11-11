# How to use projectile

Given a defined projet in spacemacs we can use the projectle for our

`Projectile` is a project interaction library for Emacs that provides a set of
features and commands to facilitate project management and navigation. In
Spacemacs, Projectile is integrated with its own set of keybindings and
functions. Here's a table outlining the essential commands for adding and
removing a project as a workspace, as well as other useful operations:

| Command                                     | Keybinding | Description                                                                  |
| ------------------------------------------- | ---------- | ---------------------------------------------------------------------------- |
| `projectile-add-known-project`              | `SPC p a`  | Add a project to Projectile's list of known projects by specifying its path. |
| `projectile-remove-known-project`           | `SPC p r`  | Remove a project from Projectile's list of known projects.                   |
| `projectile-discover-projects-in-directory` | `SPC p d`  | Discover projects in a directory and add them to the list of known projects. |
| `projectile-switch-project`                 | `SPC p p`  | Switch to another project from the list of known projects.                   |
| `projectile-switch-to-buffer`               | `SPC p b`  | Switch to a buffer belonging to the current project.                         |
| `projectile-find-file`                      | `SPC p f`  | Find a file in the current project.                                          |
| `projectile-find-dir`                       | `SPC p d`  | Find a directory in the current project.                                     |
| `projectile-recentf`                        | `SPC p e`  | Show a list of recently visited files in the project.                        |
| `projectile-invalidate-cache`               | `SPC p i`  | Invalidate the project's cache.                                              |
| `projectile-clean-known-projects`           | `SPC p c`  | Remove known projects that don't exist anymore.                              |
| `projectile-kill-buffers`                   | `SPC p k`  | Kill all buffers from the current project.                                   |

### **Adding a Project as a Workspace:**

To add a project to Projectile's list of known projects, you use the
`projectile-add-known-project` command. This command prompts you for the path to
the project's directory. Once added, it becomes available for quick access
through Projectile's commands.

### **Removing a Project:**

To remove a project, use `projectile-remove-known-project`, which will prompt
you to select from a list of known projects to remove. Note that this doesn't
delete the project files themselves but only removes the project from
Projectile's tracking system.

### **Workspaces in Spacemacs:**

Workspaces in Spacemacs are managed by the Eyebrowse package, which is different
from Projectile's project management. You can create and manage workspaces with
the following keybindings:

| Command                          | Keybinding  | Description                          |
| -------------------------------- | ----------- | ------------------------------------ |
| `eyebrowse-create-window-config` | `SPC l w c` | Create a new workspace.              |
| `eyebrowse-close-window-config`  | `SPC l w c` | Close the current workspace.         |
| `eyebrowse-next-window-config`   | `SPC l w n` | Switch to the next workspace.        |
| `eyebrowse-prev-window-config`   | `SPC l w p` | Switch to the previous workspace.    |
| `eyebrowse-last-window-config**   | `SPC l w l** | Switch to the last active workspace. |

**NOTE**: replace `SPC` with `M-m` if you're using the `Emacs` editing style instead of `Vim` in Spacemacs.
