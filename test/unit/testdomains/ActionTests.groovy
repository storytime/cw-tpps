package testdomains

import grails.test.mixin.support.*
import cw.Action

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
//@TestMixin(GrailsUnitTestMixin)
@TestFor(Action)
class ActionTests implements IDomainTest {

	def testObjFail = new Action(decription: "test",discount: 1000,
	endDate: new Date(), startDate: new Date())

	def testObjOk = new Action(decription: "test",discount: 50,
	endDate: new Date(), startDate: new Date())

	@Override
	public void testTrueInsAndSel() {
		testObjOk.id=testID;
		testObjOk.save();
		assertEquals(testObjOk.id.toString(), Action.get(testID).id.toString())
	}

	@Override
	public void testFalseInsAndSel() {
		testObjOk.id=testID;
		testObjOk.save();
		assertFalse(Action.get(testID).id != testObjOk.id);
	}

	@Override
	public void testFalseValid() {
		assertFalse testObjFail.validate()
	}

	@Override
	public void testTrueValid() {
		assertTrue testObjOk.validate()
	}

	@Override
	public void testBlank() {
		def testObj = new Action(decription: "",discount: 1000)
		assertFalse(testObj.validate())

		testObj = new Action(decription: "test",discount: 50,
				endDate: new Date(), startDate: new Date())

		assertTrue testObj.validate()
	}

	@Override
	public void testNull() {
		assertNotNull(testObjOk.save())
	}
}
