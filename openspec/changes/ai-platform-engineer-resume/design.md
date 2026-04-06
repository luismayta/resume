## Contexto

Este cambio añade un nuevo perfil de currículum para "AI-Driven Platform Engineer" al sistema de generación de CVs basado en LaTeX. El sistema actual soporta tres perfiles (AI Architect, Cloud Architect, Golang Developer) con generación en inglés y español. Este nuevo perfil utilizará la misma infraestructura existente, adaptando el contenido para roles híbridos de MLOps, infraestructura de IA e ingeniería de plataformas.

El perfil objetivo es senior (5-10 años de experiencia) con enfoque híbrido que combina competencias en MLOps, desarrollo de productos de IA e ingeniería de plataformas cloud. Se requieren versiones en inglés y español para maximizar el alcance en el mercado laboral.

El sistema actual utiliza:
- Archivos YAML en `src/data/` para datos estructurados
- Scripts Python en `provision/scripts/` para generación de LaTeX
- Plantillas LaTeX en `src/core/` y `src/sections/`
- Taskfile.yml para automatización con go-task

## Objetivos / No-Objetivos

**Objetivos:**
- Crear perfil `ai-platform-engineer` con datos en inglés y español
- Generar PDFs para ambos idiomas usando la infraestructura existente
- Incluir habilidades técnicas específicas del rol (MLOps, Kubernetes, LLMs, etc.)
- Mantener consistencia visual y estructura con perfiles existentes
- Integrarse en el build system sin modificar la lógica core

**No-Objetivos:**
- Modificar el sistema de generación de LaTeX o la plantilla base
- Crear nuevo diseño visual diferente al existente
- Añadir features de personalización dinámica
- Modificar perfiles existentes (solo se añade nuevo)
- Cambiar el flujo de CI/CD actual

## Decisiones

1. **Estructura de datos basada en perfiles existentes**
   - Decisión:复用 `ai-architect.yml` como template base para la estructura
   - Alternativa: Crear schema completamente nuevo
   - Razón: Mantiene consistencia y reduce esfuerzo de mantenimiento

2. **Nombres de archivos y rutas**
   - Decisión: `src/data/profiles/ai-platform-engineer.yml`, `src/data/experience/ai-platform-engineer.yml`
   - Alternativa: Usar prefijos o subdirectorios separados
   - Razón: Mantiene la convención existente del proyecto

3. **Skills y certificaciones específicas**
   - Decisión: Categorizar en tres grupos: ML/AI Infrastructure, Platform Engineering, Cloud & DevOps
   - Alternativa: Una sola categoría de skills técnicos
   - Razón: Mejor refleje la naturaleza híbrida del rol

4. **Build targets en Taskfile**
   - Decisión: Añadir tareas `resume:profile:ai-platform-engineer:en` y `resume:profile:ai-platform-engineer:es`
   - Alternativa: Modificar tarea genérica para detectar nuevo perfil
   - Razón: Mantiene consistencia con otros perfiles y facilita debugging

## Riesgos / Compensaciones

- [Riesgo] Perfil puede resultar demasiado amplio difuminando diferenciación → Mitigación: Enfatizar proyectos específicos de MLOps y AI infra en experiencia
- [Riesgo] Duplicación de datos entre profile y experience → Mitigación: Usar referencias YAML para evitar inconsistencias
- [Riesgo] Mantenimiento de dos versiones (en/es) duplica esfuerzo → Mitigación: Skills y estructura idéntica, solo traduce contenido textual

## Plan de Migración

1. Crear archivos de datos YAML (profile, experience, sidebar)
2. Añadir tareas al Taskfile.yml
3. Generar PDFs de prueba con `task resume:profile:ai-platform-engineer:en`
4. Validar output visual contra otros perfiles
5. Añadir al build automático (`task resume:all`)

## Preguntas Abiertas

- ¿Cómo manejar la experiencia en startups vs enterprise? (dos versiones de experiencia?)
- ¿Incluir proyectos personales destacados o solo experiencia laboral?
- ¿Qué nivel de detalle en certificaciones? (solo nombre o también fecha/issuer?)