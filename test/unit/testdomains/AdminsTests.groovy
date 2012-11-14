package testdomains



import grails.test.mixin.*
import grails.test.mixin.support.*

import org.junit.*

import cw.Admins

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(Admins)
class AdminsTests implements IDomainTest {
	
	def testObjFail =   new Admins(
			email: "test",
			age: 1000,
			login: "test",
			passwdHash: "test",
			phoner: "test",
			name: "test",
			secondName: "test",
		)
	
	def testObjOk =  new Admins(
			email: "testtest@gmail.com",
			age: 25,
			login: "testlogin",
			passwdHash: "testhash",
			phone: "testnumber",
			name: "testUsername",
			secondName: "testSecondName",
		)
	
	@Override
	public void testFalseValid() {
		mockForConstraintsTests(Admins, [testObjFail])
		assertFalse testObjFail.validate()
	}

	@Override
	public void testTrueValid() {
		mockForConstraintsTests(Admins, [testObjOk])
		assertTrue testObjOk.validate()		
	}

	@Override
	public void testTrueInsAndSel() {
		mockForConstraintsTests(Admins, [testObjOk]);
		testObjOk.id=testID;
		testObjOk.save();
		assertEquals(testObjOk.id.toString(), Admins.get(testID).id.toString())
	}

	@Override
	public void testFalseInsAndSel() {
		mockForConstraintsTests(Admins, [testObjOk]);
		testObjOk.id=testID;
		testObjOk.save();
		assertFalse("IDs are not equal", Admins.get(testID).id != testObjOk.id);
	}

	@Override
	public void testBlank() {
			Admins testObj = new Admins(email: "testtest@gmail.com", age: 25,  login: "",
							passwdHash: "", phoneNumber: "", name: "",secondName: "",
					)
			//assertFalse testObj.validate()
			assertEquals 'Name is blank.', 'blank', testObj.errors['name']
			
			assertEquals 'login is blank.', 'blank', testObj.errors['login']
			testObj = new Admins()(
					email: "testtest@gmail.com",
					age: 25,
					login: "testlogin",
					passwdHash: "testhash",
					phoneNumber: "testnumber",
					name: "testUsername",
					secondName: "testSecondName",
				)
			assertTrue testObj.validate()
				
	}
	
	
}
