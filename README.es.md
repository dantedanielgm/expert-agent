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

**1. Pon el núcleo en tu `~/.claude/`** (en Windows: `$env:USERPROFILE\.claude`, y `Copy-Item`):
```bash
git clone https://github.com/dantedanielgm/expert-agent.git
cd expert-agent
cp CLAUDE.md      ~/.claude/CLAUDE.md
cp YOU.example.md ~/.claude/YOU.md
mkdir -p ~/.claude/expert-agent && cp -R protocols hooks framework ~/.claude/expert-agent/
```

**2. Dile quién eres:** abre `~/.claude/YOU.md` y llénalo (o déjalo vacío y el agente te pregunta).

**3. Dale su especialidad:**
```bash
~/.claude/expert-agent/framework/new-agent.sh ~/agentes/derecho     # Mac/Linux
~/.claude/expert-agent/framework/new-agent.ps1 "C:\agentes\derecho" # Windows
```
Abre Claude Code en esa carpeta. Como no tiene especialidad, te pregunta en qué debe ser experto, tu
meta, tus proyectos, dónde viven tus documentos y su filtro de decisión — y escribe su `SPECIALTY.md`.
Desde la próxima sesión es tu experto en ese campo. Las capas de ingeniero/verificador/operador/tutor
vienen gratis cada vez.

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
