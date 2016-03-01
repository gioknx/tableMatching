#\d*\s*(.+?)\s+?([\d|\/]+)\s+?\w+\s+?\w+\s+


require 'csv'

input_csv_path = "ALL-DOMAINS-BR-ATUALIZADO.csv"
output_csv_path = "lista_comparacao.csv"

dominios_antigos = []
dominios_novos = []

nova_lista = []


## Pegamos as listas de dominios e colocamo-nas em arrays
CSV.foreach(input_csv_path) do |row|
	dominios_antigos << row[0]
	dominios_novos << row[1]
end

## Checamos a correspondencia
dominios_antigos.each do |domain|
	# Se a lista antiga incluir o dominio, colocaremo-os lado a lado
	if dominios_novos.include? domain
		nova_lista << [ domain, domain ]
	# Se não, colocaremos ele ao lado de um espaço em branco
	else
		nova_lista << [domain, ""]
	end
end


CSV.open(output_csv_path, "wb") do |csv|
  	nova_lista.each do |row|
		csv << [row[0], row[1]]
	end
end


