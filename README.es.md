# Expert Agent

**Un agente experto personal para Claude Code.** Experto en tu campo — derecho, sociología,
medicina, contabilidad, lo que hagas — pero **ingeniero por debajo** sin importar el campo, y que
**te enseña a trabajar con él** mientras trabaja.

No es una app ni una librería. Son unos pocos archivos de instrucciones que Claude Code lee. Cero
dependencias.

*(English: [README.md](README.md))*

---

## La idea

La mayoría abre Claude Code para *construir* algo — y dentro de Claude Code, la forma de construir
cualquier cosa es código. Así que por más especializado que sea tu agente, siempre debe cargar tres
capas fijas, más una que defines tú:

1. **Ingeniero** — cómo escribe código: pensar antes, simplicidad, cambios quirúrgicos.
2. **Verificador** — cómo prueba el trabajo antes de decir "listo": evidencia no afirmaciones, git
   como red de seguridad, reproducir antes de arreglar, *arregla las tuberías no el modelo*. **Esta
   es la capa que mata los errores tontos** — la que casi todos se saltan.
3. **Operador de IA** — cómo se maneja a sí mismo (contexto, memoria, modelos) y te enseña a dirigirlo.
4. **Especialista** — la capa variable. Se define una vez, con unas preguntas de onboarding.

Las tres primeras viven en un núcleo corto y denso (`CLAUDE.md`) que comparten todos tus agentes. La
especialidad es un solo archivo encima. El conocimiento profundo y situacional (protocolos de
enseñanza, lentes de asesores) se carga **bajo demanda** — nunca infla el núcleo, porque un contexto
inflado hace que el modelo *ignore* tus instrucciones.

---

## Instalación (3 pasos)

**Requisito:** [Claude Code](https://claude.com/claude-code) instalado.

**Forma fácil — un solo comando (sin git, sin copiar archivos).** Pégalo una vez en tu terminal;
descarga e instala todo solo (respalda tu `CLAUDE.md` si ya tenías uno, y nunca toca tu `YOU.md`):

Windows (PowerShell):
```powershell
irm https://raw.githubusercontent.com/dantedanielgm/expert-agent/main/install.ps1 | iex
```
macOS / Linux:
```bash
curl -fsSL https://raw.githubusercontent.com/dantedanielgm/expert-agent/main/install.sh | sh
```

Eso es toda la instalación. Salta al paso 3.

**Forma manual (desarrolladores)** — en Windows: `$env:USERPROFILE\.claude` y `Copy-Item`:
```bash
git clone https://github.com/dantedanielgm/expert-agent.git
cd expert-agent
cp CLAUDE.md      ~/.claude/CLAUDE.md
cp YOU.example.md ~/.claude/YOU.md
mkdir -p ~/.claude/expert-agent && cp -R protocols hooks framework ~/.claude/expert-agent/
```

**2. Dile quién eres:** abre `~/.claude/YOU.md` y llénalo (o déjalo vacío y el agente te pregunta).

**3. Dale su especialidad** — sin script, sin terminal para esta parte:
1. Crea una carpeta nueva y vacía (clic derecho → Nueva carpeta, como siempre).
2. Abre Claude Code dentro de esa carpeta.
3. Escribe lo que sea. Como no tiene especialidad, te pregunta en qué debe ser experto, tu meta, tus
   proyectos, dónde viven tus documentos y su filtro de decisión — y escribe su `SPECIALTY.md`.

Desde la próxima sesión es tu experto en ese campo. Repite en otra carpeta para cada campo que
quieras cubrir — las capas de ingeniero/verificador/operador/tutor vienen gratis cada vez.

*(¿Prefieres terminal? `~/.claude/expert-agent/framework/new-agent.sh ~/agentes/derecho` (Mac/Linux)
o `new-agent.ps1 "C:\agentes\derecho"` (Windows) hacen lo mismo en una línea.)*

---

## Mídelo — no lo sientas

[`evals/`](evals/) trae una suite inicial de **tareas con trampas plantadas** (un segundo bug oculto
que solo aparece si el agente corre el código, un cambio de una línea rodeado de carnada, una tarea
que nombra un archivo que no existe). Córrelas con tu setup y contra Claude Code pelado, y *sabes* si
tus instrucciones ayudan en vez de creerlo. Y cada error tonto real de tu agente se convierte en un
caso nuevo — igual que cada bug se convierte en un test de regresión.

---

## ¿Solo quieres que Claude Code deje de romper tu código?

No necesitas todo. Mira [`packs/coding`](packs/coding/): un solo `CLAUDE.md` que pones en la raíz de
tu proyecto y le da a Claude Code disciplina (pensar antes, cambios quirúrgicos, verificar antes de
decir "listo") + contexto de tu app. Un archivo, cero setup.

---

## Influencias

Es una síntesis, y es honesta sobre su linaje: toma las ideas con evidencia o adopción real y las
funde en un solo modelo. Las reglas se escriben limpias, sin nombres adentro (los nombres son ruido
para el agente que las lee). Bebe de: **Andrej Karpathy** (disciplina de código), **Anthropic**
(best practices oficiales: verificación como ingrediente #1, instrucciones cortas > infladas),
**12-Factor Agents** (pocos archivos propios > framework ajeno gigante), **Superpowers** de Jesse
Vincent (nada de código sin plan, reproduce antes de arreglar, review adversarial) y **PAI/LifeOS**
de Daniel Miessler (arquitectura de identidad + memoria persistente). Conocer tus fuentes es lo que
lo hace síntesis y no copia.

## Privacidad

Este repo solo tiene el **método** y **plantillas en blanco**. Tu identidad (`YOU.md`) y la
especialidad de cada agente viven en tu `~/.claude` y tus carpetas — nunca aquí.

## Licencia

MIT.
