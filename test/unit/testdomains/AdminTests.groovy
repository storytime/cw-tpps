package testdomains

import grails.test.mixin.support.*
import cw.Admin

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(Admin)
class AdminTests implements IDomainTest {

	def testObjFail = new Admin(email: "test",age: 1000,login: "test",
	passwdHash: "test",phoner: "test",name: "test",secondName: "test")

	def testObjOk = new Admin(email: "testtest@gmail.com",age: 25,login: "testlogin",
	passwdHash: "testhash",phone: "testnumber",name: "testUsername",secondName: "testSecondName")

	@Override
	public void testFalseValid() {
		assertFalse testObjFail.validate()
	}

	@Override
	public void testTrueValid() {
		assertTrue testObjOk.validate()
	}

	@Override
	public void testTrueInsAndSel() {
		testObjOk.id=testID;
		testObjOk.save();
		assertEquals(testObjOk.id.toString(), Admin.get(testID).id.toString())
	}

	@Override
	public void testFalseInsAndSel() {
		testObjOk.id=testID;
		testObjOk.save();
		assertFalse(Admin.get(testID).id != testObjOk.id);
	}

	@Override
	public void testBlank() {
		def testObj = new Admin(email: "testtest@gmail.com", age: 25,  login: "",
				passwdHash: "", phoneNumber: "", name: "",secondName: "")

		assertFalse(testObj.validate())

		testObj = new Admin(email: "testtest@gmail.com",age: 25,login: "testlogin",
				passwdHash: "testhash",phone: "testnumber",name: "testUsername",
				secondName: "testSecondName")
		
		assertTrue testObj.validate()
	}

	@Override
	public void testNull() {
		assertNotNull(testObjOk.save())
	}
}
