# Pack: Coding — disciplina para Claude Code al programar

El caso más común: le pides cambios a Claude Code sobre tu app y comete errores tontos
—rompe cosas que funcionaban, reescribe de más, dice "listo" sin probar—.

Esto NO se arregla con un agente-persona. Se arregla con **contexto y reglas**: un archivo
`CLAUDE.md` en la raíz de tu proyecto que le dice cómo comportarse y qué es tu app.

## Cómo usarlo

1. Copia `CLAUDE.md` de esta carpeta a la raíz del proyecto donde programas.
2. Llena la sección "Contexto de esta app" (qué es, stack, cómo se corre, cómo se prueba).
3. Abre Claude Code en esa carpeta. Ya lo lee automáticamente en cada sesión.

Eso es todo. No necesitas instalar el framework completo para esto — este pack es independiente.

## Por qué funciona

Las reglas (piensa antes de codear, cambios quirúrgicos, verifica antes de cantar victoria)
son las que separan a un asistente que rompe cosas de uno que hace cambios precisos. El
contexto de la app evita que invente rutas, comandos o convenciones que no existen.
