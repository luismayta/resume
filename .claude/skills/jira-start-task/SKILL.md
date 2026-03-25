---
name: jira-start-task
description: Skill para listar issues no terminadas asignadas al usuario en Jira usando `infobot.toml`, elegir una y crear un branch `feature/<ISSUE-KEY>`.
metadata:
  opencode:
    emoji: 🎯
    tags:
      - jira-cloud
      - git
      - branch
      - workflow
    mcp:
      preferredServer: jira
---

# Jira Start Task

Usa este skill cuando quieras empezar trabajo en una tarea de Jira sin buscar manualmente el ticket ni escribir el branch a mano. El skill toma el `projectKey` desde `infobot.toml`, lista las issues no terminadas asignadas al usuario actual, deja que el usuario seleccione una y crea un branch con prefijo `feature/`.

## Overview

1. Lee `infobot.toml` y obtiene `issueTracking.projectKey`.
2. Consulta Jira para identificar el usuario actual y listar issues del proyecto que:
   - estén asignadas al usuario actual,
   - no estén terminadas,
   - pertenezcan al proyecto configurado.
3. Muestra una lista numerada con al menos:
   - issue key,
   - summary,
   - status,
   - priority (si está disponible).
4. Pide al usuario que seleccione una opción por número.
5. Crea el branch con este formato:

```text
feature/<ISSUE-KEY>
```

Ejemplo:

```text
feature/AR-123
```

## Implementación esperada

- Lee `infobot.toml` antes de consultar Jira. Si falta `issueTracking.projectKey`, detente y explícalo.
- Usa Jira Cloud mediante MCP.
- Para detectar el usuario autenticado, usa la tool de identidad disponible antes de filtrar o usa JQL con `assignee = currentUser()` si aplica.
- Usa una consulta equivalente a:

```jql
project = AR AND assignee = currentUser() AND statusCategory != Done ORDER BY updated DESC
```

- Sustituye `AR` por el valor real de `issueTracking.projectKey`.
- Si no hay resultados, informa que no hay tareas pendientes asignadas en ese proyecto y no crees ningún branch.
- Si el usuario elige una opción inválida, vuelve a pedir una selección válida en lugar de asumir una por defecto.
- Antes de crear el branch, revisa el branch actual y confirma si ya existe uno con ese nombre.
- Si el branch ya existe, informa el nombre exacto y evita recrearlo.
- Si no existe, crea el branch con git usando una forma equivalente a:

```bash
git checkout -b "feature/<ISSUE-KEY>"
```

## Reglas de comportamiento

- No inventes el `projectKey`; siempre léelo desde `infobot.toml`.
- No incluyas issues en estado terminado.
- No crees branch si el usuario no ha seleccionado una tarea.
- No uses un prefijo distinto de `feature/` salvo que el humano lo pida explícitamente.
- Si la working tree tiene cambios sin commit, puedes advertirlo, pero no bloquees la creación del branch a menos que git falle.

## Tu humano puede pedirte

- "Usa el skill `jira-start-task`"
- "Quiero empezar una tarea de Jira y crear el branch automáticamente"
- "Lista las tareas pendientes del proyecto configurado y crea un feature branch"
