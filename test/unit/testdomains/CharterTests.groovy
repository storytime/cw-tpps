package testdomains

import grails.test.mixin.support.*

import cw.Charter;

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Charter)
class CharterTests implements IDomainTest{

	def testObjFail =   new Charter(price: 0,startDate: new Date(),typeCharter:"AirTest", classCharter:"100", )

	def testObjOk = new Charter(price: 10,startDate: new Date(),typeCharter:"Air", classCharter:"3", )

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
		assertEquals(testObjOk.id.toString(), Charter.get(testID).id.toString())
	}

	@Override
	public void testFalseInsAndSel() {
		testObjOk.id=testID;
		testObjOk.save();
		assertFalse(Charter.get(testID).id != testObjOk.id);
	}

	@Override
	public void testBlank() {
		def testObj = new Charter(price: 0,typeCharter:"Air",)
		assertEquals 'Date is blank.', 'blank', testObj.errors['startDate']

		testObj = new Charter(price: 0,startDate: new Date(),typeCharter:"Air",)

		assertTrue testObj.validate()
	}

	@Override
	public void testNull() {
		assertNotNull(testObjOk)
	}
}
