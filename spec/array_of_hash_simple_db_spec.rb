class User
  include ArrayOfHashSimpleDb

  self.records = [
    { name: 'Jun' },
    { name: 'John' },
    { name: 'Jun', age: 20 },
  ]
end

class NotRecordsSetUser
  include ArrayOfHashSimpleDb
end

RSpec.describe ArrayOfHashSimpleDb do
  describe '.records=' do
    subject { NotRecordsSetUser.instance_variable_get(:@records) }

    context 'before set records' do
      it { is_expected.to eq(nil) }
    end

    context 'after set records' do
      let(:users) do
        [
          { name: 'Jun' },
          { name: 'John' },
        ]
      end

      before do
        NotRecordsSetUser.records = users
      end

      it { is_expected.to eq(users) }
    end
  end

  describe '.records' do
    it 'return initialized records' do
      expect(User.records.length).not_to eq(0)
      expect(User.records.all? { |u| u.instance_of?(User) }).to eq(true)
    end
  end

  describe '.find_by' do
    context 'when exist record' do
      let(:name) { 'Jun' }

      it 'return first Jun record' do
        user = User.find_by(name: name)
        expect(user.name).to eq('Jun')
        expect(user.age).to eq(nil)
      end

      context 'with multiple condition' do
        let(:age) { 20 }

        it 'return first Jun record' do
          user = User.find_by(name: name, age: age)
          expect(user.name).to eq('Jun')
          expect(user.age).to eq(20)
        end
      end
    end

    context 'when not exist record' do
      let(:name) { 'not exist user name' }

      it 'return nil' do
        expect(User.find_by(name: name)).to eq(nil)
      end
    end
  end

  describe '#attributes' do
    subject { User.first.public_send(attribute) }

    context 'when exist key' do
      let(:attribute) { :name }

      it { is_expected.to eq('Jun') }

      context 'But this record has not key' do
        let(:attribute) { :age }

        it { is_expected.to eq(nil) }
      end
    end

    context 'when not exist key' do
      let(:attribute) { :address }

      it 'raise NoMethodError' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end
  end
end
