CREATE OR REFRESH STREAMING LIVE TABLE bitcoin
TBLPROPERTIES ("quality" = "bronze")
AS

-- Lê os arquivos JSON da pasta RAW usando cloud_files (Auto Loader)
SELECT *
FROM cloud_files(
  '/Volumes/lakehouse/raw_public/coinbase/coinbase/bitcoin_spot/',  -- caminho de origem
  'json',
  map(
    'cloudFiles.includeExistingFiles', 'false',

    -- Detecta automaticamente o tipo das colunas (útil em JSON)
    'cloudFiles.inferColumnTypes', 'true',

    -- Permite adicionar novas colunas automaticamente (tem também o rescue)
    -- se o schema do JSON mudar no futuro
    'cloudFiles.schemaEvolutionMode', 'addNewColumns'
  )
);