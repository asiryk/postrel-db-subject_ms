Class l6.Order Extends (%Persistent, %Library.Populate)
{

Relationship SparePartRel As l6.SparePart [ Cardinality = children, Inverse = OrderRel ];

Property Id As %Integer [ Required ];

Index IdIndex On Id [ Unique ];

Property Discount As l6.Discount;

ClassMethod GetOrderById(id As %Numeric) As %ObjectHandle
{
    quit ##class(l6.Client).%OpenId(id)
}

ClassMethod EchoOrderWithDiscount() As %String
{
    set dQuery = "SELECT %ID, Discount FROM l6.Order WHERE Discount > 0"
    set statement = ##class(%SQL.Statement).%ExecDirect(.smt, dQuery)
    do statement.%Display()

    Quit "Success"
}

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
<DataLocation>^l6.OrderD</DataLocation>
<DefaultData>OrderDefaultData</DefaultData>
<IdLocation>^l6.OrderD</IdLocation>
<IndexLocation>^l6.OrderI</IndexLocation>
<StreamLocation>^l6.OrderS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
