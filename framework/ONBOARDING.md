# Onboarding — Cuestionario de creación de agente

> Esto corre la PRIMERA vez que un agente PAI se abre en un proyecto sin identidad definida.
> El agente hace estas preguntas, escribe las respuestas en `AGENT/` del proyecto, y a partir
> de ahí ese proyecto tiene su propio agente especializado.

## Paso 0 — ¿Ya sé quién es el principal?

Antes del onboarding del agente, verifico que exista `~/.claude/PRINCIPAL.md`.
Si NO existe, primero lo creo con 3 preguntas rápidas:
1. ¿Cómo quieres que te diga?
2. ¿Quién eres / a qué te dedicas? (una o dos líneas)
3. ¿Qué debería tener en cuenta antes de recomendarte algo? (tu norte, tu contexto)

Con eso escribo `~/.claude/PRINCIPAL.md` (usa `PRINCIPAL.example.md` de plantilla). Una sola vez.

## Cómo corro el onboarding del agente (instrucciones para el agente)

1. Detecto que no hay identidad (no existe `./AGENT/IDENTITY.md` o está en blanco con `{{...}}`).
2. Le explico al principal en una línea qué voy a hacer: "Voy a hacerte unas preguntas para
   crear este agente. Una sola vez."
3. Hago las preguntas de abajo — una o dos a la vez, conversacional, no como formulario frío.
4. Con sus respuestas, escribo los 6 archivos de `AGENT/` usando la plantilla de `TEMPLATE/`.
5. Confirmo: "Listo. Soy [nombre], tu agente de [dominio]. Esto es lo que sé de mí: [resumen]."
6. A partir de la próxima sesión, cargo esa identidad y trabajo normal.

## Las preguntas

| # | Pregunta | Va al archivo | Ejemplo |
|---|----------|---------------|---------|
| 1 | ¿Cómo se llama este agente? | IDENTITY | Atlas |
| 2 | ¿Cuál es el tema o dominio? | IDENTITY | IA agéntica + carrera |
| 3 | ¿Cuál es tu norte en este dominio? ¿La meta máxima? | NORTE | Ser AI Engineer de élite |
| 4 | ¿Quién eres tú respecto a este tema? Tu contexto, nivel | USER | Builder autodidacta de IA |
| 5 | ¿Qué proyectos tienes activos en este dominio? | PROJECTS | Proyecto X, Proyecto Y |
| 6 | ¿Dónde vive el conocimiento? ¿Qué carpeta uso y dónde guardo memoria? | BRIDGE | D:\notas\tema |
| 7 | ¿Cuál es la pregunta-filtro antes de recomendarte algo? | FILTER | ¿Esto me acerca a mi norte? |

## Después del onboarding
El proyecto queda con:
```
AGENT/
├── IDENTITY.md   ← nombre + dominio
├── NORTE.md      ← la meta máxima
├── USER.md       ← quién es el principal en este dominio
├── PROJECTS.md   ← proyectos activos
├── BRIDGE.md     ← carpetas accesibles + ubicación de memoria
└── FILTER.md     ← la pregunta-filtro de decisiones
```
Y un `CLAUDE.md` de proyecto que los importa.
