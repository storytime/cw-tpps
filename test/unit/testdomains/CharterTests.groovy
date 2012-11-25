package testdomains

import grails.test.mixin.support.*
import cw.Charter

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(Charter)
class CharterTests implements IDomainTest {


	def testObjFail = new Charter(classCharter: "1",startDate: new Date(),
	price: 100,typeCharter: "underGround")

	def testObjOk = new Charter(classCharter: "1",startDate: new Date(),
	price: 100,typeCharter: "Air")


	@Override
	public void testTrueInsAndSel() {
		testObjOk.id=testID;
		testObjOk.save();
		assertEquals(testObjOk.id.toString(), Charter.get(testID).id.toString())
	}

	@Override
	public void testFalseInsAndSel() {
		testObjOk.id=testID;
		testObjOk.save();
		assertFalse(Charter.get(testID).id != testObjOk.id);
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
		def testObj = new Charter(classCharter: "", typeCharter: "")
		assertFalse testObj.validate()

		testObj =new Charter(classCharter: "1",startDate: new Date(),
				price: 100,typeCharter: "Air")
		assertTrue testObj.validate()
	}

	@Override
	public void testNull() {
		assertNotNull(testObjOk.save())
	}
}
