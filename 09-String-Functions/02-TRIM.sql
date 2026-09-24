-- Topic 3: TRIM(), LTRIM(), RTRIM()

SELECT TRIM('   Gaurav Kumbhar   ') AS trimmed_text;

SELECT LTRIM('   Gaurav Kumbhar') AS left_trimmed;

SELECT RTRIM('Gaurav Kumbhar   ') AS right_trimmed;

SELECT TRIM('   Data Analyst   ') AS cleaned_role;

SELECT TRIM('x' FROM 'xxxGauravxxx') AS trimmed_characters;