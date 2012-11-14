package testdomains



import grails.test.mixin.*
import org.junit.*

import cw.Action;
import cw.VacationPackage;

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Action)
class ActionTests implements IDomainTest {
	
	def testObjFail =   new Action(
		decription: "testtest", 
		discount: 200,
		endDate: new Date(),
		startDate: new Date()+2,
		hasMany: null,   	 
	)

	def testObjOk =  new Action(
		decription: "testtest", 
		discount: 20,
		endDate: new Date(),
		startDate: new Date(),
		hasMany: new VacationPackage(
				endDate: new Date(),
				people: 10,
				priceFull: 10000,
				startDate: new Date(),
				hasMany: null,
			),
	)

	@Override
	public void testFalseValid() {
		mockForConstraintsTests(Action, [testObjFail])
		assertFalse testObjFail.validate()
	}

	@Override
	public void testTrueValid() {
		mockForConstraintsTests(Action, [testObjOk])
		assert testObjOk.validate()
	}

	@Override
	public void testTrueInsAndSel() {
		mockForConstraintsTests(Action, [testObjOk]);
		testObjOk.id=testID;
		testObjOk.save();
		assertEquals(testObjOk.id.toString(), Action.get(testID).id.toString())
	}

	@Override
	public void testFalseInsAndSel() {
		mockForConstraintsTests(Action, [testObjOk]);
		testObjOk.id=testID;
		testObjOk.save();
		assertFalse("IDs are not equal", Action.get(testID).id != testObjOk.id);
	}

	@Override
	public void testBlank() {
			Action testObj = new Action(email: "testtest@gmail.com", age: 25,  login: "",
							passwdHash: "", phoneNumber: "", name: "",secondName: "",
					)
			//assertFalse testObj.validate()
			assertEquals 'Name is blank.', 'blank', testObj.errors['name']
			
			assertEquals 'login is blank.', 'blank', testObj.errors['login']
			testObj = new Action()(
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
