CREATE DATABASE keycloak;

CREATE DATABASE dashboard;

\c dashboard

CREATE USER dashboard_user WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN NOREPLICATION NOBYPASSRLS;
GRANT dashboard_user to postgres;
GRANT CONNECT,CREATE ON DATABASE dashboard TO dashboard_user;


CREATE USER dashboard_user_rw WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN NOREPLICATION NOBYPASSRLS;
GRANT dashboard_user_rw to postgres;
GRANT CONNECT ON DATABASE dashboard TO dashboard_user_rw;

CREATE USER dashboard_user_ro WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN NOREPLICATION NOBYPASSRLS;
GRANT dashboard_user_ro to postgres;
GRANT CONNECT ON DATABASE dashboard TO dashboard_user_ro;


CREATE SCHEMA auth AUTHORIZATION dashboard_user;
GRANT USAGE ON SCHEMA auth TO dashboard_user_rw;

GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA auth TO dashboard_user_rw;
GRANT SELECT,UPDATE ON ALL SEQUENCES IN SCHEMA auth TO dashboard_user_rw;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA auth GRANT SELECT,INSERT,UPDATE,DELETE ON TABLES TO dashboard_user_rw;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA auth GRANT SELECT,UPDATE ON SEQUENCES TO dashboard_user_rw;

GRANT USAGE ON SCHEMA auth TO dashboard_user_ro;
GRANT SELECT ON ALL TABLES IN SCHEMA auth TO dashboard_user_ro;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA auth TO dashboard_user_ro;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA auth GRANT SELECT ON TABLES TO dashboard_user_ro;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA auth GRANT SELECT ON SEQUENCES TO dashboard_user_ro;

CREATE SCHEMA app AUTHORIZATION dashboard_user;
GRANT USAGE ON SCHEMA app TO dashboard_user_rw;

GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA app TO dashboard_user_rw;
GRANT SELECT,UPDATE ON ALL SEQUENCES IN SCHEMA app TO dashboard_user_rw;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA app GRANT SELECT,INSERT,UPDATE,DELETE ON TABLES TO dashboard_user_rw;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA app GRANT SELECT,UPDATE ON SEQUENCES TO dashboard_user_rw;

GRANT USAGE ON SCHEMA app TO dashboard_user_ro;
GRANT SELECT ON ALL TABLES IN SCHEMA app TO dashboard_user_ro;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA app TO dashboard_user_ro;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA app GRANT SELECT ON TABLES TO dashboard_user_ro;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA app GRANT SELECT ON SEQUENCES TO dashboard_user_ro;

CREATE SCHEMA catalog AUTHORIZATION dashboard_user;
GRANT USAGE ON SCHEMA catalog TO dashboard_user_rw;

GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA catalog TO dashboard_user_rw;
GRANT SELECT,UPDATE ON ALL SEQUENCES IN SCHEMA catalog TO dashboard_user_rw;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA catalog GRANT SELECT,INSERT,UPDATE,DELETE ON TABLES TO dashboard_user_rw;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA catalog GRANT SELECT,UPDATE ON SEQUENCES TO dashboard_user_rw;

GRANT USAGE ON SCHEMA catalog TO dashboard_user_ro;
GRANT SELECT ON ALL TABLES IN SCHEMA catalog TO dashboard_user_ro;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA catalog TO dashboard_user_ro;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA catalog GRANT SELECT ON TABLES TO dashboard_user_ro;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA catalog GRANT SELECT ON SEQUENCES TO dashboard_user_ro;

CREATE SCHEMA scaffolder AUTHORIZATION dashboard_user;
GRANT USAGE ON SCHEMA scaffolder TO dashboard_user_rw;

GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN SCHEMA scaffolder TO dashboard_user_rw;
GRANT SELECT,UPDATE ON ALL SEQUENCES IN SCHEMA scaffolder TO dashboard_user_rw;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA scaffolder GRANT SELECT,INSERT,UPDATE,DELETE ON TABLES TO dashboard_user_rw;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA scaffolder GRANT SELECT,UPDATE ON SEQUENCES TO dashboard_user_rw;

GRANT USAGE ON SCHEMA scaffolder TO dashboard_user_ro;
GRANT SELECT ON ALL TABLES IN SCHEMA scaffolder TO dashboard_user_ro;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA scaffolder TO dashboard_user_ro;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA scaffolder GRANT SELECT ON TABLES TO dashboard_user_ro;
ALTER DEFAULT PRIVILEGES FOR ROLE dashboard_user IN SCHEMA scaffolder GRANT SELECT ON SEQUENCES TO dashboard_user_ro;


ALTER ROLE dashboard_user IN DATABASE dashboard SET search_path TO auth,app,catalog,scaffolder,"$user",public;
ALTER ROLE dashboard_user_rw IN DATABASE dashboard SET search_path TO auth,app,catalog,scaffolder,"$user",public;
ALTER ROLE dashboard_user_ro IN DATABASE dashboard SET search_path TO auth,app,catalog,scaffolder,"$user",public;

ALTER USER dashboard_user WITH PASSWORD 'dashboard1';
ALTER USER dashboard_user_ro WITH PASSWORD 'dashboard1';
ALTER USER dashboard_user_rw WITH PASSWORD 'dashboard1';

