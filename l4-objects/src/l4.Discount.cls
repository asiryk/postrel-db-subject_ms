Class l4.Discount Extends %SerialObject
{

Property Reason As %String;

Property DiscountPercents As %Integer(MAXVAL = 100, MINVAL = 0);

Storage Default
{
<Data name="DiscountDefaultData">
<Subscript>"1"</Subscript>
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<Data name="DiscountState">
<Value name="1">
<Value>Reason</Value>
</Value>
<Value name="2">
<Value>DiscountPercents</Value>
</Value>
</Data>
<DataLocation>^l4.DiscountD</DataLocation>
<DefaultData>DiscountDefaultData</DefaultData>
<IdLocation>^l4.DiscountD</IdLocation>
<IndexLocation>^l4.DiscountI</IndexLocation>
<State>DiscountState</State>
<StreamLocation>^l4.DiscountS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
