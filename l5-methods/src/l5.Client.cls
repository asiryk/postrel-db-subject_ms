Class l5.Client Extends l5.User
{

Relationship ManagerRel As l5.Manager [ Cardinality = one, Inverse = ClientRel ];

Property Orders As list Of l5.Order;

Storage Default
{
<Data name="ClientDefaultData">
<Subscript>"Client"</Subscript>
<Value name="1">
<Value>ManagerRel</Value>
</Value>
<Value name="2">
<Value>Orders</Value>
</Value>
</Data>
<DefaultData>ClientDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
