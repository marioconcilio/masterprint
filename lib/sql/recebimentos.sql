create or replace function recebimentos_order(bigint) returns bigint as
$$
begin
  if $1 < 1000 then
    return $1 * 1000;
  else
    return $1;
  end if;
end;
$$
language plpgsql
immutable;

create index idx_recebimentos_order on recebimentos((recebimentos_order(id)));

create or replace function recebimentos_aberto(bigint) returns numeric as
$$
  select sum(valor)
  from recebimentos
  where cliente_id = $1
  and status = 'Em aberto'
  and vencimento >= CURRENT_TIMESTAMP;
$$
language sql
immutable strict;

create or replace function recebimentos_vencido(bigint) returns numeric as
$$
  select sum(valor)
  from recebimentos
  where cliente_id = $1
  and status = 'Em aberto'
  and vencimento < CURRENT_TIMESTAMP;
$$
language sql
immutable strict;

create or replace function recebimentos_cartorio(bigint) returns numeric as
$$
  select sum(valor)
  from recebimentos
  where cliente_id = $1
  and status = 'Cartório';
$$
language sql
immutable strict;

create or replace function recebimentos_protesto(bigint) returns numeric as
$$
  select sum(valor)
  from recebimentos
  where cliente_id = $1
  and status = 'Protestado';
$$
language sql
immutable strict;
