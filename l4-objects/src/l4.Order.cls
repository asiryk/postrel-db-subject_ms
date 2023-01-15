Class l4.Order Extends %Persistent
{

Relationship SparePartRel As l4.SparePart [ Cardinality = parent, Inverse = OrderRel ];

Property Id As %Integer [ Required ];

Index IdIndex On Id [ Unique ];

Property Discount As l4.Discount;

Storage Default
{
<Data name="OrderDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Id</Value>
</Value>
<Value name="3">
<Value>SpareParts</Value>
</Value>
<Value name="4">
<Value>Discount</Value>
</Value>
</Data>
<DataLocation>^l4.OrderD</DataLocation>
<DefaultData>OrderDefaultData</DefaultData>
<IdLocation>^l4.OrderD</IdLocation>
<IndexLocation>^l4.OrderI</IndexLocation>
<StreamLocation>^l4.OrderS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
