# PAI Framework — tus propios agentes personales sobre Claude Code

Framework ligero para darte **agentes personales especializados** encima de Claude Code.
Cada agente tiene su propio dominio, memoria y carpetas — pero todos comparten el mismo
método de trabajo (el "ADN"). Como tener un Jarvis por cada área de tu vida: uno para el
trabajo, uno para las finanzas, uno para el cuerpo, el que quieras.

No es una app ni una librería. Son archivos de contexto que Claude Code lee. Cero dependencias.

---

## La idea en 30 segundos

Un agente personal tiene dos capas:

- **ADN (universal):** cómo enseña, cómo recuerda, cómo conversa, sus reglas de código. Igual para todos.
- **Identidad (específica):** nombre, dominio, norte, proyectos, carpetas, filtro. Distinta por agente.

El ADN vive una sola vez en `~/.claude/CLAUDE.md`. Cada agente es una carpeta con su propia
identidad en `AGENT/`. Abres Claude Code en esa carpeta → ese agente despierta, con su
personalidad y su memoria.

```
~/.claude/
├── CLAUDE.md          ← ADN universal (compartido por todos tus agentes)
├── PRINCIPAL.md       ← quién eres tú (lo llenas una vez)
└── framework/         ← plantilla + onboarding + scripts

<carpeta-de-un-agente>/
├── CLAUDE.md          ← loader del agente
└── AGENT/             ← su identidad (nombre, norte, proyectos, filtro, memoria)
```

---

## Instalación (3 pasos)

**Requisito:** tener [Claude Code](https://claude.com/claude-code) instalado.

### 1. Copia el ADN y el framework a tu `~/.claude/`

```bash
# clona el repo donde quieras
git clone https://github.com/<tu-usuario>/pai-framework.git
cd pai-framework

# copia el ADN, la plantilla de identidad y el framework
cp CLAUDE.md            ~/.claude/CLAUDE.md
cp PRINCIPAL.example.md ~/.claude/PRINCIPAL.md
cp -R framework         ~/.claude/framework
```

> En Windows (PowerShell), reemplaza `~/.claude` por `$env:USERPROFILE\.claude` y `cp` por `Copy-Item`.

### 2. Dile al agente quién eres

Abre `~/.claude/PRINCIPAL.md` y llénalo (cómo te llamas, a qué te dedicas, qué te importa).
O déjalo vacío: la primera vez que abras un agente, él te hace 3 preguntas y lo llena solo.

### 3. Crea tu primer agente

```bash
# macOS / Linux
~/.claude/framework/nuevo-agente.sh ~/mis-agentes/finanzas

# Windows (PowerShell)
~/.claude/framework/nuevo-agente.ps1 "C:\mis-agentes\finanzas"
```

Abre Claude Code en esa carpeta. Como no tiene identidad todavía, te hace 7 preguntas
(nombre, dominio, tu norte, tus proyectos, dónde guarda memoria, su filtro de decisiones)
y escribe su identidad. Desde la próxima sesión, ya es tu agente de ese dominio.

Repite el paso 3 por cada área de tu vida que quieras cubrir.

---

## ¿Solo quieres que Claude Code deje de romper tu código?

No necesitas todo el framework. Mira [`packs/coding`](packs/coding/) — es un solo `CLAUDE.md`
que pones en la raíz de tu proyecto y le da a Claude Code disciplina (piensa antes de codear,
cambios quirúrgicos, verifica antes de decir "listo") + contexto de tu app. Un archivo, cero setup.

---

## Cómo pensar tus agentes

- **Uno por dominio, no uno gigante.** Un agente de finanzas con contexto de finanzas supera
  a un asistente genérico que sabe un poco de todo. La especialización es la ventaja.
- **La memoria es del agente, no del chat.** Cada agente guarda su aprendizaje en su carpeta
  (lo defines en `BRIDGE.md`). Así rompes la barrera de "se olvida todo al cerrar la sesión".
- **El filtro es lo que lo hace estratega, no loro.** Cada agente pasa tus decisiones por una
  pregunta-norte antes de recomendarte algo. Eso lo obliga a servir tu meta, no solo responder.

---

## Privacidad

Este repo contiene solo el **método** y las **plantillas en blanco**. Tu identidad (`PRINCIPAL.md`)
y la de tus agentes (`AGENT/` lleno) viven en tu `~/.claude` y en tus carpetas — nunca aquí.
Si haces fork o publicas tu propia versión, no subas tus archivos llenos.

---

## Licencia

MIT. Úsalo, modifícalo, compártelo.
