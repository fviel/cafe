# cafe - Uma  aplicação Flutter para a gestão de pedidos de Café)

Aplicação flutter para a gestão de pedidos de café

## Funcionalidades

- Login por email e senha;
- Backeng usando Google Firebase;
- Vários exemplos de navegação;
- Exemplos de chamadas assíncronas a serviços;
- Sign anônimo com firebase
- Sign out

@fviel
12/03/2021


                   Provider
                     App
                      |
                  Wrapper (Stream)
                 /       \
    Authenticate           Home
        /      \        /        \   
    SignIn   Register  BrewList Settings

Provider é a forma de passar as mudanças de autenticação identificadas no Stream para o widget root,
o qual pode passar elas para os nós abaixo...
"provide a stream data to the root widget..."
"it's a google recomendation"
