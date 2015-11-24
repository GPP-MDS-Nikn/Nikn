# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

PortalPost.create({
	:author => 'Balanço 2014 do Ligue 180 - tipo de violência relatada (SPM-PR)',
	:title => 'Sobre a violência moral e psicológica contra mulheres',
	:image_file => File.open("#{Rails.root}/app/assets/images/grafico1_Ligue180_Balanco2014.png"), 
	:body => 'Especialistas apontam que, apesar de não deixar marcas físicas evidentes, a violência psicológica é também uma grave violação dos direitos humanos das mulheres, que produz reflexos diretos na sua saúde mental e física. Considerada pela Organização Mundial de Saúde (OMS) como a forma mais presente de agressão intrafamiliar à mulher, sua naturalização é apontada ainda como estímulo a uma espiral de violências. Pode preceder, inclusive, a mais extrema violência, o feminicídio, conforme apontam esses especialistas. O artigo 7º da Lei nº 11.340 tipifica como violência psicológica qualquer conduta que cause dano emocional ou prejuízo à saúde psicológica e à autodeterminação da mulher; diminuição, prejuízo ou perturbação ao seu pleno desenvolvimento; que tenha o objetivo de degradá-la ou controlar suas ações, comportamentos, crenças e decisões mediante ameaça, constrangimento, humilhação, manipulação, isolamento, vigilância constante, perseguição, insulto, chantagem, ridicularização, exploração, limitação do direito de ir e vir ou qualquer outro meio. Traz ainda a definição da violência moral, entendida como qualquer conduta que configure calúnia, difamação ou injúria.	O Capítulo V do Código Penal Brasileiro, que define os crimes contra a honra, criminaliza a injúria, a calúnia e a difamação, enquanto o capítulo VI, dos crimes contra a liberdade pessoal, tipifica o crime de ameaça. O encaminhamento dos processos pelas estruturas dos sistemas de Justiça e Segurança, entretanto, é considerado por especialistas como um dos grandes desafios para a efetivação dos direitos assegurados às mulheres na Lei Maria da Penha.'
})

