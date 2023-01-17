Class l6.SparePart Extends (%Persistent, %Library.Populate)
{

Relationship OrderRel As l6.Order [ Cardinality = parent, Inverse = SparePartRel ];

Property Name As %String;

Property Price As %Integer;

Property DependsOn As list Of l6.SparePart;

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
<DataLocation>^l6.SparePartD</DataLocation>
<DefaultData>SparePartDefaultData</DefaultData>
<IdLocation>^l6.SparePartD</IdLocation>
<IndexLocation>^l6.SparePartI</IndexLocation>
<StreamLocation>^l6.SparePartS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
