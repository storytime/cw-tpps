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
	
	def adFail =   new Admins(
			email: "test",
			age: 1000,
			login: "test",
			passwdHash: "test",
			phoneNumber: "test",
			name: "test",
			secondName: "test",
		)
	
	def adOk =  new Admins(
			email: "testtest@gmail.com",
			age: 25,
			login: "testlogin",
			passwdHash: "testhash",
			phoneNumber: "testnumber",
			name: "testUsername",
			secondName: "testSecondName",
		)
	
	protected void setUp() {
		super.setUp()
	}
	

	@Override
	public void testFalseValid() {
	//	mockForConstraintsTests(Admins, [adFail])
		assertFalse adFail.validate()
	}

	@Override
	public void testTrueValid() {
	//	mockForConstraintsTests(Admins, [adOk])
		assertTrue adOk.validate()
	}

	@Override
	public void testTrueInsAndSel() {
		//mockForConstraintsTests(Admins, [adOk]);
		adOk.id=testID;
		adOk.save();
		assertEquals(adOk.id.toString(), Admins.get(testID).id.toString())
	}

	@Override
	public void testFalseInsAndSel() {
	//	mockForConstraintsTests(Admins, [adOk]);
		adOk.id=testID;
		adOk.save();
		assertFalse("IDs are not equal", Admins.get(testID).id != adOk.id);
	}

	@Override
	public void testBlank() {
			Admins adm = new Admins(email: "testtest@gmail.com", age: 25,  login: "",
							passwdHash: "", phoneNumber: "", name: "",secondName: "",
					)
			//assertFalse adm.validate()
			assertEquals 'Name is blank.', 'blank', adm.errors['name']
			
			assertEquals 'login is blank.', 'blank', adm.errors['login']
			adm = new Admins()(
					email: "testtest@gmail.com",
					age: 25,
					login: "testlogin",
					passwdHash: "testhash",
					phoneNumber: "testnumber",
					name: "testUsername",
					secondName: "testSecondName",
				)
			assertTrue adm.validate()
				
	}
	
	
}
