package testdomains


import cw.Action;
import cw.VacationPackage;

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Action)
class ActionTests implements IDomainTest {
	
	def testObjFail =   new Action(decription: "testtest", discount: 200,endDate: new Date(),startDate: new Date(),	 )

	def testObjOk =  new Action(decription: "testtest", discount: 20,endDate: new Date(),startDate: new Date(),va: new ArrayList<VacationPackage>(),)

	@Override
	public void testFalseValid() {
		assertFalse testObjFail.validate()
	}

	@Override
	public void testTrueValid() {
		def va=new VacationPackage(endDate: new Date(),startDate: new Date(), people: 25, priceFull: 28.5) 
		testObjOk.va.add(va)
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
			def testObj = new Action(
					decription: "testtest",
					discount: 0,
					endDate: new Date(),
					startDate: new Date(),
				)
			//assertFalse testObj.validate()
			assertEquals 'Discount is blank.', 'blank', testObj.errors['discount']
			
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

	@Override
	public void testNull() {
		assertNotNull(testObjOk)
	}

}
