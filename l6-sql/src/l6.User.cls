Class l6.User Extends (%Persistent, %Library.Populate) [ Abstract ]
{

Property FirstName As %String;

Property LastName As %String;

Property BirthDate As %Date;

Property Avatar As %Stream.FileBinary;

Storage Default
{
<Data name="UserDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirstName</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>BirthDate</Value>
</Value>
<Value name="5">
<Value>Avatar</Value>
</Value>
</Data>
<DataLocation>^l6.UserD</DataLocation>
<DefaultData>UserDefaultData</DefaultData>
<IdLocation>^l6.UserD</IdLocation>
<IndexLocation>^l6.UserI</IndexLocation>
<StreamLocation>^l6.UserS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