PortalPost.create({
	:author => 'Compromisso e Atitude - Lei Maria da Penha (27/11/2013)',
	:title => 'Pacto de enfrentamento à violência sexual contra mulheres é urgente',
	:image_file => File.open("#{Rails.root}/app/assets/images/infografico-sobre-estupro_anuario-brasileiro-de-seguranca-publica.jpg"), 
	:body => 'Considerada por especialistas como a mais grave violência depois do assassinato, o estupro ainda vitima milhares de mulheres cotidianamente no País. Os dados da última edição do Anuário Brasileiro de Segurança Pública reacenderam a luz de emergência: o número total de estupros registrados no Brasil subiu 19,3% em 2012, em relação ao ano anterior, atingindo 50,6 mil casos – ou seja, quase seis denúncias a cada hora.

Na sua 4ª edição, o Informativo Compromisso e Atitude entrevistou pesquisadores, profissionais do Sistema de Saúde, operadores do Direito e gestores de políticas públicas que lidam com o tema para saber a dimensão do problema e conhecer as principais conquistas e desafios para dar um basta na violência sexual no Brasil.

Entre os entrevistados, um diagnóstico é unânime: é preciso um pacto intersetorial de não tolerância a este tipo de crime. A proposta é fortalecer os serviços e mostrar para a sociedade que o Estado está do lado da vítima, para que ela realize a denúncia e receba o acompanhamento médico e psicológico necessário, e também que seu agressor seja punido e impedido, assim, de continuar o ciclo de violência ou fazer novas vítimas.

Dimensão
Segundo o Anuário, divulgado em novembro pelo Fórum Brasileiro de Segurança Pública, com o aumento dos registros de estupros, a taxa por 100 mil habitantes passou de 22,1 para 26,1 de um ano para o outro, crescendo 18,17%. O levantamento aponta que as ocorrências desse crime superaram o número de homicídios dolosos, e que há ainda o registro de 4,1 mil tentativas de estupros no ano passado.

Dados do Anuário Brasileiro de Segurança Pública sobre o número de estupros no Brasil em 2012Apesar de alarmantes, esses dados ainda podem estar distantes da realidade, já que os números não incluem outras formas de agressão à liberdade sexual – de acordo com a Organização Mundial da Saúde, violência sexual é “qualquer ato sexual ou tentativa de obter ato sexual, investidas ou comentários sexuais indesejáveis, ou tráfico ou qualquer outra forma, contra a sexualidade de uma pessoa usando coerção”. Pode ser praticado, segundo o organismo, por qualquer pessoa, independentemente da relação com a vítima, e em qualquer cenário, incluindo a casa e o trabalho.

Além disso, uma parcela significativa desse crime não chega a ser denunciada: estudos do Departamento de Medicina Legal da Unicamp (SP), de 1997, indicavam que a maioria das vítimas não reportava a violência sofrida. Segundo o especialista em Ginecologia e Obstetrícia Jefferson Drezett, nos EUA, por exemplo, calcula-se que apenas 16% dos estupros são comunicados às autoridades. Seus estudos revelam que, no Brasil, a maior parte das mulheres não registra queixa por constrangimento e humilhação, ou por medo da reação de seus conhecidos e autoridades. Também é comum que o agressor ameace a mulher de nova violência caso ela revele a que sofreu.

Na avaliação de Drezett, a mulher teme, principalmente, não ser acreditada. “Esse sentimento, aparentemente infundado, de fato se justifica. São incontáveis os relatos de discriminação, preconceito, humilhação e abuso de poder em relação às mulheres em situação de violência sexual”, aponta em artigo.

Diante do quadro, o aumento de ocorrências constatado em 2012 pelo Anuário pode ser sinal também de um movimento positivo: uma queda na subnotificação. A ministra da Secretaria de Políticas para as Mulheres da Presidência da República (SPM-PR), Eleonora Menicucci, considerou os dados como “um alerta que preocupa o Brasil de Norte a Sul”, mas não surpreende. Segundo o governo federal, o aumento no número de estupros captado em pesquisas é esperado, já que as políticas públicas de incentivo à denúncia são crescentes.

“Se as notificações de estupros aumentarem como resultado da atitude corajosa da denúncia, todos teremos dado um passo decisivo para mudar valores e colocar os estupradores atrás das grades”, avaliou a ministra.

    “Embora o aumento da notificação do número de estupros reflita também uma maior coragem das mulheres em denunciá-los, e uma maior receptividade dos serviços de segurança e saúde, é inegável que este é o tipo de crime que pede tolerância zero”, frisou.

Atendimento humanizado e integral

Para especialistas que atuam no atendimento a essas vítimas, a melhor forma de encorajar a denúncia é aprimorar, cada vez mais, o atendimento às mulheres no primeiro contato, conforme aponta a médica psiquiatra Cláudia Facuri, que conduziu uma pesquisa com mulheres vítimas de violência sexual atendidas no CAISM (Centro de Atenção Integral à Saúde da Mulher), da Unicamp (SP).

“Se eu for respeitosamente recebida no serviço de saúde ou no serviço legal, vou ficar mais tranquila em retornar ali, me sentirei menos exposta e efetivamente cuidada. Serviços capacitados para atender essas mulheres como preconizado são essenciais”, explica.

Um passo importante nesse sentido foi a promulgação da Lei nº 12.845/2013. Sancionada em agosto deste ano, ela trouxe maior sustentação jurídica a outras referências nesta área, como o Decreto nº 7.958/2013, lançando em março junto ao Programa Mulher, Viver sem Violência para direcionar a humanização e adequação dos serviços de saúde e segurança, sobretudo dos IMLs.

Com a lei, ficou definido que todos os  hospitais da rede do SUS devem “oferecer às vítimas de violência sexual atendimento emergencial, integral e multidisciplinar, visando o controle e o tratamento dos agravos físicos e psíquicos decorrentes de violência sexual, e encaminhamento, se for o caso, aos serviços de assistência social”. Entre as medidas indicadas estão a  contracepção de emergência e a profilaxia de doenças sexualmente transmissíveis, no atendimento emergencial, e o amparo médico e psicológico para o tratamento da vítima no médio prazo.

Como o hospital deve ser a principal porta de entrada para os serviços do Estado, a lei é bastante importante por ser incisiva, na avaliação do médico obstetra Avelar de Holanda Barbosa. “A urgência é ir para o hospital, porque para as ações que se tomam no atendimento emergencial o tempo é importantíssimo – ou seja, quanto mais elas demoram, maior é o prejuízo para a vítima”, explica.

    “Há várias normas técnicas que orientam esse atendimento. Elas são bastante importantes para disseminar conhecimento, mas isso já foi feito, já foi trabalhado em fóruns, congressos etc. A diferença é que a lei, agora, não orienta, ela obriga que todo mundo siga essas normas. O atendimento tem que ser humanizado e integral e todo hospital do SUS é obrigado a se preparar para atender essas pacientes”, complementa o médico.

O desafio agora é fazer com que o marco legal seja assimilado e efetivado no dia a dia dos serviços de saúde país afora, uma vez que, apesar de bastante positiva, existe um intervalo entre a promulgação da lei e sua efetiva capacitação, conforme destaca a médica Cláudia Facuri. “É difícil sensibilizar uma equipe de saúde para atender uma situação que é tabu”, indica.

Machismo e insegurança'
})

