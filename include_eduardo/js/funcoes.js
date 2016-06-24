      
     
      /** FUNÇÃO QUE ADICIONA UM VALOR PARA PRIORIDADE DE RASTREAMENTO */
      function submitData(data, id) {
        
        var strDados = $("#"+data).val()
        var intIdIndex = id
        var intRetorno = 0;
        
        $.ajax({
          url: 'config_fila_atualizar_prioridade.php?val_prioridade='+strDados+'&id_index='+id, //caminho do arquivo a ser executado
          dataType: 'html', //tipo do retorno
          type: 'post', //metodo de envio
          data: intRetorno, //valores enviados ao script
          beforeSend: function(){
              //função chamada antes de realizar o ajax
          },
          complete: function(){
              //função executada depois de terminar o ajax
              
          },
          success: function(data){
                  if(data == 1) {
                    $("#divAtualiza").html('<br><center><font color=red>Prioridade alterada!</font><a href="config_fila.php"> Atualizar lista</a></center><br>');
                  } else {
                    $("#divAtualiza").html('<br><center><font color=red>Erro ao atualizar prioridade!</font><a href="config_fila.php"> Reiniciar lista</a></center><br>');
                  }

              },
          error: function(xhr,er){
                  //tratamento de erro
          }
          
        });


        
      }