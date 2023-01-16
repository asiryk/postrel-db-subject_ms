Class l5.User Extends %Persistent [ Abstract ]
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
<DataLocation>^l5.UserD</DataLocation>
<DefaultData>UserDefaultData</DefaultData>
<IdLocation>^l5.UserD</IdLocation>
<IndexLocation>^l5.UserI</IndexLocation>
<StreamLocation>^l5.UserS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