PortalPost.create({
	:author => 'Compromisso e Atitude - Lei Maria da Penha (11/10/2013)',
	:title => ' Feminicídio: desafios e recomendações para enfrentar a mais extrema violência contra as mulheres',
	:image_file => File.open("#{Rails.root}/app/assets/images/Mapa-da-violencia_infografico-homicidios-femininos.jpg"), 
	:body => '
O Brasil está entre os países com maior índice de homicídios de mulheres no mundo – quadro que reforça a urgência de respostas eficazes do Estado e da sociedade para prevenir e punir a violência de gênero. Na América Latina, instituições internacionais traçam recomendações para enfrentar o alto índice de assassinatos de mulheres, enquanto 11 países latino-americanos já criaram leis específicas para coibir o feminicídio.

Feminicídio é o assassinato de uma mulher pela condição de ser mulher. Suas motivações mais comuns são o ódio, o desprezo ou o sentimento de perda da propriedade sobre as mulheres, em uma sociedade marcada pela desigualdade de gênero, como a brasileira. Com uma taxa de 4,4 assassinatos em 100 mil mulheres, o Brasil está entre os países com maior índice de homicídios femininos: ocupa a sétima posição em um ranking de 84 nações, segundo dados do Mapa da Violência 2012 (Cebela/Flacso). “Mais de 43 mil mulheres foram assassinadas no País na última década, uma realidade vergonhosa que torna a tipificação penal do feminicídio uma demanda explícita e urgente, cuja real aplicação tem no Judiciário elemento indispensável”, comenta Flávio Crocce Caetano, secretário de Reforma do Judiciário do Ministério da Justiça.

No País, o cenário que mais preocupa representantes do Estado engajados em impedir a mais extrema das violências de gênero é o do feminicídio íntimo, aquele cometido em contexto de violência doméstica. Além desse, outras duas circunstâncias que caracterizam este crime são a prática de violência sexual ou a tortura e mutilação da vítima antes ou depois do assassinato – segundo Projeto de Lei do Senado que pode criar uma tipificação penal específica para esse crime (PLS 292/2013).

De acordo com o Mapa da Violência, altas taxas de feminicídio costumam ser acompanhadas de elevados níveis de tolerância à violência contra as mulheres e, em alguns casos, são exatamente o resultado dessa negligência. Os mecanismos pelos quais essa tolerância é exercida podem ser variados, mas um prepondera: a culpabilização da vítima como justificativa dessa forma extrema de violência.

“Basicamente, o mecanismo de autojustificação de várias instituições, principalmente aquelas que deveriam zelar pela segurança e pela proteção da mulher, coloca a vítima como culpada. A mulher é responsabilizada pela violência que sofre. Este tipo de postura institucional de tolerância à violência e impunidade não só permite como incentiva o feminicídio”, avalia o sociólogo Julio Jacobo Waiselfisz, responsável pelo Mapa da Violência.

Esse quadro coloca desafios para o poder público, que busca formas de avançar na efetivação da Lei Maria da Penha e ainda debate novos caminhos para complementar a legislação e coibir de maneira efetiva o assassinato de mulheres.

A preocupação no Brasil está em sintonia com a crescente dedicação de organizações internacionais a este tema: órgãos da ONU discutem a criação de protocolos para investigar e enfrentar o problema, enquanto 11 países latino-americanos já criaram leis específicas para coibir o feminicídio.

infografico homicidios femininos. mapa da violencia 2012

Dados revelam a gravidade do feminicídio íntimo

Por falta de um tipo penal específico ou de protocolos que obriguem a designação do assassinato de uma mulher em razão do gênero em grande parte da rede de Saúde ou Segurança Pública, o feminicídio ainda conta com poucas estatísticas que apontem sua real dimensão no País.

O Mapa da Violência 2012 é uma referência sobre o tema e revelou que, entre 1980 e 2010, mais de 92 mil mulheres foram assassinadas, sendo 43,7 mil só na última década – ou seja, em média, a cada 2 horas uma brasileira foi morta por condições violentas.

Além de grave, o número aumentou. Comparando-se o número de mortes no primeiro ano (1980) e no último (2010) do período estudado, os homicídios passaram de 1.353 para 4.465 – um aumento de assustadores 230%.

O Mapa da Violência mostrou ainda que é no ambiente doméstico que mais ocorrem as agressões contra as mulheres. No estudo, em 71,8% dos atendimentos registrados a violência aconteceu na residência da vítima e 41% das mortes femininas ocorreram dentro de casa. Em 42,5% dos casos, o agressor é o parceiro ou ex-parceiro da mulher. Na faixa entre os 20 e os 49 anos, esse percentual salta para 65%.

“São grupos familiares que, repetidamente, à revelia, violentam as mulheres e seguem como se nada tivesse acontecido”, frisa Jacobo. “Esse é um problema que tem que ser enfrentado, pois se trata de um grupo vulnerável, que legalmente deve ter proteção prioritária e está sendo oprimido”, complementa.

Uma certeza entre especialistas é que esses dados mostram que a violência doméstica é a maior motivadora dos feminicídios no Brasil. Para a juíza Adriana Ramos de Mello, do Tribunal de Justiça do Rio de Janeiro (TJRJ), “este é um problema muito sério. O Brasil está em 7º lugar no Mapa da Violência e grande parte desses assassinatos ocorre no âmbito doméstico e é fruto de uma sociedade patriarcal marcada pela desigualdade de poder nas relações”.

Diferentemente de outros países da América Latina nos quais o homicídio associado à violência sexual é o mais preocupante, no Brasil o homicídio por alguém que manteve ou mantém uma relação de afeto com a vítima é o mais alarmante. Em geral, o feminicídio é precedido por outras formas de violência e, portanto, poderia ser evitado.

“O feminicídio íntimo é um contínuo de violência. Antes de ser assassinada a mulher já passou por todo o ciclo de violência, na maior parte das vezes, e já vinha sofrendo muito tempo antes. A maioria dos crimes ocorre quando a mulher quer deixar o relacionamento e o homem não aceita a sua não subserviência”, explica a magistrada do Rio de Janeiro.

População avalia que risco de feminicídio é real'
})





