
use dbusers;

-- A Ana será Administradora
INSERT INTO application_user(application_user_name, first_name, last_name, tax_payer_number, type)
VALUES
('USER01', 'Ana', 'Silva', '111111111','A');

-- por omissão o João será cliente (type omitido)
INSERT INTO application_user(application_user_name, first_name, last_name, tax_payer_number)
VALUES
('USER02', 'João', 'Pedro', '222222222');

-- por omissão a Lara será cliente (type='C')
INSERT INTO application_user(application_user_name, first_name, last_name, tax_payer_number, type)
VALUES
('USER03', 'Lara', 'Ferreira', '333333333',default);

INSERT INTO message(subject, message, application_user_id)
VALUES
('ID','Qual a bibliografia que podemos consultar?',(SELECT application_user_id FROM application_user WHERE application_user_name='USER02'));

INSERT INTO message(subject, message, application_user_id)
VALUES
('ID','Por exemplo o livro: Introduction to Databases e Data Warehouses',(SELECT application_user_id FROM application_user WHERE application_user_name='USER03'));