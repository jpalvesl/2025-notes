> [!warning] # Objetos afetados em cascata


> [!todo] ## Cascata a partir da CV
> - **ecf/V_CADASTRO_CALC_AUTOMATICOS**
> 	- CadastroCalculosAutomaticosRepositoryImpl ==JAVA==
> 	- ecf/V_CONFIGURACAO_CALC_AUTOMATICOS
> 		- ecf/V_CADASTROS_DISPONIVEIS_CONFIGURAR
> 			- CadastrosDisponiveisConfiguracaoRepositoryImpl ==JAVA==
> 		- ecf/V_CONFIGURA_VALORES_AUTOMATICOS
> 			- ECF_VALORES_INCENTIVOS_CONFIG ==COMPLEMENTO -> Origem==
> 			- ecf/V_CONFIGURA_VALORES_PARTE_B
> 				- ECF_VALORES_INCENTIVOS_CONFIG ==COMPLEMENTO -> Origem==
> 	- ecf/V_INTERFACE_VALORES_CALCULADOS
> 		- ECF_CONFIG_AUTO_V_INCENTIVOS ==COMPLEMENTO -> Origem==
> 	- ecf/V_PREJUIZO_OPERACIONAL_AUTO
> 		- ECF_COMPENSACOES_LALUR_LACS ==COMPLEMENTO -> Origem==
> 	- ecf/V_VALORES_CALCULADOS
> 		- ValoresCalculadosRepositoryImpl ==JAVA==
> 		- ecf/V_CONFIGURA_VALORES_AUTOMATICOS
> 			- ecf/V_CONFIGURA_VALORES_PARTE_B
> 				- ECF_VALORES_INCENTIVOS_CONFIG ==COMPLEMENTO -> Origem==
> 			-  ECF_VALORES_INCENTIVOS_CONFIG ==COMPLEMENTO -> Origem==
> 		- ecf/V_INTERFACE_VALORES_CALCULADOS
> 			- ECF_CONFIG_AUTO_V_INCENTIVOS ==COMPLEMENTO -> Origem==
> 		- ECF_INCENTIVOS ==COMPLEMENTO -> Origem==
> 		- ECF_INCENTIVO_LUCRO_NAO_OP ==COMPLEMENTO -> Origem==
> 		- ECF_VALOR_LIMITE_COLETIVO ==COMPLEMENTO -> Origem==
> 		- /SYN/AJUSTA_LIMITE_COLETIVO ==PROCEDURE==
> - **ecf/V_CONTAS_PARTEB_DISPONIVEIS_CONFIGURAR**
> - **ecf/V_CONTAS_PARTEB_PROV_DISPONIVEIS_CONFIGURAR**
> 	- ContasConfiguradasParteBRepositoryImpl ==JAVA==
> - **ecf/V_CONTAS_PARTEB_SEM_LANCTO_NO_PERIODO**
> 	- /SYN/P_CRIA_LANCTOS_PARTE_B ==PROCEDURE==
> 		- ContasControleParteBrepositoryImpl
> - **ecf/V_CTRL_VENCTO_SALDOS_PARTE_B**
> 	- ControleVencimentoSaldosParteBRepositoryImpl ==JAVA==
> 	- ecf/V_SALDOS_RELATORIO_SINTETICO
> 	- /SYN/P_CTRL_VENCIMENTO_DO_PAT_PARTE_B ==PROCEDURE==
> 		- ContasControleParteBrepositoryImpl ==JAVA==
> - **ecf/V_LANCAMENTOS_ELALUR_LACS**
> 	- /SYN/P_CRIA_LANCTOS_PARTE_B ==PROCEDURE==
> 		- ContasControleParteBrepositoryImpl ==JAVA==
> 	- LanctoELacsLalurRepositoryImpl ==JAVA==
> - **ecf/V_LANCAMENTOS_SALDO_PARTEB_RELATORIO**
> - **ecf/V_SALDOS_CONTAS_CONFIGURADAS_TODAS**
> 	- ecf/V_LANCAMENTOS_SALDO_PARTEB_RELATORIO
> 	- ConfiguracaoEcfRepository ==JAVA==
> 	- ecf/V_BLOCO_M
> 		- ECF_BLOCO_M ==COMPLEMENTO -> ORIGEM==
> 	- ecf/V_BLOCO_N
> 		- ECF_BLOCO_N ==COMPLEMENTO -> ORIGEM==
> 	- ecf/V_CONFIG_BALANCETE_SUSPENSAO_DETALHADA
> 		- ApuracaoBalanceteRepositoryImpl ==JAVA==
> 		- ConfiguracoesBalanceteRepositoryImpl ==JAVA==
> 	- ecf/V_IMPOSTO_DIFERIDO_DETALHADO
> 		- ecf/V_CONFIG_BALANCETE_SUSPENSAO_DETALHADA
> 			- ConfiguracoesBalanceteRepositoryImpl ==JAVA==
> 			- ApuracaoBalanceteRepositoryImpl ==JAVA==
> 		- ImpostoDiferidoRepositoryImpl ==JAVA==
> 	- ecf/V_LANCAMENTOS_PARTEB_RELATORIO
> 		- ecf/V_LANCAMENTOS_SALDO_PARTEB_RELATORIO
> 	- /SYN/P_TRANSFERIR_SALDOS_PARTE_B ==PROCEDURE== 
> 		- ContasControleParteBRepository ==JAVA==
> - **ecf/V_SALDOS_PARTE_B**
> 	- ecf/V_SALDOS_RELATORIO_SINTETICO
> 	- SaldosParteBEcfRepositoryImpl ==JAVA==
> 	- ecf/V_BLOCO_M010
> 		- ECF_BLOCO_M010 ==COMPLEMENTO -> Origem==
> 	- ecf/V_CONFIGURA_VALORES_PARTE_B
> 		- ECF_VALORES_INCENTIVOS_CONFIG ==COMPLEMENTO -> Origem==
> 	- ecf/V_CONTAS_PARTEB_DISPONIVEIS_CONFIGURAR
> 	- ecf/V_CTRL_VENCTO_SALDOS_PARTE_B
> 		- ControleVencimentoSaldosParteBRepositoryImpl ==JAVA==
> 		- ecf/V_SALDOS_RELATORIO_SINTETICO
> 		- /SYN/P_CTRL_VENCIMENTO_DO_PAT_PARTE_B ==PROCEDURE==
> 			- ContasControleParteBrepositoryImpl ==JAVA==
> 	- ecf/V_PREJUIZO_OPERACIONAL_AUTO
> 		- ECF_COMPENSACOES_LALUR_LACS ==COMPLEMENTO -> Origem==
> 	- ecf/V_SALDOS_CONTAS_PARTEB_CONFIGURADAS
> 		- ContasConfiguradasParteBRepositoryImpl ==JAVA==
> 		- ImpostoDiferidoRepositoryImpl ==JAVA==
> 		- ecf/V_BLOCO_M
> 			- ECF_BLOCO_M ==COMPLEMENTO -> Origem==
> 		- ecf/V_BLOCO_N
> 			- ECF_BLOCO_B ==Complemento -> Origem==
> 		- ecf/V_CONFIG_BALANCETE_SUSPENSAO_DETALHADA
> 			- ApuracaoBalanceteRepositoryImpl ==JAVA==
> 			- ConfiguracoesBalanceteRepositoryImpl ==JAVA==
> 		- ecf/V_IMPOSTO_DIFERIDO_DETALHADO
> 			- ecf/V_CONFIG_BALANCETE_SUSPENSAO_DETALHADA
> 				- ConfiguracoesBalanceteRepositoryImpl ==JAVA==
> 				- ApuracaoBalanceteRepositoryImpl ==JAVA==
> 			- ImpostoDiferidoRepositoryImpl ==JAVA==
> 		- /SYN/P_TRANSFERIR_SALDOS_PARTE_B ==PROCEDURE==
> 	- ecf/V_SALDO_PARTE_B_N0
> 		- ecf/V_CONTAS_PARTEB_SEM_LANCTO_NO_PERIODO
> 			- /SYN/P_CRIA_LANCTOS_PARTE_B ==PROCEDURE==
> 		- /SYN/P_PERSISTE_SALDOS_PARTE_B ==PROCEDURE==
> 		- /SYN/P_TRANSFERIR_SALDO_INICIAL_B ==PROCEDURE==
> 	- /SYN/P_CTRL_VENCIMENTO_DO_PAT_PARTE_B ==PROCEDURE==
> 		- ContasControleParteBRepository ==JAVA==
> - **V_SALDOS_CONTAS_PADRAO_PARTE_B**
> 	- SaldoContaPadraoParteBrepositoryImpl ==JAVA==
> 	- SUMARIO_BLOCO_M ==COMPLEMENTO -> Origem==



