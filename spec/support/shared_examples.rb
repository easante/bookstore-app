shared_examples "requires sign in" do
  it "redirects to the signin page" do
    clear_current_user
    action
    expect(response).to redirect_to signin_path
  end
end

shared_examples "requires admin" do
  it "redirects to the home page for non-admin users" do
    set_current_user
    action
    expect(response).to redirect_to root_path
  end
end
