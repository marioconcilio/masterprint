create or replace function cheques_aberto(bigint) returns numeric as
$$
  select sum(valor)
  from cheques
  where cliente_id = $1
  and status = 'Em aberto';
$$
language sql
immutable strict;

create or replace function cheques_devolvido(bigint) returns numeric as
$$
  select sum(valor)
  from cheques
  where cliente_id = $1
  and status = 'Devolvido';
$$
language sql
immutable strict;

create or replace function cheques_depositado(bigint) returns numeric as
$$
  select sum(valor)
  from cheques
  where cliente_id = $1
  and status = 'Depositado';
$$
language sql
immutable strict;

create or replace function cheques_pago(bigint) returns numeric as
$$
  select sum(valor)
  from cheques
  where cliente_id = $1
  and status = 'Pago';
$$
language sql
immutable strict;
