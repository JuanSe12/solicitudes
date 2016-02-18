require 'test_helper'

class ParamclavsControllerTest < ActionController::TestCase
  setup do
    @paramclav = paramclavs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paramclavs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paramclav" do
    assert_difference('Paramclav.count') do
      post :create, paramclav: { diascambios: @paramclav.diascambios, maxalfanumerico: @paramclav.maxalfanumerico, maxcapital: @paramclav.maxcapital, maxcaracteres: @paramclav.maxcaracteres, maxlongitud: @paramclav.maxlongitud, maxnumerico: @paramclav.maxnumerico, minalfanumerico: @paramclav.minalfanumerico, mincapital: @paramclav.mincapital, mincaracteres: @paramclav.mincaracteres, minlongitud: @paramclav.minlongitud, minnumerico: @paramclav.minnumerico, numeroreintentos: @paramclav.numeroreintentos, tipoclave: @paramclav.tipoclave }
    end

    assert_redirected_to paramclav_path(assigns(:paramclav))
  end

  test "should show paramclav" do
    get :show, id: @paramclav
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paramclav
    assert_response :success
  end

  test "should update paramclav" do
    patch :update, id: @paramclav, paramclav: { diascambios: @paramclav.diascambios, maxalfanumerico: @paramclav.maxalfanumerico, maxcapital: @paramclav.maxcapital, maxcaracteres: @paramclav.maxcaracteres, maxlongitud: @paramclav.maxlongitud, maxnumerico: @paramclav.maxnumerico, minalfanumerico: @paramclav.minalfanumerico, mincapital: @paramclav.mincapital, mincaracteres: @paramclav.mincaracteres, minlongitud: @paramclav.minlongitud, minnumerico: @paramclav.minnumerico, numeroreintentos: @paramclav.numeroreintentos, tipoclave: @paramclav.tipoclave }
    assert_redirected_to paramclav_path(assigns(:paramclav))
  end

  test "should destroy paramclav" do
    assert_difference('Paramclav.count', -1) do
      delete :destroy, id: @paramclav
    end

    assert_redirected_to paramclavs_path
  end
end