> [!todo] ## Cascata a partir da Tabela
> - **ecf/V_CONTAS_CONTROLE_PARTE_B** ==Callout acima==
> 	- ContasControleParteBRepositoryImpl ==JAVA==
> - **ecf/V_CONTAS_CONTROLE_SALDOS**
> 	- /SYN/P_TRANSFERIR_SALDO_INICIAL_B ==PROCEDURE==
> - **ecf/V_CRITICAS_PARTEB_PARTEA**
> 	- CRITICAS_ECF_PARTEB_PARTEA ==COMPLEMENTO -> Origem==
> - **ecf/V_CRITICA_SALDO_CONTA_CONTROLE**
> 	- CRITICAS_ECF ==COMPLEMENTO -> Origem==
> - **ecf/V_IDENTIFICACAO_CONTA_PARTE_B** e **V_IDENTIFICACAO_CONTA_PARTE_B_BACKUP**
> 	- IdentContaParteBRepositoryImpl ==JAVA==
> - **ecf/V_LANCAMENTOS_PARTEB_RELATORIO**
> 	- ecf/V_LANCAMENTOS_SALDO_PARTE_B_RELATORIO
> - **ecf/V_MOV_SALDO_INICIAL_PARTE_B**
> 	- ECF_TRANSFERE_SALDO_INICIAL ==COMPLEMENTO -> Origem==
> - **CRITICAS_ECF** ==COMPLEMENTO==
> 	- EtapasApuracaoProcess ==JAVA==
> - **/SYN/P_TRANSFERIR_SALDOS_PARTE_B** ==PROCEDURE==
> 	- ContasControleParteBRepositoryImpl ==JAVA==
