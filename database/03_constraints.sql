ALTER TABLE users
ALTER COLUMN is_active SET NOT NULL;

ALTER TABLE users
ADD COLUMN phone_number VARCHAR(20);

ALTER TABLE users
ADD CONSTRAINT unique_phone_number
UNIQUE (phone_number);

UPDATE users
SET phone_number = '9876500001'
WHERE id = 1;

UPDATE users
SET phone_number = '9876500002'
WHERE id = 2;

UPDATE users
SET phone_number = '9876500003'
WHERE id = 3;

UPDATE users
SET phone_number = '9876500004'
WHERE id = 4;

UPDATE users
SET phone_number = '9876500005'
WHERE id = 5;
