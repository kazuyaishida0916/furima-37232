require 'rails_helper'

RSpec.describe CardAddress, type: :model do
  describe '商品購入の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @card_address = FactoryBot.build(:card_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@card_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @card_address.building_name = ''
        expect(@card_address).to be_valid
      end
      it 'priceとtokenがあれば保存ができること' do
        expect(@card_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @card_address.post_code = ''
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角を含んだ正しい形式でないと保存できないこと' do
        @card_address.post_code = '1234567'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'phone_numberが10桁以下では購入できない' do
        @card_address.phone_number = '090123456'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが11桁以上では購入できない' do
        @card_address.phone_number = '090123456789'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが半角数値以外では購入できない' do
        @card_address.phone_number = '１'
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @card_address.prefecture_id = 0
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @card_address.user_id = nil
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("User can't be blank")
      end
      it 'Itemが紐付いていないと保存できないこと' do
        @card_address.item_id = nil
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @card_address.token = nil
        @card_address.valid?
        expect(@card_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
