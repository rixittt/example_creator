INSERT INTO teachers (name, telegram_user_id)
VALUES
    ('Преподаватель1', 458945690),
    ('Преподаватель2', 685414031),
    ('Преподаватель3', 5397130405)
ON CONFLICT (name) DO UPDATE
SET telegram_user_id = EXCLUDED.telegram_user_id;

INSERT INTO groups (name, teacher_id)
SELECT 'Группа1', t.id FROM teachers t WHERE t.name = 'Преподаватель1'
ON CONFLICT (name) DO UPDATE SET teacher_id = EXCLUDED.teacher_id;

INSERT INTO groups (name, teacher_id)
SELECT 'Группа2', t.id FROM teachers t WHERE t.name = 'Преподаватель2'
ON CONFLICT (name) DO UPDATE SET teacher_id = EXCLUDED.teacher_id;

INSERT INTO groups (name, teacher_id)
SELECT 'Группа3', t.id FROM teachers t WHERE t.name = 'Преподаватель3'
ON CONFLICT (name) DO UPDATE SET teacher_id = EXCLUDED.teacher_id;

INSERT INTO topics (title, llm_prompt)
VALUES
    (
        'Метод замены переменной',
        'Ты — генератор задач по математическому анализу (интегралы). Сгенерируй 1 задачу по теме: метод замены переменной. Требования: 1) Дай ровно ОДИН пример на вычисление неопределённого интеграла, чтобы он решался именно методом из темы. 2) Верни результат СТРОГО в 3 строках и строго с такими префиксами: пример:, подсказка:, ответ:. 3) В строке "пример:" укажи только LaTeX-формулу интеграла (БЕЗ знака $...$), которую можно напрямую вставить в Python как raw string: r"...". Никаких слов и пояснений. Используй только команды, которые понимает matplotlib mathtext: \int, \frac, ^, _, \sqrt, \ln, \sin, \cos, \tan, e^{...}, \cdot, \left( \right), \,. НЕ используй \textbf, \text, \begin, \end, \displaystyle, \cases и т.п. 4) "подсказка:" — 1 короткое предложение (до 12 слов), как решать. 5) "ответ:" — итоговый результат интеграла в LaTeX (БЕЗ $...$), обязательно с "+ C". 6) Сложность уровня 1–2 курса. Запрещено: дополнительные строки, нумерации, пустые строки, любые символы кроме этих 3 строк.'
    ),
    (
        'Метод подведения под знак дифференциала',
        'Ты — генератор задач по математическому анализу (интегралы). Сгенерируй 1 задачу по теме: метод подведения под знак дифференциала. Требования: 1) Дай ровно ОДИН пример на вычисление неопределённого интеграла, чтобы он решался именно методом из темы. 2) Верни результат СТРОГО в 3 строках и строго с такими префиксами: пример:, подсказка:, ответ:. 3) В строке "пример:" укажи только LaTeX-формулу интеграла (БЕЗ знака $...$), которую можно напрямую вставить в Python как raw string: r"...". Никаких слов и пояснений. Используй только команды, которые понимает matplotlib mathtext: \int, \frac, ^, _, \sqrt, \ln, \sin, \cos, \tan, e^{...}, \cdot, \left( \right), \,. НЕ используй \textbf, \text, \begin, \end, \displaystyle, \cases и т.п. 4) "подсказка:" — 1 короткое предложение (до 12 слов), как решать. 5) "ответ:" — итоговый результат интеграла в LaTeX (БЕЗ $...$), обязательно с "+ C". 6) Сложность уровня 1–2 курса. Запрещено: дополнительные строки, нумерации, пустые строки, любые символы кроме этих 3 строк.'
    ),
    (
        'Метод интегрирования по частям',
        'Ты — генератор задач по математическому анализу (интегралы). Сгенерируй 1 задачу по теме: метод интегрирования по частям. Требования: 1) Дай ровно ОДИН пример на вычисление неопределённого интеграла, чтобы он решался именно методом из темы. 2) Верни результат СТРОГО в 3 строках и строго с такими префиксами: пример:, подсказка:, ответ:. 3) В строке "пример:" укажи только LaTeX-формулу интеграла (БЕЗ знака $...$), которую можно напрямую вставить в Python как raw string: r"...". Никаких слов и пояснений. Используй только команды, которые понимает matplotlib mathtext: \int, \frac, ^, _, \sqrt, \ln, \sin, \cos, \tan, e^{...}, \cdot, \left( \right), \,. НЕ используй \textbf, \text, \begin, \end, \displaystyle, \cases и т.п. 4) "подсказка:" — 1 короткое предложение (до 12 слов), как решать. 5) "ответ:" — итоговый результат интеграла в LaTeX (БЕЗ $...$), обязательно с "+ C". 6) Сложность уровня 1–2 курса. Запрещено: дополнительные строки, нумерации, пустые строки, любые символы кроме этих 3 строк.'
    )
ON CONFLICT (title) DO UPDATE
SET llm_prompt = EXCLUDED.llm_prompt;

INSERT INTO theory_pages (topic_id, page_order, title, text_content, image_file_id)
VALUES
    (1, 1, 'Теория: метод замены переменной', 'Если интеграл содержит сложную функцию и её производную, делаем замену u = g(x).', 'AgACAgIAAxkBAAIMBGmpFf8bo2FWQeJ7eLrXj3ZrZCB4AAI6EmsbV0tISU260M3hoa8qAQADAgADeQADOgQ'),
    (2, 1, 'Теория: метод подведения под знак дифференциала', 'Представьте подынтегральное выражение как f''(x)/f(x) и используйте замену u = f(x), du = f''(x)dx.', 'AgACAgIAAxkBAAIMBmmpFjZhDhCqkda36I_rGtMqR6HIAAI7EmsbV0tISdWeI9z6IvEHAQADAgADeQADOgQ'),
    (3, 1, 'Теория: метод по частям', 'Используем формулу ∫u dv = uv - ∫v du. Выбираем u так, чтобы du упрощался.', 'AgACAgIAAxkBAAIMCGmpFmSxFmASM0KvW31WOarWJtLYAAI8EmsbV0tISRcyw7U6BSfXAQADAgADeQADOgQ')
ON CONFLICT DO NOTHING;

WITH student_seed AS (
    SELECT 'Группа1'::TEXT AS group_name, 'Студент'::TEXT AS student_name, 448270826::BIGINT AS telegram_user_id
    UNION ALL SELECT 'Группа2', 'Студент', 404326001
    UNION ALL SELECT 'Группа3', 'Студент', 742381892
)
INSERT INTO students (name, telegram_user_id, group_id)
SELECT
    ss.student_name,
    ss.telegram_user_id,
    g.id
FROM student_seed ss
JOIN groups g ON g.name = ss.group_name
ON CONFLICT (telegram_user_id) DO UPDATE
SET name = EXCLUDED.name,
    group_id = EXCLUDED.group_id;
