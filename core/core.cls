\ProvidesClass{core}[Luis Mayta class]

% Pass all other (unknown) options to altacv to handle
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{altacv}}
\ProcessOptions\relax

%% Load AltaCV base class ~~~~~~~~~~~~~~~~~~~
\LoadClass{./core/altacv}

%% Package Control ~~~~~~~~~~~~~~~~~~~~~~~~~~
\usepackage{./core/packages/fonts}
\usepackage{./core/packages/geometry}
\usepackage{./core/packages/honor}
\usepackage{./core/packages/roles}
\usepackage{./core/packages/misc}
\usepackage{./core/packages/sections}
\usepackage{./core/packages/items}
\usepackage{./core/packages/contacts}
\usepackage{./core/packages/bibliography}
\usepackage{./core/packages/achievement}

%% package settings
\usepackage{./core/settings/fontsettings}
