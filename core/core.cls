\ProvidesClass{core}[Luis Mayta class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{altacv}}
\ProcessOptions\relax

\LoadClass{./core/altacv}

\usepackage{fontspec}

\setmainfont[
  Ligatures=TeX,
  BoldFont=Lato-Bold,
  ItalicFont=Lato-Italic,
  BoldItalicFont=Lato-BoldItalic
]{Lato}

%% Icons
\usepackage{fontawesome5}

%% Utils
\usepackage{xifthen}

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
\usepackage{./core/packages/commands}

%% Settings
\usepackage{./core/settings/fontsettings}