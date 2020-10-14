class AddDescontoInssToProponentes < ActiveRecord::Migration[6.0]
  def change
    add_column :proponentes, :desconto_inss, :float
  end
end
