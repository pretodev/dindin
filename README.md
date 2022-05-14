![](https://i.imgur.com/xG74tOh.png)

# Flutter | Armazenamento Interno (Parte 1)  🏫

Uma dos usos mais comuns para **armazenamento interno** é guardar o token de acessos aos *endpoints* de uma API. Este token é importante para impedir que qualquer pessoa tenha acesso a dados sensíveis.

A seguinte API, tem a função de dar acesso a informações de uma conta de usuário. Ela possui o seguintes *Endpoints*:

**Retorna dados do usário, contendo o saldo da conta bancária**

> GET https://authapi.pretodev.repl.co/users/infos
>
> headers: Authorization="c2lsYXMyQGdtYWlsLmNvbQ=="
> 

**Realiza o login e retorna o TOKEN de acesso**

> POST https://authapi.pretodev.repl.co/login
> 
> body: `{"email": "email@emai", "password": "12345"}`


------

Estão cadastrado os seguintes usuários:

> usuário: **maria@gmail.com**   senha: **123456**
>
> usuário: **joao@gmail.com**   senha: **123456**

------

Sua missão nesta atividade:

- Criar o layout: https://www.figma.com/file/BdATaLZzMQ89lPdJkOjtL2/Dindin?node-id=0%3A1

- Realizar login do usuário e recuperar o token de acesso

- Armazenar o token do usuário

- Utilizar o token para acessar os dados do usuário

- Usar o token armazenado no próximo acesso ao APP

- Limpar o token quando o usuário fizer logout