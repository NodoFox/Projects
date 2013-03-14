<query1>
{
for $x in doc("appinfo.xml")/appinfo/App
for $y in doc("appinfo.xml")/appinfo/Developer
where $x/TabletCompatible = true() and $y/ID = $x/Developer
order by $x/Name descending
return
(
<ID>{data($x/ID)}</ID>,
<Name>{data($x/Name)}</Name>,
<Developer>{data($y/Name)}</Developer>,
<Price>{data($x/Price)}</Price>
)
}
</query1>
