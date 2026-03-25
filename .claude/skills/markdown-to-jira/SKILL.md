---
name: markdown-to-jira
description: Skill para crear issues de tipo epic y/o task en Jira Cloud a partir de un archivo Markdown y luego completar componentes, labels y issue keys.
metadata:
  opencode:
    emoji: 🧩
    tags:
      - jira-cloud
      - markdown
      - mcp
      - workflow
    mcp:
      preferredServer: jira
---

# Markdown to Jira

Usa este skill cuando tengas un archivo Markdown con bloques de `Epic` y/o `Task` y quieras crear esas issues en Jira Cloud usando MCP.

## Objetivo

Convertir un archivo Markdown estructurado en:

- un Epic en Jira cuando exista un bloque `Epic`
- una o varias Task en Jira cuando existan bloques `Task`
- labels y components aplicados despues de la creacion
- issue keys y parentEpic reales escritos de vuelta en el documento

## Formato esperado del Markdown

Cada bloque debe incluir:

- encabezado `# Epic:` o `# Task:`
- seccion `## Issue Metadata`
- `## Scenario`
- `### Acceptance Tests`
- `### Sources:`

### Metadatos requeridos por tipo de bloque

Para cualquier bloque:

- `projectKey`
- `issueType`
- `summary`
- `component`
- `labels`

Solo para bloques `Task`:

- `parentEpic` cuando la task deba quedar vinculada a un epic

Notas:

- Un documento puede tener solo bloques `Task`.
- Un documento puede tener un bloque `Epic` y uno o mas bloques `Task`.
- Si existe `Epic` y `Task`, el orden de creacion debe ser `Epic` y luego `Task`.

## Flujo operativo

1. Leer el archivo Markdown indicado por el usuario.
2. Identificar si hay bloques `Epic`, bloques `Task` o ambos.
3. Validar cada bloque segun su tipo:
   - `Epic`: debe incluir `Issue Metadata`, `Scenario`, `Acceptance Tests` y `Sources`, con sus metadatos requeridos.
   - `Task`: debe incluir `Issue Metadata`, `Scenario`, `Acceptance Tests` y `Sources`, con sus metadatos requeridos.
4. Si existe un bloque `Epic`, crearlo primero con Jira MCP.
5. Guardar el `issueKey` real del epic si fue creado.
6. Crear cada `Task`:
   - si el documento tambien define un `Epic`, usar el key real del epic creado como `parent`
   - si el documento no define un `Epic`, usar el `parentEpic` del Markdown solo si viene informado
7. Ejecutar `jira_editJiraIssue` para aplicar:
   - `labels`
   - `components`
8. Actualizar siempre el Markdown con:
   - `issueKey` del epic
   - `issueKey` de cada task
   - `parentEpic` con el key real cuando corresponda

## Reglas de comportamiento

- No inventes `projectKey`, `component` ni `labels`.
- Usa exactamente los valores escritos en el Markdown.
- Valida los metadatos requeridos segun el tipo de bloque antes de crear issues.
- Si el documento tiene `Epic` y `Task`, crea primero el `Epic` y luego las `Task`.
- Si el documento tiene solo `Task`, no exijas un bloque `Epic`.
- Si una `Task` referencia un `parentEpic` nominal y el documento incluye un `Epic`, sustituyelo por el key real del epic creado.
- Si Jira acepta la creacion pero deja vacios `components` o `labels`, completa esos campos con `jira_editJiraIssue`.
- Despues de crear las issues, actualiza siempre el Markdown con los `issueKey` y `parentEpic` reales que correspondan.
- Si el Markdown ya contiene `issueKey`, no recrees la issue sin confirmacion explicita del usuario.
- Si el archivo no tiene estructura valida, detente y explica que falta.

## Payload de actualizacion validado

```json
{
  "fields": {
    "labels": ["ai-enablement"],
    "components": [{ "name": "I+D" }]
  }
}
```

## Tu humano puede pedirte

- "Usa el skill `markdown-to-jira` con este archivo"
- "Crea en Jira las issues descritas en este markdown"
- "Sincroniza este backlog markdown con Jira y actualiza los issue keys"
