Class l6.Manager Extends l6.User
{

Relationship ClientRel As l6.Client [ Cardinality = many, Inverse = ManagerRel ];

Property TenderPhones As array Of %String;

Property Commission As %Float;

ClassMethod EchoAllClient(EmId As %Numeric) As %String
{
    Set resultSet=##class(%ResultSet).%New()
    Set resultSet.ClassName="l6.Manager"
    Set resultSet.QueryName="GetAllClient"
    Do resultSet.Execute(EmId)

    While resultSet.Next() {
        Write resultSet.Data("FirstName"), !
    }

    Return "Success"
}

Query GetAllClient(EmId As %Numeric) As %Query(ROWSPEC = "FirstName:%String") [ SqlProc ]
{
}

ClassMethod GetAllClientExecute(ByRef qHandle As %Binary, EmId As %Numeric) As %Status
{
    set employee = ##class(l6.Manager).%OpenId(EmId)

    Set key = ""
    Do {
    Set client = employee.ClientRel.GetNext(.key)
    If (client '= "") {
    set $li(qHandle, *+1) = $lb(client.FirstName)
    }
    } While (key '= "")

    kill ^||iter
    set ^||iter = 1
    Quit $$$OK
}

ClassMethod GetAllClientFetch(ByRef qHandle As %Binary, ByRef Row As %List, ByRef AtEnd As %Integer = 0) As %Status [ PlaceAfter = GetAllClientExecute ]
{
    set rs=$get(qHandle)
    if $ll(rs)=0 {
    set Row=""
    set AtEnd=1
    quit $$$OK
    }
    if ^||iter <= $ll(rs) {
    set Row=$li(rs, ^||iter)
    set AtEnd=0
    set ^||iter = $increment(^||iter)
    } else {
    set Row=""
    set AtEnd=1
    }
    Quit $$$OK
}

ClassMethod GetAllClientClose(ByRef qHandle As %Binary) As %Status [ PlaceAfter = GetAllClientExecute ]
{
    Set qHandle=""
    Quit $$$OK
}

ClassMethod GetManagersWithCommisionMoreThan(commission As %Float) As %String
{
    &sql(DECLARE ClientC CURSOR FOR
    SELECT %ID, FirstName, LastName, Commission
    INTO :id, :firstName, :lastName, :comm
    FROM l6.Manager
    WHERE Commission > :commission
    )

    &sql(OPEN ClientC)
    &sql(FETCH ClientC)
    While (SQLCODE = 0) {
    w id, ": ", lastName, " ", firstName, ": ", comm,!
    &sql(FETCH ClientC)
    }
    &sql(CLOSE ClientC)

    Quit "Success"
}

Storage Default
{
<Data name="ManagerDefaultData">
<Subscript>"Manager"</Subscript>
<Value name="1">
<Value>Commission</Value>
</Value>
</Data>
<Data name="TenderPhones">
<Attribute>TenderPhones</Attribute>
<Structure>subnode</Structure>
<Subscript>"l6.Manager.TenderPhones"</Subscript>
</Data>
<DefaultData>ManagerDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
