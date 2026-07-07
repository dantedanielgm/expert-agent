# CLAUDE.md — reglas para trabajar sobre ESTA app

> Pon este archivo en la raíz del proyecto donde programas con Claude Code.
> No convierte a Claude en un "agente-persona" — solo le da disciplina y contexto de TU app
> para que deje de cometer errores tontos al pedirle cambios.
>
> Llena la sección "Contexto de esta app" y borra estos comentarios.

---

## Cómo debes trabajar en este proyecto (Karpathy Guidelines)

### 1. Piensa antes de codear
- Explicita tus suposiciones. Si hay incertidumbre, pregunta — no adivines.
- Si hay varias formas de interpretar el pedido, muéstramelas. No elijas en silencio.
- Si existe un enfoque más simple, dilo.
- Si algo no está claro, para. Nombra la confusión. Pregunta.

### 2. Simplicidad primero
- El mínimo código que resuelve el problema. Nada especulativo.
- Sin features de más. Sin abstracciones de un solo uso. Sin "flexibilidad" que no pedí.
- Si escribiste 200 líneas y podían ser 50, reescríbelo.

### 3. Cambios quirúrgicos
- Toca SOLO lo necesario para el pedido. No "mejores" código vecino. No refactorices lo que no está roto.
- Mantén el estilo que ya existe en el archivo.
- Si ves código muerto no relacionado, menciónalo — pero no lo borres sin permiso.
- Cada línea que cambies debe trazarse directo a lo que te pedí.

### 4. Ejecución guiada por objetivo
- "Agrega validación" → primero un test con inputs inválidos, luego hazlo pasar.
- "Arregla el bug" → primero un test que reproduce el bug, luego hazlo pasar.
- Tareas de varios pasos: dime el plan breve ANTES de ejecutar.

### 5. Verifica antes de cantar victoria
- No digas "listo" sin haber corrido lo que tocaste (test, build, o la app misma).
- Si algo falla, dilo con el error a la vista. No escondas fallos.
- Primer diagnóstico: el pipeline (¿contexto completo? ¿rutas bien? ¿input esperado?), no el modelo.

---

## Contexto de esta app  (LLENA ESTO)

> 💡 Truco: no lo llenes a mano. Dile a Claude Code: **"lee el código de este proyecto y llena la
> sección 'Contexto de esta app' de este archivo con lo que encuentres — stack, cómo se corre,
> convenciones que ya sigo"**. Los estándares extraídos de TU código real le ganan a los genéricos.

- **Qué es la app:** {{una o dos líneas: qué hace, para quién}}
- **Stack:** {{lenguaje, framework, base de datos, etc.}}
- **Cómo se corre:** {{comando para levantarla en local, ej: npm run dev}}
- **Cómo se prueba:** {{comando de tests, o "no hay tests todavía"}}
- **Archivos/carpetas clave:** {{dónde vive la lógica principal}}
- **Reglas propias del proyecto:** {{convenciones, cosas que NO se deben tocar, estilo}}