# --------------------------------------------------------------------FORUM THEMES---------------------------------------------------------------------
# Initialize some default themes
ForumTheme.create({
  title: "Assédio",
  image_file: File.open("#{Rails.root}/app/assets/images/mina1.jpg"),
  description: "Encontre dicussões sobre assédio nos mais diferentes ambientes. Qual deve ser a conduta nesses casos e muito mais."
})

ForumTheme.create({
  title: "Violência Doméstica",
  image_file: File.open("#{Rails.root}/app/assets/images/mina2.jpg"),
  description: "Encontre discussões sobre violência dentro da própria casa, experiências, relatos e muito mais."
})

ForumTheme.create({
  title: "Preconceito",
  image_file: File.open("#{Rails.root}/app/assets/images/mina7.jpg"),
  description: "Encontre discussões sobre preconceito, suas vertentes, suas origens, histórias e muito mais."
})

ForumTheme.create({
  title: "Legislação",
  image_file: File.open("#{Rails.root}/app/assets/images/mina8.jpg"),
  description: "Casos jurídicos, direitos, as leis que te protegem, justiça, experiências, histórias e muito mais."
})

ForumTheme.create({
  title: "Experiências",
  image_file: File.open("#{Rails.root}/app/assets/images/mina3.jpg"),
  description: "Encontre discussões sobre diversas experiências, relatos e situações encontradas por mulheres no dia a dia."
})

ForumTheme.create({
  title: "Família",
  image_file: File.open("#{Rails.root}/app/assets/images/mina4.jpg"),
  description: "Filhos, diálogo, relacionamento, dependência financeira, afetiva e muito mais."
})

ForumTheme.create({
  title: "Ajuda",
  image_file: File.open("#{Rails.root}/app/assets/images/mina5.jpg"),
  description: "Precisa de ajuda? Encontre pessoas e instituições dispostas a ajudar anonimamente."
})

ForumTheme.create({
  title: "Outros",
  image_file: File.open("#{Rails.root}/app/assets/images/mina6.jpg"),
  description: "Vários outros temas em debate, perguntas, relatos e mais."
})
