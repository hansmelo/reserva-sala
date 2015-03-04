describe Room do
	let(:user) { build(:user)}

	it 'validates creation' do
		day = DateTime.now
		hour = 10
		room = Room.new(user: user, day: day, hour: hour)
		expect(room).to be_valid()
	end
end