describe User do
	before(:each) { @user = User.new(email: 'test@bol.com.br') }

	subject{ @user }

	it { should respond_to(:email) }

	it "#email returns a string" do
		expect(@user.email).to match 'test@bol.com.br'
	end
end