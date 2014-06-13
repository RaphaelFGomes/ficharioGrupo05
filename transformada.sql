let $ficharioGrupo05doc := doc('https://raw.githubusercontent.com/RaphaelFGomes/ficharioGrupo05/master/fichariogrupo05.xml')

for $i in ($ficharioGrupo05doc//produto)

where $i
        return 
            {
				data('BEGIN;'),
                concat(data('INSERT INTO produtos(nome, descricao, valor, quantidade) VALUES('''),
                data($i/nome),
				data(''','''),
				data($i/descricao),
				data(''','),
				data($i/valor),
				data(','),
				data($i/quantidade),				
                data(');')),
				concat(data('INSERT INTO marcas(nome) VALUES('''),
                data($i/marca/nome),
                data(''');')),
				concat(data('INSERT INTO categorias(nome, datacadastro) VALUES('''),
                data($i/categoria/nome),
				data(''','''),
				data($i/categoria/datacadastro),
                data(''');')),
				data('COMMIT;')
            }