package cw



import org.junit.*
import grails.test.mixin.*

@TestFor(CharterController)
@Mock(Charter)
class CharterControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/charter/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.charterInstanceList.size() == 0
        assert model.charterInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.charterInstance != null
    }

    void testSave() {
        controller.save()

        assert model.charterInstance != null
        assert view == '/charter/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/charter/show/1'
        assert controller.flash.message != null
        assert Charter.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/charter/list'

        populateValidParams(params)
        def charter = new Charter(params)

        assert charter.save() != null

        params.id = charter.id

        def model = controller.show()

        assert model.charterInstance == charter
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/charter/list'

        populateValidParams(params)
        def charter = new Charter(params)

        assert charter.save() != null

        params.id = charter.id

        def model = controller.edit()

        assert model.charterInstance == charter
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/charter/list'

        response.reset()

        populateValidParams(params)
        def charter = new Charter(params)

        assert charter.save() != null

        // test invalid parameters in update
        params.id = charter.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/charter/edit"
        assert model.charterInstance != null

        charter.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/charter/show/$charter.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        charter.clearErrors()

        populateValidParams(params)
        params.id = charter.id
        params.version = -1
        controller.update()

        assert view == "/charter/edit"
        assert model.charterInstance != null
        assert model.charterInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/charter/list'

        response.reset()

        populateValidParams(params)
        def charter = new Charter(params)

        assert charter.save() != null
        assert Charter.count() == 1

        params.id = charter.id

        controller.delete()

        assert Charter.count() == 0
        assert Charter.get(charter.id) == null
        assert response.redirectedUrl == '/charter/list'
    }
}
