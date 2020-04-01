class CowsAndBulls
  def initialize
    random_number = rand(1111..9999)
    @random_number = split_into_digits(random_number)
  end

  def play
    print_instructions
    get_and_check_input
  end

  def print_instructions
    puts "Podaj ciąg czterocyfrowy:"
  end

  def get_and_check_input
    input = gets
    @input_number = split_into_digits(input.to_i)

    check_input
  end

  def check_input
    cows, bulls = find_cows_and_bulls

    if cows == 4
      puts "4 cows, congratulations!"
      return
    else
      puts "#{cows} cows, #{bulls} bulls."
      get_and_check_input
    end
  end

  def find_cows_and_bulls
    cows = 0
    bulls = 0

    @random_number.each_with_index do |digit, index|
      if @input_number[index] == digit
        cows += 1
      elsif @input_number.include?(digit)
        bulls += 1
      end
    end

    [cows, bulls]
  end

  def split_into_digits(number)
    number.to_s.split('')
  end
end


# tests start here
describe CowsAndBulls do
  before do
    subject { CowsAndBulls.new }
    subject.instance_variable_set(:@random_number, ['1', '2', '3', '4'])
  end

  describe '.split_into_digits' do
    it 'splits number into an array of one digit strings' do
      expect(subject.split_into_digits(9876)).to eq(['9', '8', '7', '6'])
    end
  end

  describe '.find_cows_and_bulls' do
    it 'returns 0 and 0 when no digit match' do
      subject.instance_variable_set(:@input_number, ['5', '6', '7', '8'])
      expect(subject.find_cows_and_bulls).to eq([0, 0])
    end

    it 'returns 4 and 0 when all digits match' do
      subject.instance_variable_set(:@input_number, ['1', '2', '3', '4'])
      expect(subject.find_cows_and_bulls).to eq([4, 0])
    end

    it 'returns 0 and 4 when all digits are the same, but do not match' do
      subject.instance_variable_set(:@input_number, ['4', '3', '2', '1'])
      expect(subject.find_cows_and_bulls).to eq([0, 4])
    end

    it 'returns 2 and 2 when two match and two are the same' do
      subject.instance_variable_set(:@input_number, ['1', '2', '4', '3'])
      expect(subject.find_cows_and_bulls).to eq([2, 2])
    end
  end

  describe '.check_input' do
    context 'all digits match' do
      before(:each) do
        allow(subject).to receive(:find_cows_and_bulls) { [4, 0] }
      end

      it 'prints congratulations' do
        expect { subject.check_input }.to output("4 cows, congratulations!\n").to_stdout
      end

      it 'does not call get_and_check_input as the next step' do
        expect(subject).not_to receive(:get_and_check_input)
        subject.check_input
      end
    end

    context 'some digits match' do
      before do
        allow(subject).to receive(:find_cows_and_bulls) { [2, 1] }
      end

      it 'prints number of cows and bulls' do
        allow(subject).to receive(:get_and_check_input)
        expect { subject.check_input }.to output("2 cows, 1 bulls.\n").to_stdout
      end

      it 'calls get_and_check_input as the next step' do
        expect(subject).to receive(:get_and_check_input)
        subject.check_input
      end
    end
  end
end
