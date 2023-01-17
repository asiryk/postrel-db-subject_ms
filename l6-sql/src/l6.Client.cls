Class l6.Client Extends l6.User
{

Relationship ManagerRel As l6.Manager [ Cardinality = one, Inverse = ClientRel ];

Property Orders As list Of l6.Order;

Property Age As %Integer [ Calculated, SqlComputeCode = {set Age = ##class(l6.Client).CalculateAge(BirthDate)}, SqlComputed ];

ClassMethod CalculateAge(DOB As %Date) As %Integer
{
    #; 8 - YYYYMMDD (19970701 or 20020327) — Numeric format
    Quit $ZDate($HOROLOG, 8)-$ZDate(DOB, 8) \ 10000
}

Method GetAge() As %Integer [ CodeMode = expression, ServerOnly = 1 ]
{
##class(l6.Client).CalculateAge(..BirthDate)
}

Trigger SetDiscount [ Event = INSERT, Foreach = row/object, Time = AFTER ]
{
    set ^Discount("discount_q", {ID}) = {ID}
}

ClassMethod GetClientByManagerLastName(lastName As %String) As %ObjectHandle
{
    &sql(select id into :id from l6.Client where MangerRel->LastName = :lastName)

    if SQLCODE quit $$$NULLOREF
    quit ##class(l6.Client).%OpenId(id)
}

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
