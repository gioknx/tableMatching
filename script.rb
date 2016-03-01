#\d*\s*(.+?)\s+?([\d|\/]+)\s+?\w+\s+?\w+\s+


require 'csv'

input_csv_path = "lista_entrada.csv"
output_csv_path = "lista_comparacao.csv"

produtos_antigos = []
produtos_novos = []

nova_lista = []


## Pegamos as listas de produtos e colocamo-nas em arrays
CSV.foreach(input_csv_path) do |row|
	produtos_antigos << row[0]
	produtos_novos << row[1]
end

## Checamos a correspondencia
produtos_antigos.each do |product|
	# Se a lista antiga incluir o produto, colocaremo-os lado a lado
	if produtos_novos.include? product
		nova_lista << [ product, product ]
	# Se não, colocaremos ele ao lado de um espaço em branco
	else
		nova_lista << [product, ""]
	end
end

## Escrevemos as duas colunas no arquivo de saída
CSV.open(output_csv_path, "wb") do |csv|
  	nova_lista.each do |row|
		csv << [row[0], row[1]]
	end
end


