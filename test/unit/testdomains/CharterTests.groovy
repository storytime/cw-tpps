package testdomains



import grails.test.mixin.*
import org.junit.*

import cw.Charter;

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Charter)
class CharterTests {

    void testSomething() {
		def ch = new Charter();
		ch.save();
		
       fail "Implement me"
    }
}
