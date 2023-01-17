Class l5.Discount Extends (%SerialObject, %Library.Populate)
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
<DataLocation>^l5.DiscountD</DataLocation>
<DefaultData>DiscountDefaultData</DefaultData>
<IdLocation>^l5.DiscountD</IdLocation>
<IndexLocation>^l5.DiscountI</IndexLocation>
<State>DiscountState</State>
<StreamLocation>^l5.DiscountS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
