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


