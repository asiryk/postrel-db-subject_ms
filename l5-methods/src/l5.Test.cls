Class l5.Test Extends %UnitTest.TestCase
{

Method TestCreatingObject()
{
    Set client = ##class(l5.Client).%New()
    Do $$$AssertTrue($ISOBJECT(client), "create client object")
}

Method TestDeletingObject()
{
    Set client = ##class(l5.Client).%New()
    Do client.%Save()
    Do $$$AssertTrue($ISOBJECT(client), "delete client object")
    
    Set del = ##class(l5.Client).%DeleteId(client.%Id())
    Set exist = ##class(l5.Client).%OpenId(client.%Id())
    
    Do $$$AssertStatusOK(del, "Object deleted")
    Do $$$AssertStatusNotOK(exist, "Object doesn't deleted")
}

Method TestRequiredField()
{
    Set order = ##class(l5.Order).%New()
    Set saveStatus = order.%Save()
    Do $$$AssertStatusNotOK(saveStatus, "Required field test without required field")
    Set order.Id = 57
    Set saveStatus = order.%Save()
    Do $$$AssertStatusOK(saveStatus, "Required field test with required field")
    
    Set del = ##class(l5.Order).%DeleteId(order.%Id())
    Do $$$AssertStatusOK(del, "Object deleted")
}

Method TestUniqueField()
{
    Set order = ##class(l5.Order).%New()
    Set order.Id = 53
    Set saveStatus = order.%Save()
    
    Set order2 = ##class(l5.Order).%New()
    Set order2.Id = 53
    Set saveStatus = order2.%Save()
    
    Do $$$AssertStatusNotOK(saveStatus, "Unique field test")
}

Method TestRelation()
{
    Set manager = ##class(l5.Manager).%New()
    Set saveStatus = manager.%Save()
    Do $$$AssertStatusOK(saveStatus, "create object")

    Set c1 = ##class(l5.Client).%New()
    Set saveStatus = c1.%Save()
    Set c2 = ##class(l5.Client).%New()
    Set saveStatus = c2.%Save()

    Do manager.ClientRel.Insert(c1)
    Do manager.ClientRel.Insert(c2)

    Set delStatus = ##class(l5.Manager).%DeleteId(manager.%Id())

    Do $$$AssertStatusOK(delStatus, "Relation test delete test")
}

}
