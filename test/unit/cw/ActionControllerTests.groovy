package cw



import org.junit.*
import grails.test.mixin.*

@TestFor(ActionController)
@Mock(Action)
class ActionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/action/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.actionInstanceList.size() == 0
        assert model.actionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.actionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.actionInstance != null
        assert view == '/action/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/action/show/1'
        assert controller.flash.message != null
        assert Action.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/action/list'

        populateValidParams(params)
        def action = new Action(params)

        assert action.save() != null

        params.id = action.id

        def model = controller.show()

        assert model.actionInstance == action
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/action/list'

        populateValidParams(params)
        def action = new Action(params)

        assert action.save() != null

        params.id = action.id

        def model = controller.edit()

        assert model.actionInstance == action
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/action/list'

        response.reset()

        populateValidParams(params)
        def action = new Action(params)

        assert action.save() != null

        // test invalid parameters in update
        params.id = action.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/action/edit"
        assert model.actionInstance != null

        action.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/action/show/$action.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        action.clearErrors()

        populateValidParams(params)
        params.id = action.id
        params.version = -1
        controller.update()

        assert view == "/action/edit"
        assert model.actionInstance != null
        assert model.actionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/action/list'

        response.reset()

        populateValidParams(params)
        def action = new Action(params)

        assert action.save() != null
        assert Action.count() == 1

        params.id = action.id

        controller.delete()

        assert Action.count() == 0
        assert Action.get(action.id) == null
        assert response.redirectedUrl == '/action/list'
    }
}
