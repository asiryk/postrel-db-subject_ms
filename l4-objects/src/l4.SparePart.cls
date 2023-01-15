Class l4.SparePart Extends %Persistent
{

Relationship OrderRel As l4.Order [ Cardinality = children, Inverse = SparePartRel ];

Property Name As %String;

Property Price As %Integer;

Property DependsOn As list Of l4.SparePart;

Storage Default
{
<Data name="SparePartDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Price</Value>
</Value>
<Value name="4">
<Value>DependsOn</Value>
</Value>
</Data>
<DataLocation>^l4.SparePartD</DataLocation>
<DefaultData>SparePartDefaultData</DefaultData>
<IdLocation>^l4.SparePartD</IdLocation>
<IndexLocation>^l4.SparePartI</IndexLocation>
<StreamLocation>^l4.SparePartS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
