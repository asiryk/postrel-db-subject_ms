Class l6.Manager Extends l6.User
{

Relationship ClientRel As l6.Client [ Cardinality = many, Inverse = ManagerRel ];

Property TenderPhones As array Of %String;

Property Commission As %Float;

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
