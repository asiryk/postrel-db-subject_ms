Class l4.Client Extends l4.User
{

Relationship ManagerRel As l4.Manager [ Cardinality = one, Inverse = ClientRel ];

Property Orders As list Of l4.Order;

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
