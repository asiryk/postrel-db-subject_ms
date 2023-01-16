Class l5.Order Extends %Persistent
{

Relationship SparePartRel As l5.SparePart [ Cardinality = parent, Inverse = OrderRel ];

Property Id As %Integer [ Required ];

Index IdIndex On Id [ Unique ];

Property Discount As l5.Discount;

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
<DataLocation>^l5.OrderD</DataLocation>
<DefaultData>OrderDefaultData</DefaultData>
<IdLocation>^l5.OrderD</IdLocation>
<IndexLocation>^l5.OrderI</IndexLocation>
<StreamLocation>^l5.OrderS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
