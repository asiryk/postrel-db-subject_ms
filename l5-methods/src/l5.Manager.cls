Class l5.Manager Extends l5.User
{

Relationship ClientRel As l5.Client [ Cardinality = many, Inverse = ManagerRel ];

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
<Subscript>"l5.Manager.TenderPhones"</Subscript>
</Data>
<DefaultData>ManagerDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
