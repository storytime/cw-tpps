package testdomains



import grails.test.mixin.support.*
import org.junit.*

import cw.Countries;
import cw.Trip;
/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Countries)
class CountriesTests  implements IDomainTest{

	def testObjFail = new Countries(name: "Ukraine",wikiLink: "test",hotels: null,places: null,)
	def testObjOk = new Countries(name: "Ukraine",wikiLink: "http://www.google.com",hotels: null,places: null,belongsTo: new Trip() )


	@Override
	public void testTrueInsAndSel() {
		// TODO Auto-generated method stub

	}

	@Override
	public void testFalseInsAndSel() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void testFalseValid() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void testTrueValid() {
		def obj = new Countries()
		print (obj.validate())
		print (testObjOk.validate())
		assert testObjOk.validate()
	}

	@Override
	public void testBlank() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void testNull() {
		// TODO Auto-generated method stub
		
	}
}
