require 'rails_helper'

describe "sales/index.html.slim", type: :view do
  it "will have field to input the goods and quantity to buy" do
    render
    expect(rendered).to have_selector "input[name='goods_check[quantity]']"
    expect(rendered).to have_selector "input[name='goods_check[goods_id]']"
  end

  it "will have div with id 'ajax_result' to helping on autocorrect the goods_id" do
    render
    expect(rendered).to have_selector "div#ajax_result"
  end

  it "will have a form consist of payment method (credit card or cash) and goods to buy" do
    render
    expect(rendered).to have_selector "input[name='transaction[id_credit_card]']"
    expect(rendered).to have_selector "input[name='transaction[cash]']"

    expect(rendered).to have_content "Nama Obat"
    expect(rendered).to have_content "Satuan"
    expect(rendered).to have_content "Harga"
    expect(rendered).to have_content "QTY"
    expect(rendered).to have_content "Sub Total"
    expect(rendered).to have_content "Opr"
  end

  it "will have some html element with 'paid_amount' as the id to give information about paid amount" do
    render
    expect(rendered).to have_selector "#paid_amount"
  end

  it "will have button to cancel the transaction" do
    render
    expect(rendered).to have_selector "form input[type='submit'][value='BATALKAN TRANSAKSI']"
    # expect(rendered).to have_content "BATALKAN TRANSAKSI"
  end
end

